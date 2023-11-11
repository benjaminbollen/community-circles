struct Avatar {
    id: Field,
    circleRoot: Field,
}

// Points on the circle form the cirle for an Avatar
// Id's on the circle trust the avatar, and accept 
struct CirclePoint {
    id: Field,
    amount: u64, // implement radix 64.64 as signed int128 64.64 later
}

fn main(
    flowMatrix: [[i64; 3]; 3],
    y: pub Field
) {
    
}

#[test]
fn test_main() {
    main(1, 2);

    // Uncomment to make test fail
    // main(1, 1);
}
