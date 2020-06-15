album_lists = [
    
]

album_lists.each do | title,
                      description,
                      cover,
                      price,
                      released,
                      buylink,
                      format,
                      brief_description,
                      is_live|
  Album.create( title: title,
                description: description,
                cover: cover,
                price: price,
                released: released,
                buylink: buylink,
                format: format,
                brief_description: brief_description,
                is_live: is_live)

end