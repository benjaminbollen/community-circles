use dep::std;

fn main(
    inputOrigin: pub [u8; 64],
    sourceLocusPubKeyX: [u8; 32],
    sourceLocusPubKeyY: [u8; 32],
    targetLocusPubKeyX: pub [u8; 32],
    targetLocusPubKeyY: pub [u8; 32],
    signatureTargetLocus: [u8; 64],
    sourceDos: Field,
    // verification_key: [Field; 114],
    // proof: [Field; 94],
    // key_hash: Field, 
    // input_aggregation_object: [Field; 16],
) -> pub (Field, [u8; 64]) {

    // target dos is one farther from source locus dos
    let targetDos = sourceDos + 1;

    let mut targetLocusPubKey: [u8; 64] = [0; 64];
    for i in 0..32 {
        targetLocusPubKey[i] = targetLocusPubKeyX[i];
        targetLocusPubKey[i + 32] = targetLocusPubKeyY[i];
    }

    let sourceKey = std::ecdsa_secp256k1::verify_signature(
        sourceLocusPubKeyX, sourceLocusPubKeyY,
        signatureTargetLocus, targetLocusPubKey.as_slice()
    );

    let outputOrigin = inputOrigin;

    // // start recursive proof of dos so far
    // // first constrain public inputs from current to previous proof
    // let mut public_inputs : [Field; 129] = [0; 129];
    // // 64 bytes of input origin pubkey
    // for i in 0..64 {
    //     public_inputs[i] = inputOrigin[i];
    // }
    // // one byte for the previous dos as "return" value for verifier
    // public_inputs[64] = 
    // //     [inputOrigin, sourceLocusPubKeyX, sourceLocusPubKeyY, sourceDos];

    // let output_aggregation_object = std::verify_proof(
    //     verification_key.as_slice(),
    //     proof.as_slice(),
    //     public_inputs.as_slice(),
    //     key_hash,
    //     input_aggregation_object,
    // );

    // let mut output = [0; 16];
    // for i in 0..16 {
    //     output[i] = output_aggregation_object[i];
    // }

    (targetDos, outputOrigin)
}

// #[test]
// fn test_main() {
//     main(1, 2);

// }
