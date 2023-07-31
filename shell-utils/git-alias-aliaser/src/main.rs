fn main() {
    git2::Config::open_default()
        .unwrap()
        .entries(Some("alias"))
        .unwrap()
        .for_each(|e| {
            let short_alias = e.name().unwrap().get(6..).unwrap();
            println!("alias g{}=\"g {}\"", &short_alias, &short_alias);
        })
        .unwrap();
}
