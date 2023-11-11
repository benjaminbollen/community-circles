use dep::std;

fn main(
    inputOrigin: pub Field,
    sourceLocus: Field,
    targetLocus: pub Field,
    sourceDos: Field,
    verification_key: [Field; 114],
    proof: [Field; 94],
    // public_inputs : [Field; 3],
    key_hash: Field, 
    input_aggregation_object: [Field; 16],
) -> pub (Field, [Field; 16]) {

    let targetDos = sourceDos + 1;
    let public_inputs : [Field; 3] = [inputOrigin, sourceLocus, sourceDos];

    let output_aggregation_object = std::verify_proof(
        verification_key.as_slice(),
        proof.as_slice(),
        public_inputs.as_slice(),
        key_hash,
        input_aggregation_object,
    );

    let mut output = [0; 16];
    for i in 0..16 {
        output[i] = output_aggregation_object[i];
    }
    (targetDos, output)
}

// #[test]
// fn test_main() {
//     main(1, 2);

// }
