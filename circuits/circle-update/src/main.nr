use dep::std::hash::pedersen_hash;

global DEPTH = 16;
global AMOUNT : u32 = 10;
// CirclePoint can be serialized into three field elements
global CIRCLE_POINT_LENGTH = 3;
// along a path a node can branch into maximally 5 flow edges
global MAX_BRANCH = 5;

struct CirclePoint {
    id: u16,
    trustsCenter: bool,
    balance: u32, // can be mapped into one field element
}

impl CirclePoint {
    fn new(id: u16) -> CirclePoint {
        CirclePoint {
            id,
            trustsCenter: true,
            balance: AMOUNT,
        }
    }

    fn new_empty() -> CirclePoint {
        CirclePoint {
            id: 0,
            trustsCenter: false,
            balance: 0,
        }
    }

    fn serialize(self) -> [Field; CIRCLE_POINT_LENGTH] {
        [
            self.id as Field,
            self.trustsCenter as Field,
            self.balance as Field,
        ]
    }

    fn hash(self) -> Field {
        pedersen_hash(self.serialize())
    }
}

fn main(
    circle_root_before: Field,
    circle_root_after: Field,
    points: [CirclePoint; MAX_BRANCH],
    indices: [Field; MAX_BRANCH],
    merkle_paths: [[Field; DEPTH]; MAX_BRANCH],
    transfers_amounts: [i32; MAX_BRANCH],
) {

}

// #[test]
// fn test_main() {
//     main(1, 2);

//     // Uncomment to make test fail
//     // main(1, 1);
// }
