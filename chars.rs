trait IsBlank {
    fn is_blank(&self) -> bool;
}

impl IsBlank for String {
    fn is_blank(&self) -> bool {
        self.chars().all(|c| c.is_whitespace())
    }
}

fn main() {
    let s = String::from("Привет");

    println!("is s blank? {}", s.is_blank());

    let s = String::new();

    println!("is s blank? {}", s.is_blank());
}
