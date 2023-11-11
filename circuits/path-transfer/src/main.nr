const DEPTH = 2;
const PATH_SIZE = 4;

struct Avatar {
    id: Field,
    pubKeyX: [u8; 32],
    pubKeyY: [u8; 32],
    circleRoot: Field,
}

// Points on the circle form the cirle for an Avatar
// Id's on the circle trust the avatar, and accept 
struct CirclePoint {
    id: Field,
    trustExpiry: Field,
    amount: u64, // implement radix 64.64 as signed int128 64.64 later
}

// Single path transfer proof without recursion
fn main(
    community_root_before: Field,
    community_root_after: Field,
    participants_indices: [Field; PATH_SIZE],
    participants_hash_paths: [[Field; DEPTH]; PATH_SIZE], // in simple example of 4 participants this is super redundant
    participants_avatars: [Avatar; PATH_SIZE],
    
    // sender transaction
    sender_pub_key_x: [u8; 32],
    sender_pub_key_y: [u8; 32],
    receiver_id: Field,
    amount_sent: u64,
    signature: [u8; 64],
    flow_matrix: [[i64; PATH_SIZE]; PATH_SIZE],



) {
    let mut row_sum: [i64; 3] = [0; 3];
    let mut column_sum: [i64; 3] = [0; 3];

    for i in 0..3 {
        for j in 0..3 {
            row_sum[i] += flow_matrix[i][j];
            column_sum[j] += flow_matrix[i][j];
        }
    }

    // the rows indicate 

    
}

#[test]
fn test_main() {
    main(1, 2);

    // Uncomment to make test fail
    // main(1, 1);
}
