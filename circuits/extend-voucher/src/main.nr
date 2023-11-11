use dep::std;

fn main(
    verificationKeyTrajectory: [Field; 114],
    proofTrajectory: [Field; 94],
    keyHashTrajectory: Field, 
    publicInputsTrajectory: [Field; 1],
    inputAggregationObject: [Field; 16],
    verificationKeyExtension: [Field; 114],
    proofExtension: [Field; 94],
    keyHashExtension: Field,
    publicInputsExtension: [Field; 1] 
) -> pub (Field) {
    // compute the trajectory recursion proof
    let outputAggregationObject = std::verify_proof(
        verificationKeyTrajectory.as_slice(), proofTrajectory.as_slice(), publicInputsTrajectory.as_slice(), keyHashTrajectory, inputAggregationObject
    );

    (1)
}

// #[test]
// fn test_main() {
//     main(1, 2);
//     // Uncomment to make test fail
//     // main(1, 1);
// }
