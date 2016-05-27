authors = [

[ "Mark Twain", "United States",
%{
Samuel Langhorne Clemens, better known by his pen name Mark Twain, was an American author and humorist.

Grew up in Hannibal, Missouri, later the setting for Huckleberry Finn and Tom Sawyer. Apprenticed with a printer. Worked as a typesetter and contributed articles to his older brother Orion's newspaper.  Became a master riverboat pilot on the Mississippi River, before heading west to join Orion.  Was a failure at gold mining, so turned to journalism.

}],

[ "Ernest Hemmingway" , "United States",
%{
Ernest Miller Hemingway was an American author and journalist. His economical and understated style had a strong influence on 20th-century fiction, while his life of adventure and his public image influenced later generations. Hemingway produced most of his work between the mid-1920s and the mid-1950s, and won the Nobel Prize in Literature in 1954.

}],

]

authors.each do | name, country, bio |
   Author.create( name: name, country: country, bio: bio )
end

author_novels = {}

author_novels["Mark Twain"] = [

   [ "The Adventures of Tom Sawyer",
     1876, "http://csmt.cde.ca.gov/images/0030544610.jpg",
     "Adventures of a young boy and his friends growing up in a small Missouri town on the banks of the Mississippi River in the nineteenth century."
   ],

   [ "A Connecticut Yankee in King Arthur's Court",
     1889, "https://img1.etsystatic.com/000/0/6648867/il_fullxfull.333586431.jpg",
     "A nineteenth-century American travels back in time to sixth-century England"
   ],
]


author_novels["Ernest Hemmingway"] = [

   [ "The Old Man and the Sea",
     1952, "http://7summitsproject.com/wp-content/uploads/2015/06/old-man-and-the-sea-review.jpg",
     "Old Cuban fisherman sails further out to sea than usual in attempt to better his luck."
   ],

   [ "A Farewell to Arms",
     1929, "https://kuwwi.files.wordpress.com/2015/07/farewell-to-arms-people.jpg",
     "Young American WW1 soldier in Italy is injured and cared for by English nurse's aide."
   ],

   [ "For Whom the Bell Tolls",
     1940, "http://1.bp.blogspot.com/-hgJGEoU-cuw/Tz6t7RmvjqI/AAAAAAAACug/NFuuUzkTJc4/s1600/forwhom.jpg",
     "American joins guerrillas in the Spanish Civil war."
   ],
]

author_novels.each do | author_name, novels |
   author = Author.find_by( name: author_name )

   novels.each do | title, year, cover, plot |
      Novel.create( title:title, author_id: author.id, year: year, cover: cover, plot: plot )

   end
end

genres = [
   "Absurdist",
   "Bildungsroman",
   "Action",
   "Adventure",
   "Comedy",
   "Crime",
   "Drama",
   "Fantasy",
   "Family",
   "Historical",
   "Horror",
   "Magical Realism",
   "Mystery",
   "Paranoid",
   "Philosophical",
   "Political",
   "Romance",
   "Saga",
   "Satire",
   "Science Fiction",
   "Speculative",
   "Surreal",
   "Thriller",
   "Urban",
   "Western",
]

genres.each do |genre_name|
   genre = Genre.create( name: genre_name )
end

author_novels["Leo Tolstoy"] = [
   [ "War and Peace",
     1869, "http://i.huffpost.com/gen/997213/images/o-WAR-AND-PEACE-facebook.jpg",
     "History of the French invasion of Russia, and the impact of the Napoleonic era on Tsarist society, through the stories of five Russian aristocratic families.",
     "War, Drama, Historical, Philosophical, Realism, Family, Romance" ],

   [ "Anna Karenina",
     1877, "https://s-media-cache-ak0.pinimg.com/736x/1b/0b/0a/1b0b0a9852b0eb2d48648d05e9f7f695.jpg",
     "St. Petersburg aristocrat's life story at the backdrop of the late-19th-century feudal Russian society.",
     "Family, Drama, Romance, Tragedy, Realism, Psychological" ],

   [ "The Death of Ivan Ilych",
     1886, "https://s-media-cache-ak0.pinimg.com/736x/b4/2c/78/b42c786e8bb5eb170785a9d2ff64b7b1.jpg",
     "A worldly careerist, a high court judge who has never given the inevitability of his dying so much as a passing thought until one day, death announces itself, and to his shocked surprise, he is brought face to face with his own mortality.",
     "Realism, Satire, Parody, Exemplum, Satire" ],
]

author_novels.each do | author_name, novel |
   author = Author.find_by( name: author_name )

   novels.each do | title, year, cover, plot, genres |
      novel = Novel.create( title:title, author_id: author.id, year: year, cover: cover, plot: plot )

      genres.split( ", ").each do |genre_name|
         if genre = Genre.find_by( name: genre_name )
         else
            genre = Genre.create( name: genre_name )
         end

         GenresNovels.create( novel: novel, genre: genre )
      end
   end
end
