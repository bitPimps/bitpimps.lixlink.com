# phpMyAdmin MySQL-Dump
# version 2.2.4
# http://phpwizard.net/phpMyAdmin/
# http://phpmyadmin.sourceforge.net/ (download page)
#
# Host: localhost
# Generation Time: Jun 03, 2004 at 12:32 AM
# Server version: 3.23.37
# PHP Version: 4.3.6
# Database : `lixlink`
# --------------------------------------------------------

#
# Table structure for table `myMovies`
#

CREATE TABLE myMovies (
  id int(11) NOT NULL auto_increment,
  catId int(11) NOT NULL default '1',
  movieTitle text NOT NULL,
  movieLength text NOT NULL,
  ratingId int(11) NOT NULL default '1',
  movieStars text NOT NULL,
  active text NOT NULL,
  PRIMARY KEY  (id)
) TYPE=MyISAM;

#
# Dumping data for table `myMovies`
#

INSERT INTO myMovies (id, catId, movieTitle, movieLength, ratingId, movieStars, active) VALUES (1, 9, 'Boiler Room', '120', 1, 'Giovanni Ribisi, Vin Diesel, Nia Long, Nicky Katt', '1'),
(2, 7, 'Blade', '120', 1, 'Wesley Snipes, Stephen Dorff', '1'),
(3, 1, 'Bad Boys', '119', 1, 'Will Smith, Martin Lawrence', '1'),
(4, 9, 'Assassins', '133', 1, 'Sylvester Stallone, Antonio Banderas', '1'),
(5, 4, 'Stuart Saves His Family', '97', 3, 'Al Franken, Laura San Giacomo', '1'),
(6, 4, 'Big Momma\\\'s House', '98', 3, 'Martin Lawrence', '1'),
(7, 4, 'Big Daddy', '93', 3, 'Adam Sandler', '1'),
(8, 4, 'The Big Lebowski', '98', 1, 'Jeff Bridges, John Goodman, Julianne Moore, Steve Buscemi, John Turturro', '1'),
(9, 3, 'Bed Of Roses', '88', 4, 'Christian Slater, Mary Stuart Masterson', '1'),
(10, 5, 'American Beauty', '122', 1, 'Kevin Spacey, Annette Bening', '1'),
(11, 1, 'Bait', '119', 1, 'Jamie Foxx', '1'),
(12, 4, 'Austin Powers: International Man Of Mystery', '90', 3, 'Mike Meyers, Elizabeth Hurley', '1'),
(13, 4, 'Analyze This', '104', 1, 'Robert Deniro, Billy Crystal, Lisa Kudrow', '1'),
(14, 5, 'Any Given Sunday', '157', 1, 'Al Pacino, Dennis Quaid, Jamie Foxx, Cameron Diaz, James Woods, LL Cool J', '1'),
(15, 4, 'Austin Powers: The Spy Who Shagged Me', '*', 3, 'Mike Meyers, Heather Graham', '1'),
(16, 5, 'The Bonfire Of The Vanities', '126', 1, 'Tom Hanks, Bruce Willis, Melanie Griffith', '1'),
(17, 5, 'Almost Famous', '123', 1, 'Kate Hudson, Billy Crudup, Frances McDormand, Philip Seymour Hoffman', '1'),
(18, 5, 'Traffic', '147', 1, 'Michael Douglas, Don Cheadle, Benicio Del Toro, Dennis Quaid, Catherine Zeta-Jones', '1'),
(19, 5, 'Braveheart', '177', 1, 'Mel Gibson, Sophie Marceau', '1'),
(20, 4, 'Bowfinger', '97', 3, 'Eddie Murphy, Steve Martin', '1'),
(21, 5, 'The Basketball Diaries', '102', 1, 'Leonard DiCaprio, Mark Wahlberg, Bruno Kirby, Lorraine Bracco', '1'),
(22, 4, 'Beetlejuice', '92', 4, 'Michael Keaton, Geena Davis, Alec Baldwin, Winona Ryder, Sylvia Sidney', '1'),
(23, 5, 'The Beach', '*', 1, 'Leonardo DiCaprio, Virginie Ledoyen', '1'),
(24, 1, 'Blue Streak', '94', 3, 'Martin Lawrence, Luke Wilson, Dave Chappelle', '1'),
(25, 1, 'Batman', '126', 3, 'Jack Nicholson, Michael Keaton, Kim Basinger', '1'),
(26, 1, 'Batman Returns', '126', 3, 'Michael Keaton, Danny DeVito, Michelle Pfeiffer', '1'),
(27, 1, 'Batman Forever', '122', 3, 'Val Kilmer, Tommy Lee Jones, Jim Carrey, Nichole Kidman, Chris O\\\'Donnell', '1'),
(28, 1, 'Batman & Robin', '125', 3, 'Arnold Schwarzenegger, George Clooney, Chris O\\\'Donnell, Uma Thurman, Alicia Silverstone', '1'),
(29, 3, 'Down To You', '92', 3, 'Freddie Prinze Jr., Julia Stiles', '1'),
(30, 4, 'Drowning Mona', '96', 3, 'Danny DeVito, Bette Midler, Neve Campbell, Jamie Lee Curtis', '1'),
(31, 2, 'Dr. Seuss\\\'s How The Grinch Stole Christmas!', '60', 5, 'Grinch', '1'),
(32, 4, 'Dumb And Dumber', '106', 3, 'Jim Carrey, Jeff Daniels', '1'),
(33, 2, 'Frosty The Snowman', '70', 5, 'Frosty', '1'),
(34, 4, 'Dogma', '128', 1, 'Ben Affleck, Matt Damon, Linda Fiorentino, Salma Hayek, Jason Lee, Jason Mewes, Allan Rickman, Chris Rock, Kevin Smith', '1'),
(35, 5, 'As Good As It Gets', '139', 3, 'Jack Nicholson, Helen Hunt, Greg Kinnear', '1'),
(36, 9, 'Final Destination', '98', 1, 'Devon Sawa, Ali Larter, Kerr Smith', '1'),
(37, 9, 'The Firm', '154', 1, 'Tom Cruise, Jeanne Tripplehorn, Gene Hackman, Ed Harris, Holly Hunter', '1'),
(38, 4, 'Four Rooms', '98', 1, 'Tim Roth, Antonio Bandaras, Jennifer Beals, Paul Calderon, Sammi Davis, Madonna, Valeria Golino, David Proval, Ione Skye, Lilli Taylor, Marisa Tomei, Tamlyn Tomita', '1'),
(39, 6, 'From Dusk Till Dawn', '108', 1, 'Harvey Keitel, George Clooney, Quentin Tarantino, Juliette Lewis, Salma Hayek, Cheech Marin', '1'),
(40, 6, 'Fargo', '98', 1, 'Frances McDormand, William H Macy, Steve Buscemi, Harve Presnell', '1'),
(41, 5, 'The Fan', '116', 1, 'Robert DeNiro, Wesley Snipes', '1'),
(42, 1, 'Face / Off', '140', 1, 'John Travolta, Nicolas Cage, Joan Allen, Gina Gershon', '1'),
(43, 4, 'Ace Ventura: Pet Detective', '87', 3, 'Jim Carrey, Sean Young, Courtney Cox, Tone Loc, Dan Marino', '1'),
(44, 9, 'The Fugitive', '131', 3, 'Harrison Ford, Tommy Lee Jones, Sela Ward, Joe Pantoliano', '1'),
(45, 1, 'Full Metal Jacket', '116', 1, 'Matthew Modine, Adam Baldwin, Vincent D\\\'onofrio', '1'),
(46, 9, 'Enemy Of The State', '132', 1, 'Will Smith, Gene Hackman, John Voight, Regina King, Barry Pepper', '1'),
(47, 6, '8MM', '123', 1, 'Nicolas Cage, Joaquin Phoenix, James Gandolfini', '1'),
(48, 1, 'Eraser', '115', 1, 'Arnold Schwarzenegger, James Caan, Vanessa Williams', '1'),
(49, 5, 'Erin Brockovich', '132', 1, 'Julia Roberts, Albert Finney, Arron Eckhart', '1'),
(50, 1, 'Desperado', '103', 1, 'Antonio Bandaras, Salma Hayek, Steve Buscemi, Cheech Marin, Quentin Tartantino', '1'),
(51, 4, 'Deuce Bigalow Male Gigolo', '88', 1, 'Rob Schneider,William Forsythe, Eddie Griffin', '1'),
(52, 5, 'Corrina, Corrina', '115', 4, 'Whoopi Goldberg, Ray Liotta', '1'),
(53, 7, 'Contact', '150', 4, 'Jodie Foster, Matthew McConaughhey, James Woods, John Hurt', '1'),
(54, 5, 'Casino', '179', 1, 'Robert DiNiro, Sharon Stone, Joe Pesci, Don Rickles, Alan King, Kevin Pollak', '1'),
(55, 6, 'The Cell', '107', 1, 'Jennifer Lopez, Vince Vaughn, Vincent D\\\'Onfrio', '1'),
(56, 4, 'Clueless', '97', 3, 'Alicia Silverstone, Brittany Murphy, Justin Walker, Paul Rudd, Stacey Dash', '1'),
(57, 4, 'Clerks', '92', 1, 'Kevin Smith, Jason Mewes, Jeff Anderson, Scott Mosier, Marilyn Ghigliotti, Lisa Spoonhauer', '1'),
(58, 4, 'A Christmas Story', '98', 4, 'Melinda Dillon, Darren McGavin, Peter Billingsley', '1'),
(59, 4, 'Chasing Amy', '113', 1, 'Kevin Smith, Ben Affleck, Jason Lee, Jason Mewes, Joey Lauren Adams, Dwight Ewell', '1'),
(60, 1, 'Demolition Man', '115', 1, 'Sylvester Stallone, Wesley Snipes, Sandra Bullock, Nigel Hawthorne', '1'),
(61, 4, 'Dazed And Confused', '103', 1, 'Jason London, Joey Lauren Adams, Milla Jovovich, Rory Cochrane, Marissa Ribisi', '1'),
(62, 5, 'A Bronx Tale', '122', 1, 'Robert DeNiro, Chazz Palminteri', '1'),
(63, 4, 'Caddyshack', '99', 1, 'Chevy Chase, Rodney Dangerfield, Ted Knight, Michael O\\\'Keefe, Bill Murray', '1'),
(64, 5, 'Clockers', '129', 1, 'Harvey Keitel, John Turturro, Delroy Lindo, Mekhi Phifer, Isaiah Washington', '1'),
(65, 2, 'Charlie Brown: A Charlie Brown Christmas', '25', 5, 'Charlie Brown', '1'),
(66, 2, 'Charlie Brown: A Charlie Brown Thanksgiving', '30', 5, 'Charlie Brown', '1'),
(67, 2, 'Charlie Brown: It\\\'s The Great Pumpkin, Charlie Brown', '25', 5, 'Charlie Brown', '1'),
(68, 1, 'Die Hard: Die Hard', '132', 1, 'Bruce Willis, Alan Rickman, Bonnie Bedelia', '1'),
(69, 1, 'Die Hard: Die Hard 2', '124', 1, 'Bruce Willis, Bonnie Bedelia, William Atherton', '1'),
(70, 1, 'Die Hard: Die Hard With A Vengeance', '131', 1, 'Bruce Willis, Jeremy Irons, Samuel L. Jackson', '1'),
(71, 5, 'A Beautiful Mind', '136', 3, 'Russell Crowe, Jennifer Connelly, Paul Bettany, Adam Goldberg, Judd Hersch', '1'),
(72, 3, 'Sleepless in Seatle', '105', 4, 'Tom Hanks, Meg Ryan', '1'),
(73, 1, 'Spider-Man', '121', 3, 'Tobey Maguire, Willem Dafoe, Kristen Dunst, James Franco', '1'),
(74, 9, 'Minority Report', '146', 3, 'Tom Cruise, Colin Farrell, Samantha Morton, Max Von Sydow', '1'),
(75, 7, 'Harry Potter And The Sorcerer\\\'s Stone', '152', 4, 'Daniel Radcliffe, Rupert Grint, Emma Watson, John Cleese, Robbie Coltrane, Warwick Davis, Richard Griffiths, Richard Harris, Ian Hart, John Hurt, Alan Rickman, Fiona Shaw, Maggie Smith, Julie Walters', '1'),
(76, 4, 'Old School (Unrated And Out Of Control)', '92', 1, 'Luke Wilson, Will Ferrell, Vince Vaughn', '1'),
(77, 4, 'Money Talks', '95', 1, 'Chris Tucker, Charlie Sheen, Heather Locklear, Gerard Ismael, Paul Sorvino', '1'),
(78, 1, 'Charlie\\\'s Angels', '99', 3, 'Cameron Diaz, Drew Barrymore, Lucy Liu, Bill Murray, Sam Rockwell, Tim Curry, Kelly Lynch, Crispin Glover', '1'),
(79, 1, 'The Lord Of The Rings: The Two Towers', '179', 3, 'Elijah Wood, Ian McKellen, Liv Tyler, Viggo Mortensen, Sean Astin, Cate Blanchett', '1'),
(80, 9, 'Insomnia', '118', 1, 'Al Pacino, Robin Williams, Hilary Swank', '1'),
(81, 9, 'Phone Booth', '81', 1, 'Colin Ferrell, Forest Whitaker, Kiefer Sutherland, Katie Holmes', '1'),
(82, 6, 'Identity', '90', 1, 'John Cusack, Ray Liotta, Amanda Peet', '1'),
(83, 1, '007: Die Another Day', '132', 3, 'Pierce Brosnan, Halle Berry, Toby Stephens, John Cleese', '1'),
(84, 8, 'Sex And The City 1: The Complete First Season (2 Discs)', '300', 1, 'Sarah Jessica Parker, Cynthia Nixon, Kim Cattrall, Kristin Davis', '1'),
(85, 8, 'Sex And The City 2: The Complete Second Season (3 Discs)', '540', 1, 'Sarah Jessica Parker, Cynthia Nixon, Kim Cattrall, Kristin Davis', '1'),
(86, 8, 'Sex And The City 3: The Complete Third Season (3 Discs)', '540', 1, 'Sarah Jessica Parker, Cynthia Nixon, Kim Cattrall, Kristin Davis', '1'),
(87, 8, 'Sex And The City 4: The Complete Fourth Season (3 Discs)', '540', 1, 'Sarah Jessica Parker, Cynthia Nixon, Kim Cattrall, Kristin Davis', '1'),
(88, 8, '24: Season One (6 Discs)', '1152', 1, 'Kiefer Sutherland', '1'),
(89, 8, 'The Sopranos 1: The Complete First Season (3 Discs)', '680', 1, 'James Gandolfini, Lorraine Bracco, Edie Falco, Michael Imperioli, Dominic Chianese, Vincent Pastore', '1'),
(90, 8, 'The Sopranos 2: The Complete Second Season (4 Discs)', '696', 1, 'James Gandolfini, Lorraine Bracco, Edie Falco, Michael Imperioli, Dominic Chianese, Vincent Pastore', '1'),
(91, 8, 'The Sopranos 3: The Complete Third Season (4 Discs)', '780', 1, 'James Gandolfini, Lorraine Bracco, Edie Falco, Michael Imperioli, Dominic Chianese, Vincent Pastore', '1'),
(92, 8, 'The X-Files 1: The Complete First Season (6 Discs)', '*', 4, 'David Duchovny, Gillian Anderson, Robert Patrick', '1'),
(93, 8, 'The X-Files 2: The Complete Second Season (6 Discs)', '*', 4, 'David Duchovny, Gillian Anderson, Robert Patrick', '1'),
(94, 8, 'The X-Files 3: The Complete Third Season (6 Discs)', '*', 4, 'David Duchovny, Gillian Anderson, Robert Patrick', '1'),
(95, 8, 'The X-Files 4: The Complete Fourth Season (6 Discs)', '*', 4, 'David Duchovny, Gillian Anderson, Robert Patrick', '1'),
(96, 8, 'The X-Files 5: The Complete Fifth Season (5 Discs)', '*', 4, 'David Duchovny, Gillian Anderson, Robert Patrick', '1'),
(97, 8, 'The X-Files 6: The Complete Sixth Season (6 Discs)', '*', 4, 'David Duchovny, Gillian Anderson, Robert Patrick', '1'),
(98, 4, 'Austin Powers: Gold Member', '94', 3, 'Mike Myers, Beyonce Knowles, Michael Caine, Verne Troyer, Seth Green', '1'),
(99, 3, 'Grease', '110', 4, 'John Travolta, Oliva Newton-John', '1'),
(100, 7, 'Star Wars: Episode II - Attack Of The Clones', '142', 4, 'Ewan McGreggor, Natalie Portman, Hayden Christensen, Samuel L. Jackson', '1'),
(101, 4, 'Me, Myself & Irene', '116', 1, 'Jim Carrey, Renee Zellweger', '1'),
(102, 7, 'E.T. The Extra-Terrestrial ', '121', 4, 'Henry Thomas, Dee Wallace-Stone, Robert MacNaughton, Drew Barrymore, C. Thomas Howell', '1'),
(103, 2, 'Shrek', '93', 4, 'Mike Myers, Eddie Murphy, Cameron Diaz, John Lithgow', '1'),
(104, 5, 'Dr. Seuss\\\' How The Grinch Stole Christmas (Non-Animated)', '105', 4, 'Jim Carrey, Jeffrey Tambor, Christine Baranski, Molly Shannon', '1'),
(105, 1, 'Lara Croft Tomb Raider', '100', 3, 'Angelina Jolie, Jon Voight, Ian Glen, Noah Taylor', '1'),
(106, 4, 'The Rocky Horror Picture Show', '100', 1, 'Tim Curry, Susan Sarandon, Barry Bostwick', '1'),
(107, 4, 'American Pie 2 (Unrated)', '111', 1, 'Jason Biggs, Shannon Elizabeth, Alyson Hannigan, Chris Klein, Seann William Scott', '1'),
(108, 5, 'Lord Of The Flies', '90', 1, 'Balthazar Getty, Chris Furrh', '1'),
(109, 4, 'Drawing Flies', '76', 1, 'Jason Lee, Jason Mewes, Joey Lauren Adams, Ren&eacute;e Humphrey, Carmen Lee', '1'),
(110, 6, 'The Hitcher', '98', 1, 'Rutger Hauer, C. Thomas Howell, Jennifer Jason Leigh', '1'),
(111, 4, 'Ocean\\\'s Eleven', '117', 3, 'George Clooney, Bernie Mac, Brad Pitt, Elliot Gould, Casey Affleck, Julia Roberts, Andy Garcia, Matt Damon, Carl Reiner', '1'),
(112, 4, 'Zoolander', '89', 3, 'Will Ferrell, Ben Stiller, Owen Wilson, Christine Taylor', '1'),
(113, 1, 'Swordfish', '99', 1, 'John Travolta, Hugh Jackman, Halle Berry, Don Cheadle, Sam Shepard', '1'),
(114, 4, 'Scary Movie 2', '82', 1, 'Shawn Wayans, Marlon Wayans, Regina Hall, Tori Spelling, Tim Curry, David Cross, Chris Elliot, James Woods', '1'),
(115, 4, 'Shallow Hal', '113', 3, 'Jack Black, Gwyneth Paltrow, Jason Alexander', '1'),
(116, 2, 'Osmosis Jones', '95', 4, 'Bill Murray, Laurence Fishburne, Chris Rock, David Hyde Pierce, Chris Elliot', '1'),
(117, 1, 'The Score', '124', 1, 'Robert DeNiro, Edward Norton, Angela Bassett, Marlon Brando', '1'),
(118, 5, 'Training Day', '120', 1, 'Denzel Washington, Ethan Hawke, Scott Glenn, Tom Berenger, Dr. Dre, Snoop Dogg, Macy Gray', '1'),
(119, 5, 'Rock Star', '105', 1, 'Mark Wahlberg, Jennifer Aniston', '1'),
(120, 4, 'Orange County', '82', 3, 'Jack Black, Colin Hanks, Schuyler Fisk, Catherine O\\\'Hara, John Lithgow, Harold Ramis, Lily Tomlin', '1'),
(121, 4, 'Death To Smoochy', '109', 1, 'Robin Williams, Edward Norton, Danny DeVito', '1'),
(122, 4, 'Jay And Silent Bob Strike Back', '104', 1, 'Ben Affleck, Shannon Elizabeth, Will Ferrell, Jason Lee, Jason Mewes, Chris Rock', '1'),
(123, 9, 'The Sum Of All Fears', '123', 3, 'Ben Affleck, Morgan Freeman', '1'),
(124, 1, 'Spy Game', '126', 1, 'Robert Redford, Brad Pitt, Catherine McCormack', '1'),
(125, 5, 'Changing Lanes', '99', 1, 'Ben Affleck, Samuel L. Jackson', '1'),
(126, 1, 'The Fast And The Furious', '106', 3, 'Paul Walker, Vin Diesel, Michelle Rodriguez, Jordana Brewster, Ja Rule', '1'),
(127, 5, 'Vanilla Sky', '135', 1, 'Tom Cruise, Pen&eacute;lope Cruz, Cameron Diaz, Kurt Russell, Jason Lee, Noah Taylor', '1'),
(128, 5, 'Artificial Intelligence: AI', '146', 3, 'Haley Joel Osment, Jude Law, William Hurt, Sam Robards, Jake Thomas', '1'),
(129, 8, 'The X-Files 7: The Complete Seventh Season', '*', 4, 'David Duchovny, Gillian Anderson, Robert Patrick', '1'),
(130, 3, 'Center Stage', '115', 3, 'Amanda Schull, Zoe Saldana, Peter Gallagher', '1'),
(131, 5, 'Hoosiers', '115', 4, 'Gene Hackman, Barbara Hershey, Dennis Hopper', '1'),
(132, 5, 'Midnight Express', '120', 1, 'Brad Davis, Randy Quaid', '1'),
(133, 1, 'Mercury Rising', '108', 1, 'Bruce Willis, Alec Baldwin, Miko Hughes', '1'),
(134, 4, 'Mr. Mom', '91', 4, 'Michael Keaton, Teri Garr, Martin Mull', '1'),
(135, 4, 'Crooklyn', '115', 3, 'Alfre Woodard, Delroy Lindo, Spike Lee', '1'),
(136, 3, 'Coyote Ugly', '101', 3, 'Piper Perabo, Adam Garcia, John Goodman, Tyra Banks', '1'),
(137, 4, 'Down To Earth', '87', 3, 'Chris Rock, Eugene Levy, John Cho', '1'),
(138, 4, 'Ace Ventura When Nature Calls', '94', 3, 'Jim Carrey, Ian McNeice, Simon Callow, Maynard Eziashi', '1'),
(139, 5, 'Cast Away', '143', 3, 'Tom Hanks, Helen Hunt, Nick Searcy', '1'),
(140, 3, 'Save The Last Dance', '112', 4, 'Julia Stiles, Sean Patrick Thomas, Terry Kinney, Fredro Starr', '1'),
(141, 5, 'Thirteen Days', '147', 3, 'Kevin Costner, Bruce Greenwood, Steven Culp, Dylan Baker', '1'),
(142, 4, 'American Pie', '96', 1, 'Jason Biggs, Chris Klein, Shannon Elizabeth, Seann William Scott, Tara Reid', '1'),
(143, 4, 'O Brother, Where Art Thou?', '103', 3, 'George Clooney, John Turturro, Tim Blake Nelson, John Goodman', '1'),
(144, 5, '61*', '129', 5, 'Thomas Jane, Barry Pepper', '1'),
(145, 5, 'JFK', '206', 1, 'Kevin Costner, Kevin Bacon, Tommy Lee Jones, Gary Oldman, Sissy Spacek', '1'),
(146, 6, 'The Sixth Sense', '107', 3, 'Bruce Willis, Haley Joel Osment, Toni Collette, Olivia Williams', '1'),
(147, 9, 'Murder In The First', '122', 1, 'Christian Slater, Kevin Bacon, Gary Oldman', '1'),
(148, 6, 'The Watcher', '97', 1, 'James Spader, Marisa Tomei, Keanu Reeves', '1'),
(149, 4, 'Empire Records', '91', 3, 'Anthony LaPaglia, Renee Zellweger, Liv Tyler, Debi Mazar, Rory Cochrane', '1'),
(150, 3, 'What Women Want', '126', 3, 'Mel Gibson, Helen Hunt, Marisa Tomei, Lauren Holly', '1'),
(151, 5, 'Permanent Midnight', '88', 1, 'Ben Stiller, Elizabeth Hurley, Janeane Garofalo, Owen Wilson', '1'),
(152, 5, 'Fight Club', '139', 1, 'Edward Norton, Brad Pitt, Helena Bonham Carter', '1'),
(153, 1, 'Mission Impossible 2', '123', 3, 'Tom Cruise, Dougray Scott, Thandie Newton, Ving Rhames', '1'),
(154, 2, 'Heavy Metal ', '90', 1, 'Harvey Atkin, John Candy, Eugene Levy', '1'),
(155, 9, 'AntiTrust', '108', 3, 'Ryan Phillippe, Racheal Leigh Cook, Claire Forlani, Tim Robbins', '1'),
(156, 1, 'Armageddon', '151', 3, 'Bruce Willis, Billy Bob Thornton, Liv Tyler, Ben Affleck, Will Patton, Steve Buscemi', '1'),
(157, 5, 'Forrest Gump', '141', 3, 'Tom Hanks, Robin Wright, Gary Sinise, Mykelti Williamson, Sally Field', '1'),
(158, 4, 'Snatch', '104', 1, 'Brad Pitt, Benicio Del Toro, Dennis Farina, Vinnie Jones, Rade Sherbedgia, Jason Statham', '1'),
(159, 9, 'Unbreakable', '107', 3, 'Bruce Willis, Samuel L. Jackson, Robin Wright Penn', '1'),
(160, 5, 'Memento', '113', 1, 'Guy Pearce, Carrie-Anne Moss, Joe Pantoliano', '1'),
(161, 5, 'The Usual Suspects', '106', 1, 'Stephen Baldwin, Gabriel Byrne, Chazz Palminteri, Kevin Pollak, Pete Postlethwaite, Kevin Spacey', '1'),
(162, 5, 'Malcolm X', '202', 3, 'Denzel Washington, Angela Bassett, Albert Hall, Spike Lee, James McDaniel', '1'),
(163, 6, 'The Ring', '115', 3, 'Naomi Watts, Martin Henderson, David Dorfman, Brian Cox', '1'),
(164, 5, 'Drugstore Cowboy', '104', 1, 'Matt Dillon, Kelly Lynch, James Remar, James Le Gros, Heather Graham, William Burroughs', '1'),
(165, 5, 'Finding Forrester', '136', 3, 'Sean Connery, Rob Brown, F. Murray Abraham, Anna Paquin, Busta Rhymes', '1'),
(166, 4, 'Meet The Parents', '108', 3, 'Robert DeNiro, Ben Stiller, Terri Polo', '1'),
(167, 6, 'Hannibal', '131', 1, 'Anthony Hopkins, Julianne Moore, Ray Liotta', '1'),
(168, 4, 'Do The Right Thing', '120', 1, 'Danny Aiello, Ossie Davis, Ruby Dee, Spike Lee, John Turturro, Rosie Perez, Samuel L. Jackson, Martin Lawrence', '1'),
(169, 1, 'Crouching Tiger Hidden Dragon', '120', 3, 'Chow Yun-Fat, Michelle Yeoh, Ziyi Zhang', '1'),
(170, 5, 'Pink Floyd The Wall', '95', 1, 'Bob Geldof, Christine Hargreaves, James Laurenson', '1'),
(171, 8, 'Mr. Show: The Complete First And Second Seasons', '288', 1, 'David Cross, Bob Odenkirk', '1'),
(172, 4, 'Wayne\\\'s World', '94', 3, 'Mike Myers, Dana Carvey, Rob Lowe, Tia Carrere, Donna Dixon', '1'),
(173, 4, 'Wayne\\\'s World 2', '94', 3, 'Mike Myers, Dana Carvey, Tia Carrere, Christopher Walken, Kim Basinger', '1'),
(174, 5, 'One Hour Photo', '96', 1, 'Robin Williams, Connie Nielsen, Michael Vartan, Dylan Smith, Erin Daniels, Gary Cole', '1'),
(175, 5, 'Basic', '98', 1, 'Samuel L. Jackson, John Travolta, Connie Nielsen, Timothy Daly', '1'),
(176, 7, 'Star Wars: Episode I - The Phantom Menace', '133', 4, 'Liam Neeson, Ewan McGregor, Natalie Portman, Jake Lloyd, Ian McDiarmid', '1'),
(177, 7, 'Harry Potter And The Chamber of Secrets', '161', 4, 'Daniel Radcliffe, Emma Watson, Rupert Grint, Richard Griffiths, Fiona Shaw', '1'),
(178, 1, '15 Minutes', '120', 1, 'Robert DeNiro, Edward Burns, Kelsey Grammer, Avery Brooks', '1'),
(179, 4, 'Barbarians At The Gate', '107', 1, 'James Garner, Jonathan Pryce, Peter Riegert', '1'),
(180, 8, 'The Young Ones: Every Stoopid Episode', '400', 3, 'Rik Mayall, Adrian Edmondson, Nigel Planer, Christopher Ryan, Alexei Sayle', '1'),
(181, 4, 'Men In Black II: Back In Black', '88', 3, 'Tommy Lee Jones, Will Smith, Lara Flynn Boyle, Johnny Knoxville, Rosario Dawson, Rip Torn', '1'),
(182, 5, '8 Mile', '111', 1, 'Eminem, Kim Basinger, Brittany Murphy, Mekhi Phifer', '1'),
(183, 5, 'Midnight In The Garden Of Good And Evil', '155', 1, 'John Cusack, Kevin Spacey, Jack Thompson, Irma P. Hall, Jude Law', '1'),
(184, 4, 'Men In Black', '98', 3, 'Tommy Lee Jones, Will Smith, Linda Fiorentino, Vincent D\\\'Onofrio, Rip Torn', '1'),
(185, 5, 'The Messenger', '158', 1, 'Milla Jovovich, John Malkovich, Dustin Hoffman, Faye Dunaway', '1'),
(186, 4, 'Love &amp; A .45', '101', 1, 'Gil Bellows, Renee Zellweger', '1'),
(187, 5, 'The Man In The Iron Mask', '132', 3, 'Leonardo Dicaprio, Jeremy Irons, John Malkovich, Gerard Depardieu, Gabriel Byrne', '1'),
(188, 1, 'The Matrix', '136', 1, 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss, Hugo Weaving, Joe Pantoliano', '1'),
(189, 1, 'Heat', '172', 1, 'Al Pacino, Robert DeNiro, Val Kilmer, Jon Voight, Tom Sizemore, Ashley Judd', '1'),
(190, 4, 'Mallrats', '96', 1, 'Kevin Smith, Jason Mewes, Jason Lee, Jeremy London, Shannen Doherty, Claire Forlani', '1'),
(191, 5, 'Magnolia', '188', 1, 'Pat Healy, Genevieve Zweig, Mark Flannagan, Neil Flynn', '1'),
(192, 7, 'Lost In Space', '130', 3, 'William Hurt, Mimi Rogers, Lacey Chabert, Heather Graham, Matt LeBlanc', '1'),
(193, 5, 'Lord Of The Flies (1963 - B &amp; W)', '92', 1, 'James Aubrey, Tom Chapin, Hugh Edwards, Roger Elwin', '1'),
(194, 1, 'The Long Kiss Goodnight', '120', 1, 'Geena Davis, Samuel L. Jackson, Yvonne Zima', '1'),
(195, 5, 'Gotti', '104', 1, 'Armand Assante, William Forsythe, Anthony Quinn', '1'),
(196, 5, 'Goodfellas', '146', 1, 'Robert DeNiro, Ray Liotta, Joe Pesci, Lorraine Bracco, Paul Sorvino', '1'),
(197, 5, 'Good Will Hunting', '126', 1, 'Robin Williams, Matt Damon, Ben Affleck, Minie Driver', '1'),
(198, 4, 'Go', '103', 1, 'Scott Wolf, Taye Diggs, Desmond Askew', '1'),
(199, 1, 'Gladiator', '155', 1, 'Russell Crowe, Joaquin Phoenix, Connie Nielsen', '1'),
(200, 4, 'High Fidelity', '114', 1, 'John Cusack, Jack Black, Todd Louiso, Iben Hjejle, Lily Taylor, Lisa Bonet, Catherine Zeta-Jones', '1'),
(201, 4, 'Get Shorty', '105', 1, 'John Travolta, Gene Hackman, Rene Russo, Danny DeVito, Dennis Farina, Delroy Lindo, James Gandolfini', '1'),
(202, 9, 'The Game', '128', 1, 'Michael Douglas, Sean Penn', '1'),
(203, 7, 'Galaxy Quest', '102', 4, 'Tim Allen, Sigourney Weaver, Alan Rickman', '1'),
(204, 5, 'The Legend Of Bagger Vance', '126', 3, 'Will Smith, Matt Damon, Charlize Theron', '1'),
(205, 2, 'Lady And The Tramp', '76', 5, 'Lady, Tramp, Jock, Trusty, Peg', '1'),
(206, 5, 'L.A. Confidential', '138', 1, 'Kevin Spacey, Russell Crowe, Guy Pearce, Kim Basinger, Danny DeVito', '1'),
(207, 1, 'Lethal Weapon', '112', 1, 'Mel Gibson, Danny Glover, Gary Busey', '1'),
(208, 1, 'Lethal Weapon 2', '113', 1, 'Mel Gibson, Danny Glover, Joe Pesci', '1'),
(209, 1, 'Lethal Weapon 3', '118', 1, 'Mel Gibson, Danny Glover, Joe Pesci, Rene Russo', '1'),
(210, 1, 'Lethal Weapon 4', '127', 1, 'Mel Gibson, Danny Glover, Joe Pesci, Rene Russo, Chris Rock, Jet Li', '1'),
(211, 1, 'Gone In 60 Seconds', '117', 3, 'Nicolas Cage, Giovanni Ribisi, Angelina Jolie, Delroy Lindo, Will Patton, Robert Duvall', '1'),
(212, 4, 'Grosse Pointe Blank', '107', 1, 'John Cusack, Minnie Driver, Alan Arkin, Dan Aykroyd, Joan Cusack, Jeremy Piven', '1'),
(213, 5, 'The Green Mile', '188', 1, 'Tom Hanks, David Morse, Bonnie Hunt, Michael Clarke Duncan, James Cromwell, Sam Rockwell, Barry Pepper', '1'),
(214, 6, 'I Still Know What You Did Last Summer', '100', 1, 'Jennifer Love Hewitt, Freddie Prinze Jr., Brandy Norwood, Mekhi Phifer', '1'),
(215, 4, 'Happy Gilmore', '92', 3, 'Adam Sandler, Christopher McDonald, Carl Weathers, Bob Barker, Lee Trevino, Verne Lundquist', '1'),
(216, 6, 'I Know What You Did Last Summer', '100', 1, 'Jennifer Love Hewitt, Sarah Michelle Gellar, Ryan Phillippe, Freddie Prinze Jr., Anne Heche', '1'),
(217, 5, 'Hard Eight', '102', 1, 'Philip Baker Hall, John C. Reilly, Gwyneth Paltrow, Samuel L. Jackson, Philip Seymour Hoffman', '1'),
(218, 1, 'Mission Impossible', '110', 3, 'Tom Cruise, Jon Voight, Emmanuelle B&eacute;art, Ving Rhames, Kristin Scott Thomas, Vanessa Redgrave', '1'),
(219, 6, 'The Silence Of The Lambs', '118', 1, 'Jodie Foster, Anthony Hopkins, Scott Glenn', '1'),
(220, 4, 'Singles', '95', 3, 'Bridget Fonda, Campbell Scott, Kyra Sedgwick, Matt Dillon, Bill Pullman, James LeGros, Eric Stoltz, Jeremy Piven, Tom Skerritt', '1'),
(221, 5, 'Sleepers', '147', 1, 'Kevin Bacon, Billy Crudup, Robert DeNiro, Minnie Driver, Dustin Hoffman, Bruno Kirby, Brad Pitt', '1'),
(222, 6, 'Sleepy Hollow', '105', 1, 'Johnny Depp, Christina Ricci, Miranda Richardson, Christopher Walken', '1'),
(223, 1, 'The Negotiator', '139', 1, 'Samuel L. Jackson, Kevin Spacey, David Morse, Ron Rifkin, Regina Taylor', '1'),
(224, 1, 'Natural Born Killers', '118', 1, 'Woody Harrelson, Juliette Lewis, Rodney Dangerfield, Robert Downey Jr.', '1'),
(225, 4, 'National Lampoon\\\'s Christmas Vacation', '97', 3, 'Chevy Chase, Beverly D\\\'Angelo, Randy Quaid, Juliette Lewis, William Hickey', '1'),
(226, 4, 'National Lampoon\\\'s Vacation', '99', 1, 'Chevy Chase, Beverly D\\\'Angelo, Randy Quaid, Christine Brinkley', '1'),
(227, 1, 'Murder At 1600', '107', 1, 'Wesley Snipes, Diane Lane, Dennis Miller, Alan Alda, Tate Donovan', '1'),
(228, 4, 'Mystery Men', '122', 3, 'Hank Azaria, Claire Forlani, Janeane Garofalo, Eddie Izzard, Greg Kinnear, William H. Macy, Paul Rubens, Ben Stiller, Tom Waits', '1'),
(229, 4, 'A Night At The Roxbury', '81', 3, 'Will Ferrell, Chris Kattan, Molly Shannon, Richard Grieco', '1'),
(230, 9, 'The Net', '114', 3, 'Sandra Bullock, Jeremy Northam, Dennis Miller', '1'),
(231, 5, 'Payback', '100', 1, 'Mel Gibson, Gregg Henry, Maria Bello, David Paymer, Lucy Liu, Kris Kristofferson', '1'),
(232, 4, 'Patch Adams', '115', 3, 'Robin Williams, Daniel London, Monica Potter', '1'),
(233, 5, 'The Outsiders', '91', 4, 'Matt Dillon, Patrick Swayze, C. Thomas Howell, Tom Cruise, Ralph Macchio, Emilo Estevez, Rob Lowe', '1'),
(234, 5, '187', '119', 1, 'Samuel L. Jackson, Clifton Gonzalez Gonzalez', '1'),
(235, 4, 'Office Space', '90', 1, 'Ron Livinston, Stephen Root, Gary Cole, Jennifer Aniston', '1'),
(236, 4, 'The Nutty Professor II: The Klumps', '107', 3, 'Eddie Murphy, Janet Jackson, Larry Miller', '1'),
(237, 4, 'The Nutty Professor', '96', 3, 'Eddie Murphy, Jada Pinkett, James Coburn, Dave Chappelle', '1'),
(238, 3, 'Pretty Woman', '119', 1, 'Richard Gere, Julia Roberts, Ralph Bellamy, Jason Alexander, Hector Elizondo', '1'),
(239, 1, 'Platoon', '120', 1, 'Tom Berenger, Willem Dafoe, Charlie Sheen, Forest Whitaker, Kevin Dillon, Johnny Depp', '1'),
(240, 4, 'Planes, Trains and Automobiles', '92', 1, 'Steve Martin, John Candy', '1'),
(241, 7, 'Pitch Black', '112', 1, 'Vin Diesel, Radha Mitchell, Cole Hauser', '1'),
(242, 6, 'Pet Sematary', '102', 1, 'Fred Gwynne, Dale Midkiff, Denise Crosby', '1'),
(243, 5, 'A Perfect Murder', '108', 1, 'Michael Douglas, Gwyneth Paltrow, Viggo Mortensen', '1'),
(244, 5, 'Reservoir Dogs', '100', 1, 'Harvey Keitel, Tim Roth, Michael Madsen, Chris Penn, Steve Buscemi, Quentin Tarantino', '1'),
(245, 5, 'Revenge', '123', 1, 'Kevin Costner, Anthony Quinn, Madeleine Stowe', '1'),
(246, 5, 'The Right Stuff', '193', 4, 'Sam Shepard, Ed Harris, Dennis Quaid, Barbara Hershey, Fred Ward', '1'),
(247, 5, 'Pulp Fiction', '154', 1, 'John Travolta, Samuel L. Jackson, Uma Thurman, Harvey Keitel, Tim Roth, Amanda Plummer', '1'),
(248, 5, 'Pump Up The Volume', '102', 1, 'Christian Slater, Ellen Greene', '1'),
(249, 4, 'The Princess Bride', '98', 4, 'Cary Elwes, Robin Wright, Mandy Patinkin, Billy Crystal, Peter Falk, Fred Savage', '1'),
(250, 5, 'Saving Private Ryan', '169', 1, 'Tom Hanks, Edward Burns, Matt Damon, Tom Sizemore', '1'),
(251, 2, 'Rudolph The Red-Nosed Reindeer', '135', 5, 'Ruldolph', '1'),
(252, 9, 'Hollow Man', '113', 1, 'Kevin Bacon, Elisabeth Shue', '1'),
(253, 5, 'Rounders ', '121', 1, 'Matt Damon, Edward Norton, John Turturro, John Malkovich, Martin Landau', '1'),
(254, 3, 'Romeo &amp; Julliet', '120', 3, 'Leonardo DiCaprio, Claire Danes, John Leguizamo, Brian Demnehy, Paul Sorvino', '1'),
(255, 5, 'The Shawshank Redemption', '142', 1, 'Tim Robbins, Morgan Freeman, William Sadler, Gil Bellows, James Whitmore, Clancy Brown, Bob Gunton', '1'),
(256, 3, 'Shakespeare In Love', '122', 1, 'Gwyneth Paltrow, Joseph Fiennes, Geoffrey Rush, Colin Firth, Ben Affleck', '1'),
(257, 9, 'Seven', '127', 1, 'Brad Pitt, Morgan Freeman, Kevin Spacey, Gwyneth Paltrow', '1'),
(258, 6, 'Scream', '111', 1, 'David Arquette, Neve Campbell, Courteny Cox, Skeet Ulrich, Drew Barrymore', '1'),
(259, 6, 'Scream 2', '120', 1, 'David Arquette, Neve Campbell, Courteney Cox, Sarah Michelle Gellar, Jamie Kennedy, Jerry O\\\'Connell, Jada Pinkette', '1'),
(260, 6, 'Scream 3', '117', 1, 'David Arquette, Neve Campbell, Courteney Cox Arquette, Patrick Dempsey, Jenny McCarthy, Parker Posey', '1'),
(261, 4, 'Scary Movie', '88', 1, 'Shannon Elizabeth, Carmen Electra, Regina Hall, Sheri Oteri, Marlon Wayans', '1'),
(262, 1, 'Six Days Seven Nights', '102', 3, 'Harrison Ford, Anne Heche, David Schwimmer', '1'),
(263, 7, 'Stargate', '119', 3, 'Kurt Russell, James Spader', '1'),
(264, 5, 'Stand By Me', '88', 1, 'Wil Wheaton, River Phoenix, Corey Feldman, Jerry O\\\'Connell, Kiefer Sutherland', '1'),
(265, 3, 'Stepmom', '125', 3, 'Julia Roberts, Susan Sarandon, Ed Harris', '1'),
(266, 4, 'So I Married An Axe Murderer', '93', 3, 'Mike Myers, Nancy Travis, Anthony LaPaglia, Amanda Plummer', '1'),
(267, 5, 'Sneakers', '125', 3, 'Robert Redford, Dan Aykroyd, Ben Kingsley, Mary McDonnell, River Phoenix, Sidney Poitier, David Strathairn', '1'),
(268, 1, 'Snake Eyes', '98', 1, 'Nicolas Cage, Gary Sinise, John Heard, Carla Gugino', '1'),
(269, 5, 'Sling Blade', '135', 1, 'Billy Bob Thornton, John Ritter, Rober Duvall, Dwight Yoakam, J.T. Walsh', '1'),
(270, 4, 'Tommy Boy', '97', 3, 'Chris Farley, David Spade, Bo Derek, Brian Dennehy', '1'),
(271, 4, 'There\\\'s Something About Mary', '119', 1, 'Cameron Diaz, Ben Stiller, Matt Dillon, Chris Elliott', '1'),
(272, 4, 'Swingers', '96', 1, 'Jon Favreau, Vince Vaughn, Ron Livingston, Heather Graham', '1'),
(273, 4, 'Swimming With Sharks', '93', 1, 'Kevin Spacey, Frank Whaley, Michelle Forbs, Benicio Del Toro', '1'),
(274, 6, 'Stir Of Echos', '99', 1, 'Kevin Bacon, Kathryn Erbe, Illeana Douglas, Zachary David Cope', '1'),
(275, 9, 'Suicide Kings', '103', 1, 'Christopher Walken, Denis Leary, Sean Patrick Flanery', '1'),
(276, 9, 'Stigmata', '102', 1, 'Patricia Arquette, Gabriel Byrne, Jonathan Pryce, Nia Long', '1'),
(277, 9, '12 Monkeys', '130', 1, 'Bruce Willis, Madeleine Stowe, Brad Pitt, Christopher Plummer', '1'),
(278, 5, '2 Days In The Valley', '105', 1, 'Danny Aiello, Jeff Daniels, Teri Hatcher, Glenne Headly, Peter Horton, Marsha Mason, Paul Mazursky, James Spader, Eric Stoltz, Charlize Theron', '1'),
(279, 2, 'Toy Story', '81', 5, 'Tom Hanks, Tim Allen', '1'),
(280, 2, 'Toy Story 2', '92', 5, 'Tom Hanks, Tim Allen', '1'),
(281, 5, 'True Romance', '121', 1, 'Christian Slater, Patricia Arquette, Val Kilmer, Dennis Hopper, Gary Oldman, Brad Pitt', '1'),
(282, 1, 'Three Kings', '115', 1, 'George Clooney, Mark Wahlberg, Ice Cube', '1'),
(283, 5, 'A Time To Kill', '150', 1, 'Sandra Bullock, Samuel L. Jackson, Matthew McConaughey, Kevin Spacey', '1'),
(284, 5, 'Unforgiven', '127', 1, 'Clint Eastwood, Gene Hackman, Morgan Freeman, Richard Harris', '1'),
(285, 7, 'The X-Files: Fight The Future', '122', 3, 'David Duchovny, Gillian Anderson, Martin Landau, Blythe Danner', '1'),
(286, 9, 'What Lies Beneath', '130', 3, 'Harrison Ford, Michelle Pfeiffer, Diana Scarwid', '1'),
(287, 5, 'What Dreams May Come', '113', 3, 'Robin Williams, Cuba Gooding Jr., Annabella Sciorra, Max Von Sydow', '1'),
(288, 5, 'The Way Of The Gun', '119', 1, 'James Caan, Benicio Del Toro, Taye Diggs, Ryan Phillippe, Juliette Lewis', '1'),
(289, 5, 'Wall Street', '125', 1, 'Michael Douglas, Charlie Sheen, Daryl Hannah', '1'),
(290, 1, 'U.S. Marshals', '131', 3, 'Tommy Lee Jones, Wesley Snipes, Robert Downey Jr.', '1'),
(291, 5, 'The Untouchables', '119', 1, 'Kevin Costner, Robert DeNiro, Charles Martin Smith, Andy Garcia, Sean Connery', '1'),
(292, 3, 'Untamed Heart', '102', 3, 'Christian Slater, Marisa Tomei, Rosie Perez', '1'),
(293, 1, 'Young Guns', '102', 1, 'Emilio Estevez, Keifer Sutherland, Lou Diamond Phillips, Charlie Sheen, Dermot Mulroney, Casey Siemaszko', '1'),
(294, 2, 'The Year Without A Santa Claus', '125', 5, 'Mickey Rooney, Dick Shawn, George S. Irving', '1'),
(295, 1, 'X-Men', '104', 3, 'Hugh Jackman, Patrick Stewart, Ian McKellen, Famke Janssen, James Mardsen, Halle Berry, Anna Paquin, Rebecca Romijn-Stamos', '1'),
(296, 1, 'Vertical Limit', '124', 4, 'Chris O\\\'Donnell, Bill Paxton, Robin Tunney, Scott Glenn', '1'),
(297, 5, 'Blow', '124', 1, 'Johnny Depp, Penelope Cruz, Franka Potente, Rachel Griffiths, Paul Reubens, Ray Liotta, Jesse James', '1'),
(298, 9, 'Kalifornia', '117', 1, 'Brad Pitt, Juliette Lewis, David Duchovny, Michelle Forbes', '1'),
(299, 1, 'Judgment Night', '110', 1, 'Emilio Estevez, Cuba Gooding Jr., Denis Leary', '1'),
(300, 9, 'Instinct', '126', 1, 'Anthony Hopkins, Cuba Gooding Jr., Donald Sutherland, Maura Tierney', '1'),
(301, 1, 'Independence Day', '153', 3, 'Will Smith, Bill Pullman, Jeff Goldblum, Mary McDonnell, Judd Hirsch, Randy Quaid', '1'),
(302, 9, 'Misery', '108', 1, 'James Caan, Kathy Bates, Frances Sternhagen, Richard Farnsworth', '1'),
(303, 4, 'You\\\'ve Got Mail', '120', 4, 'Tom Hanks, Meg Ryan, Parker Posey, Jean Stapleton, Dave Chappelle, Greg Kinnear', '1'),
(304, 1, 'Harley Davidson And The Marlboro Man', '98', 1, 'Mickey Rourke, Don Johnson, Chelsea Field, Daniel Baldwin, Vanessa Williams, Tom Sizemore', '1'),
(305, 5, 'The Bodyguard', '130', 1, 'Kevin Costner, Whitney Houston, Gary Kemp, Bill Cobbs, Ralph Waite', '1'),
(306, 5, 'American History X', '119', 1, 'Edward Norton, Edward Furlong, Beverly D\\\'Angelo, Elliot Gould', '1'),
(307, 8, 'Band Of Brothers', '600', 1, 'Damian Lewis, Donnie Wahlberg, Ron Livingston', '1'),
(308, 8, 'My So Called Life', '1140', 4, 'Claire Danes, Bess Armstrong, Wilson Cruz', '1'),
(309, 1, 'The Matrix Reloaded', '138', 1, 'Laurence Fishburne, Carrie-Anne Moss, Jada Pinkett Smith, Keanu Reeves, Hugo Weaving', '1'),
(310, 8, 'South Park 1: The Complete First Season', '310', 2, 'Trey Parker, Matt Stone', '1'),
(311, 4, 'Bruce Almighty', '101', 3, 'Jim Carrey, Morgan Freeman, Jennifer Aniston, Philip Baker Hall', '1'),
(312, 1, 'We Were Soldiers', '138', 1, 'Mel Gibson, Madeleine Stowe, Greg Kinnear, Sam Elliot, Chris Klein, Keri Russell, Barry Pepper', '1'),
(313, 1, 'The Terminator 1', '108', 1, 'Arnold Schwarzenegger, Michael Biehn, Linda Hamilton, Paul Winfield, Lance Henriksen, Bill Paxton', '1'),
(314, 1, 'The Terminator 2: Judgment Day', '137', 1, 'Arnold Schwarzenegger, Linda Hamilton, Edward Furlong, Robert Patrick', '1'),
(315, 1, 'The Terminator 3: Rise of the Machines', '109', 1, 'Arnold Schwarzenegger, Nich Stahl, Claire Danes', '1'),
(316, 5, 'Bowling for Columbine', '120', 1, 'Michael Moore, George W. Bush, Dick Cheney, Dick Clark, Bill Clinton, Charlton Heston, Marilyn Manson, Trey Parker, Chris Rock, Matt Stone', '1'),
(317, 1, 'Formula 51', '92', 1, 'Samuel L. Jackson, Nigel Whitmey, Robert Jezerk, Meat Loaf', '1'),
(318, 5, 'Catch Me If You Can', '141', 3, 'Leonardo DiCaprio, Tom Hanks, Christopher Walken, Martin Sheen, James Brolin, Jennifer Garner', '1'),
(319, 1, 'Indiana Jones 1: Raiders of the Lost Ark', '115', 4, 'Harrison Ford, Karen Allen, Paul Freeman', '1'),
(320, 1, 'Indiana Jones 2: The Temple of Doom', '118', 4, 'Harrison Ford, Kate Capshaw, Philip Stone, Dan Aykroyd', '1'),
(321, 1, 'Indiana Jones: The Last Crusade', '127', 3, 'Harrison Ford, Sean Connery, Alison Doody, River Phoenix, Michael Byrne', '1'),
(322, 1, '007: Tomorrow Never Dies', '119', 3, 'Pierce Brosnan, Jonathan Pryce, Teri Hatcher', '1'),
(323, 1, '007: The Spy Who Loved Me', '125', 4, 'Roger Moore, Barbara Bach, Caroline Munro', '1'),
(324, 1, '007: The Man With The Golden Gun', '125', 4, 'Roger Moore, Christopher Lee, Maud Adams', '1'),
(325, 1, '007: Licence To Kill', '133', 3, 'Timothy Dalton, Carey Lowell, Talisa Soto', '1'),
(326, 1, '007: Goldfinger', '112', 4, 'Sean Connery, Honor Blackman, Shirley Eaton, Tania Mallet', '1'),
(327, 1, '007: GoldenEye', '130', 3, 'Pierce Brosnan, Sean Bean, Izabella Scorupco', '1'),
(328, 1, '007: Dr. No', '110', 4, 'Sean Connery, Ursula Andress, Jack Lord, Bernard Lee', '1'),
(329, 5, 'Scarface', '170', 1, 'Al Pacino, Michelle Pfeiffer, Mary Elizabeth Mastrantonio, Robert Loggia', '1'),
(330, 2, 'Finding Nemo', '100', 5, 'Albert Brooks, Ellen DeGeneres, Alexander Gould, Willem Dafoe', '1'),
(331, 1, 'The Lord Of The Rings: The Fellowship Of The Ring', '208', 3, 'Noel Appleby, Sean Astin, Cate Blanchett', '1'),
(332, 4, 'American Wedding (Unrated)', '96', 1, 'Jason Biggs, Seann William Scott, Alyson Hannigan', '1'),
(333, 1, 'Bad Boys II', '147', 1, 'Martin Lawrence, Will Smith, Theresa Randle, Joe Pantoliano', '1'),
(334, 8, 'The Sopranos 4: The Complete Fourth Season (4 discs)', '800', 1, 'James Gandolfini, Lorraine Bracco, Edie Falco, Michael Imperioli, Dominic Chianese, Vincent Pastore', '1'),
(335, 1, 'The Matrix Revolutions', '', 1, 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss, Harry J. Lennix, Jada Pinkett Smith, Mary Alice, Bruce Spence, Helmut Bakaitias, Huga Weaving', '1'),
(336, 1, 'The Skulls III', '103', 3, 'Clare Kramer, Bryche Johnson, Barry Bostwick, Steve Braun, Karl Pruner, Dean McDermott', '1');
# --------------------------------------------------------

#
# Table structure for table `myProjects`
#

CREATE TABLE myProjects (
  id int(11) NOT NULL auto_increment,
  orderId int(11) NOT NULL default '0',
  title text NOT NULL,
  url text NOT NULL,
  overview text NOT NULL,
  myRole text NOT NULL,
  image1 text NOT NULL,
  image2 text NOT NULL,
  image3 text NOT NULL,
  active int(4) NOT NULL default '0',
  PRIMARY KEY  (id)
) TYPE=MyISAM;

#
# Dumping data for table `myProjects`
#

INSERT INTO myProjects (id, orderId, title, url, overview, myRole, image1, image2, image3, active) VALUES (1, 1, 'ZeaVision', 'www.zeavision.com', 'ZeaVision LLC is a company that patented a dietary supplement, called zeaxanthin, that helps maintain vision health and brings hope to those with macular degeneration.<br /><br />\r\nZeaVision\\\'s primary audience would consist of consumers over fifty with progressive vision loss. A multi-channel strategy and automated systems support for marketing, sales, order fulfillment, accounting, and financial forecasting was developed from a single back-end system that provides the optimal interaction experiences regardless of the channel.', 'My role was programming the designs for the web site while complying with ADA / 508 / WAI guidelines. Another feature added is the ability to increase or decrease the text size on the site to make it easier to read while still maintaining a visual appeal. I also created several Flash pieces for the site that act as information guides and attention grabbers. Other features include: Tell a Friend, Shopping Cart, Flash detection, dynamic content, administration screens, and more.<br /><br />\r\nI also helped implement voice recognition software that allowed ZeaVision to use any telephone to get the latest information about sales, stock, and more. A web-based commerce, call center, order fulfillment, and real-time customer support system, as well as the ability to provide mobile operational metrics and control through wireless PDA and self-service sales support through interactive kiosks was part of my task and our overall goal, which was a success.', 'zeavision_1.jpg', 'zeavision_2.jpg', 'zeavision_3.jpg', 1),
(2, 2, 'Wear-Dated', 'www.weardated.com', 'A <a href="http://www.solutia.com/" target="_blank">Solutia, Inc.</a> company, Wear-Dated Carpet Fiber and Wear-Dated Upholstery required a complete solution from the ground up, built from scratch. The project consists so far of 2 major phases.<br /><br />\r\nThe first major itteration included a complete re-design and programming of their entire public web site which included some administration screens as well.<br /><br />\r\nThe second major itteration includes another re-design and programming of their entire public web site with enhancements to include a room designer / planner, which will also interact with in-store kiosks that we are developing as well.', 'My role was to program the designs into a fully functioning site while meeting Solutia, Inc. IT teams strict standards and compliance initiatives. Key features include Flash detection and animations, Find a Retailer search, Find Carpet search, survey\'s, registration and contact forms, and much more.', 'weardated_1.jpg', 'weardated_2.jpg', 'weardated_3.jpg', 1),
(6, 3, 'TruSecure', 'www.trusecure.com', 'TruSecure is a leading provider of intelligent risk management products and services. TruSecure claims to dramatically improve security and reduce risk by helping organizations make better security decisions and maximize the effectiveness of their existing security people, processes, and products.', 'My role was to program the entire front-end of the website, meeting cross-browser, cross-platform, and usability standards. The site is also very heavily integrated with a content management system that was previously used, but needed to be completely re-done to accomidate the new features on the site. Coding, making graphics, scripting, and de-bugging were the major roles I played in this project.<br /><br />\r\nThe project itself was a daunting task as time, tools, and learning curves all play significant roles in the project life cycle and timeline. With all the obsticles in our path, essentially a 2 man team was able to met the project deadline and deliver the best possible solution with the project requirements and constraints.', 'trusecure_1.jpg', 'trusecure_2.jpg', 'trusecure_3.jpg', 1),
(7, 6, 'bitPimps Custom Modifications', 'bitpimps.lixlink.com', 'A community leading hobby web site, bitPimps Custom Modifications draws in large numbers of traffic and members by offering fresh information, articles, tutorials, entertainment, and contests related to the micro r/c hobby world.<br /><br />\r\nThe web site also allows visitors to join as members in a discussion forum for members who are seeking more specific information, want learn more, show off, and more.', 'From concept, through construction, then on to maintenance and administration &#8212; I am responsible for it all. In the beginning, I had some concept brain-storming sessions with a few close friends, that gave me the base of the concept. From there on out, I was the only person to design, develop, and maintain the web site.<br /><br />\r\nNow with over well over 400 members and steadily growing, I now over-see a team of forum moderators who help me keep the forums clean and members following the rules.<br /><br />\r\nI have implemented administration screens to help me out when updating content and image galleries on the site. Each page is dynamically created on the server from information entered into the content management system in the administration area.', 'bitpimps_1.jpg', 'bitpimps_2.jpg', 'bitpimps_3.jpg', 1),
(8, 4, 'e-Wireless (#333)', 'none', 'e-Wireless (#333) was a company using cell phone technology to offer consumers connection services, advertisements, information gathering, etc. Sponsors and advertisers could manage advertisements, when they were played, how often, review the ads exposure, results from the ads, and more. Managers could administer sponsors, review calls places, sponsors and advertisers account information and activity, and more.', 'In one of many roles, I helped with the web site architecture, some design and back-end programming. Most of my work was done on the front-end programming aspect where I translated all the designs into workable HTML pages that interfaced with back-end server technologies and applications.', '333_1.jpg', '333_2.jpg', '333_3.jpg', 1),
(10, 5, 'AXS Technologies', 'www.axs-tech.com', 'AXS Technologies is a world leader in developing software technologies that help speed the delivery of data, such as hi-res imaging, data mining, signal correlation, storage, and more.', 'My role was to program the designs in to functioning web pages, and integrating the companies &quot;EyeSpy&quot; technology in to the web site itself. Some features include EyeSpy image demo\'s, Tell a Friend and Contact forms, dynamically generated pages, Press Releases maintained by administration screens, and more.', 'axstech_1.jpg', 'axstech_2.jpg', 'axstech_3.jpg', 1),
(11, 7, 'IconProcess', 'www.iconprocess.com', 'IconProcess is a site based around e-development processes for web and software developers. The site itself, the name, branding, architecture, design, programming, etc. was all built from nothing but an idea. Visitors can request whitepaper downloads, review IconProcess training materials, subscribe to newsletters, and more.', 'My role was to program the entire site including most of the back-end functionality. Features like subscribing, news and press releases, tell a friend, download requests, contact forms, etc. are all maintained via an administration portal provided through an interface identical to that of the public site.', 'iconprocess_1.jpg', 'iconprocess_2.jpg', 'iconprocess_3.jpg', 1),
(12, 9, 'IconTraining', 'training.iconmedialab.com', 'IconTraining advertises and offers custom training solutions to businesses and individuals. The site announces the latest in training methods, key speakers, locations, and more. All of this information is stored in a database and the web site itself is dynamically data-driven and maintained through administration screens. Visitors can subscribe to newsletters, request more information on training, schedule and purchase training courses all via the web site.', 'My main role was to program the entire front-end of the web site as well as part of the back-end. I\'ve also maintained and updated the site regularly as well as adding on new features that tie in to more data-driven content.', 'icontraining_1.jpg', 'icontraining_2.jpg', 'icontraining_3.jpg', 1),
(13, 13, 'IAHP', 'www.iahp.com', 'IAHP, short for International Alliance of Healthcare Practitioners, offers information to visitors and a chance for healthcare professionals to join the IAHP alliance, get listed in the directory, and buy a templated micro-site. IAHP offers both patients and practitioners a chance to enhance their knowledge and network with others. All of this is managed through administration screens that handle transactions and automatically setup micro-sites, and more.', 'My main role was to program the entire front end of the web site, as well as support the project by coming up with new ideas to achieve certain goals such as attracting potential customers and providing current customers the ability to create and manage their own micro-site through an administration interface provided to members of the web site.', 'iahp_1.jpg', 'iahp_2.jpg', 'iahp_3.jpg', 1),
(14, 14, 'IAHE', 'www.iahe.com', 'IAHE (International Alliance of Healthcare Educators is a site dedicated to the presentation of high-quality educational programs for interested healthcare professionals from all disciplines.', 'My roles were to help program some of the front-end elements in to the site as well as help maintain and update the site per the client\'s requests. Frequent database updates and additions as well as code changes to functionality.', 'iahe_1.jpg', 'iahe_2.jpg', 'iahe_3.jpg', 1),
(15, 8, 'IconProject Site', 'none', 'This is an internal tool used by IconMedialab project managers, team members, and clients. The purpose of the tool is to help keep track of resources, schedules, tasks, files, communications, and more.<br /><br />\r\nThe site recognizes members and returns information based on their role, status, and project involvment.', 'I programmed the entire front-end of the web site, helped with middle-ware and back-end development. Conception, layout, and partial design were also a portion of my tasks. I also help maintain and package the site for re-installation, and more.', 'iconprojectsite_1.jpg', 'iconprojectsite_2.jpg', 'iconprojectsite_3.jpg', 1),
(16, 11, 'IconConsultants Db', 'none', 'This application allows users with the proper permissions to administer all consultants for the St. Louis and DC offices. Administrators can check availability, schedules, billing rates, as well as get an over all report on bench time, and more.', 'My role was to help conceptualize, layout, design, and program the entire front-end and middle-ware pieces of the web site. Maintenance and enhancements are an on-going task.', 'iconconsultantdb_1.jpg', 'iconconsultantdb_2.jpg', 'iconconsultantdb_3.jpg', 1),
(17, 15, 'Scott D. Lix (v.1.0)', 'none', 'This was my first version of my personal web site that contained a blog, portfolio, media archives, and a toolbox. I designed and programmed the entire site from front to back and added features like the ability to increase or decrease text sizes, tell a friend, perform searches, and more.', 'The site itself was completely data-driven and utilized a templating system, making updates quick and easy through administration screens I also provided to help maintain all aspects of content through-out the site.', 'lixlink_1.jpg', 'lixlink_2.jpg', 'lixlink_3.jpg', 1),
(18, 12, 'IconCampaign Tracker', 'none', 'The IconCampaign Tracker allows sales staff from all the IconMedialab offices to keep track of the campaigns they send out. The tracker keeps records of what campaigns were sent out, when they were sent out, which link was clicked on, and who clicked on what link.', 'My role was to complete the marketing tool in 1 day, have it functionable and usable — which I did. I was the main developer from inception to implementation, I designed and programmed the entire tool.', 'iconcampaigntracker_1.jpg', 'iconcampaigntracker_2.jpg', 'iconcampaigntracker_3.jpg', 1),
(19, 10, 'Collegiate VIP', 'www.collegiatevip.com', 'I was contacted by an old partner, that now owns and runs <a href="http://www.integritycorporation.com/" target="_blank">Integrity Corporation</a>, to program and script the designs produced in 3 days or less. The overall initial goals were to communicate, elicit contact, and empower Collegiate VIP to successfully follow-up on consumers.<br /><br />\r\nFrom cutting up images &#8212; programming the interface &#8212; and providing the back-end functionality, the project challenged my skills and effectiveness in producing a fully functional system in what turned out to be just under 1 day.', 'I was hired to produce the website and bring it to life &#8212; from an image file to an actual functioning website and mini-system.<br /><br />\r\nI received several image documents to provide me with the intitial layouts and needed graphics. From there - I cut up the graphics to suit the needs, produced the front-end code or scripting to provide the interface and some client-side functionality.<br /><br />\r\nI then implemented back-end coding and functionality to provide the use of forms, recording information, automated email responsed based on user details, and more.<br /><br />\r\nInitially, I already knew I had a tight deadline, and although the designs didn\'t lend themselves to Internet production. I managed to utilize my professional techniques to mimic the designs and still produce a fully functioning, scalable, and user-friendly website / system.<br /><br />\r\nAll that and a bit more &#8212; including revisions &#8212; in just 28 hours! I was even proud of myself!', 'collegiatevip_1.jpg', 'collegiatevip_2.jpg', 'collegiatevip_3.jpg', 1),
(20, 16, 'Double D Enterprises', 'www.doubledenterprise.com', 'As a jewelry maker and seller, Double D Enterprises wanted to start to make an online presence that would allow them to showcase and offer for sale some of the fine jewelry pieces they have to offer.', 'I designed, programmed, architectured, support, etc. the entire project by myself.', 'doubled_1.jpg', 'doubled_2.jpg', 'doubled_3.jpg', 1);
# --------------------------------------------------------

#
# Table structure for table `tools_auth_access`
#

CREATE TABLE tools_auth_access (
  group_id mediumint(8) NOT NULL default '0',
  forum_id smallint(5) unsigned NOT NULL default '0',
  auth_view tinyint(1) NOT NULL default '0',
  auth_read tinyint(1) NOT NULL default '0',
  auth_post tinyint(1) NOT NULL default '0',
  auth_reply tinyint(1) NOT NULL default '0',
  auth_edit tinyint(1) NOT NULL default '0',
  auth_delete tinyint(1) NOT NULL default '0',
  auth_sticky tinyint(1) NOT NULL default '0',
  auth_announce tinyint(1) NOT NULL default '0',
  auth_vote tinyint(1) NOT NULL default '0',
  auth_pollcreate tinyint(1) NOT NULL default '0',
  auth_attachments tinyint(1) NOT NULL default '0',
  auth_mod tinyint(1) NOT NULL default '0',
  KEY group_id (group_id),
  KEY forum_id (forum_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_auth_access`
#

# --------------------------------------------------------

#
# Table structure for table `tools_banlist`
#

CREATE TABLE tools_banlist (
  ban_id mediumint(8) unsigned NOT NULL auto_increment,
  ban_userid mediumint(8) NOT NULL default '0',
  ban_ip varchar(8) NOT NULL default '',
  ban_email varchar(255) default NULL,
  PRIMARY KEY  (ban_id),
  KEY ban_ip_user_id (ban_ip,ban_userid)
) TYPE=MyISAM;

#
# Dumping data for table `tools_banlist`
#

# --------------------------------------------------------

#
# Table structure for table `tools_categories`
#

CREATE TABLE tools_categories (
  cat_id mediumint(8) unsigned NOT NULL auto_increment,
  cat_title varchar(100) default NULL,
  cat_order mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (cat_id),
  KEY cat_order (cat_order)
) TYPE=MyISAM;

#
# Dumping data for table `tools_categories`
#

INSERT INTO tools_categories (cat_id, cat_title, cat_order) VALUES (1, 'General Discussion', 40),
(2, 'Front-End Development (Design & IA)', 10),
(3, 'Middle-Ware Development (Scripting & Programming)', 20),
(4, 'Back-End Development (Databases & Core Technologies)', 30);
# --------------------------------------------------------

#
# Table structure for table `tools_config`
#

CREATE TABLE tools_config (
  config_name varchar(255) NOT NULL default '',
  config_value varchar(255) NOT NULL default '',
  PRIMARY KEY  (config_name)
) TYPE=MyISAM;

#
# Dumping data for table `tools_config`
#

INSERT INTO tools_config (config_name, config_value) VALUES ('config_id', '1'),
('board_disable', '0'),
('sitename', 'lixlink.com'),
('site_desc', 'Common Development Tools Used During Production'),
('cookie_name', 'phpbb2mysql'),
('cookie_path', '/'),
('cookie_domain', ''),
('cookie_secure', '0'),
('session_length', '3600'),
('allow_html', '0'),
('allow_html_tags', 'b,i,u,pre'),
('allow_bbcode', '1'),
('allow_smilies', '1'),
('allow_sig', '1'),
('allow_namechange', '0'),
('allow_theme_create', '0'),
('allow_avatar_local', '0'),
('allow_avatar_remote', '1'),
('allow_avatar_upload', '1'),
('enable_confirm', '0'),
('override_user_style', '0'),
('posts_per_page', '15'),
('topics_per_page', '50'),
('hot_threshold', '25'),
('max_poll_options', '10'),
('max_sig_chars', '255'),
('max_inbox_privmsgs', '50'),
('max_sentbox_privmsgs', '25'),
('max_savebox_privmsgs', '50'),
('board_email_sig', 'Thanks, The lixlink.com Management'),
('board_email', 'superdupersleuth2002@yahoo.com'),
('smtp_delivery', '0'),
('smtp_host', ''),
('smtp_username', ''),
('smtp_password', ''),
('sendmail_fix', '0'),
('require_activation', '1'),
('flood_interval', '15'),
('board_email_form', '0'),
('avatar_filesize', '6144'),
('avatar_max_width', '160'),
('avatar_max_height', '140'),
('avatar_path', 'images/avatars'),
('avatar_gallery_path', 'images/avatars/gallery'),
('smilies_path', 'images/smiles'),
('default_style', '1'),
('default_dateformat', 'D M d, Y g:i a'),
('board_timezone', '-5'),
('prune_enable', '0'),
('privmsg_disable', '0'),
('gzip_compress', '0'),
('coppa_fax', ''),
('coppa_mail', ''),
('record_online_users', '1'),
('record_online_date', '1081999755'),
('server_name', 'www.lixlink.com'),
('server_port', '80'),
('script_path', '/tools/'),
('version', '.0.8'),
('board_startdate', '1081999375'),
('default_lang', 'english');
# --------------------------------------------------------

#
# Table structure for table `tools_confirm`
#

CREATE TABLE tools_confirm (
  confirm_id char(32) NOT NULL default '',
  session_id char(32) NOT NULL default '',
  code char(6) NOT NULL default '',
  PRIMARY KEY  (session_id,confirm_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_confirm`
#

# --------------------------------------------------------

#
# Table structure for table `tools_disallow`
#

CREATE TABLE tools_disallow (
  disallow_id mediumint(8) unsigned NOT NULL auto_increment,
  disallow_username varchar(25) NOT NULL default '',
  PRIMARY KEY  (disallow_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_disallow`
#

# --------------------------------------------------------

#
# Table structure for table `tools_forum_prune`
#

CREATE TABLE tools_forum_prune (
  prune_id mediumint(8) unsigned NOT NULL auto_increment,
  forum_id smallint(5) unsigned NOT NULL default '0',
  prune_days smallint(5) unsigned NOT NULL default '0',
  prune_freq smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (prune_id),
  KEY forum_id (forum_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_forum_prune`
#

# --------------------------------------------------------

#
# Table structure for table `tools_forums`
#

CREATE TABLE tools_forums (
  forum_id smallint(5) unsigned NOT NULL default '0',
  cat_id mediumint(8) unsigned NOT NULL default '0',
  forum_name varchar(150) default NULL,
  forum_desc text,
  forum_status tinyint(4) NOT NULL default '0',
  forum_order mediumint(8) unsigned NOT NULL default '1',
  forum_posts mediumint(8) unsigned NOT NULL default '0',
  forum_topics mediumint(8) unsigned NOT NULL default '0',
  forum_last_post_id mediumint(8) unsigned NOT NULL default '0',
  prune_next int(11) default NULL,
  prune_enable tinyint(1) NOT NULL default '0',
  auth_view tinyint(2) NOT NULL default '0',
  auth_read tinyint(2) NOT NULL default '0',
  auth_post tinyint(2) NOT NULL default '0',
  auth_reply tinyint(2) NOT NULL default '0',
  auth_edit tinyint(2) NOT NULL default '0',
  auth_delete tinyint(2) NOT NULL default '0',
  auth_sticky tinyint(2) NOT NULL default '0',
  auth_announce tinyint(2) NOT NULL default '0',
  auth_vote tinyint(2) NOT NULL default '0',
  auth_pollcreate tinyint(2) NOT NULL default '0',
  auth_attachments tinyint(2) NOT NULL default '0',
  PRIMARY KEY  (forum_id),
  KEY forums_order (forum_order),
  KEY cat_id (cat_id),
  KEY forum_last_post_id (forum_last_post_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_forums`
#

INSERT INTO tools_forums (forum_id, cat_id, forum_name, forum_desc, forum_status, forum_order, forum_posts, forum_topics, forum_last_post_id, prune_next, prune_enable, auth_view, auth_read, auth_post, auth_reply, auth_edit, auth_delete, auth_sticky, auth_announce, auth_vote, auth_pollcreate, auth_attachments) VALUES (1, 1, 'General Chat', 'Things that do not fit in any of the categories above.', 0, 10, 1, 1, 2, NULL, 0, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 3),
(2, 2, 'Discussion', 'General discussion about design and information architecture habits, techniques, samples, and critics.', 0, 10, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0),
(3, 2, 'Techniques & Tools', 'The how\'s, why\'s, and where\'s to get it done.', 0, 20, 2, 2, 4, NULL, 0, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0),
(4, 3, 'Discussion', 'General discussion about scripting and programming habits, techniques, samples, and critics.', 0, 10, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0),
(5, 3, 'Techniques & Tools', 'The how\'s, why\'s, and where\'s to get it done.', 0, 20, 1, 1, 6, NULL, 0, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0),
(6, 4, 'Discussion', 'General discussion about databases, existing / upcoming technologies, techniques, samples, and critics.', 0, 10, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0),
(7, 4, 'Techniques & Tools', 'The how\'s, why\'s, and where\'s to get it done.', 0, 20, 1, 1, 5, NULL, 0, 0, 0, 0, 0, 1, 1, 3, 3, 1, 1, 0);
# --------------------------------------------------------

#
# Table structure for table `tools_groups`
#

CREATE TABLE tools_groups (
  group_id mediumint(8) NOT NULL auto_increment,
  group_type tinyint(4) NOT NULL default '1',
  group_name varchar(40) NOT NULL default '',
  group_description varchar(255) NOT NULL default '',
  group_moderator mediumint(8) NOT NULL default '0',
  group_single_user tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (group_id),
  KEY group_single_user (group_single_user)
) TYPE=MyISAM;

#
# Dumping data for table `tools_groups`
#

INSERT INTO tools_groups (group_id, group_type, group_name, group_description, group_moderator, group_single_user) VALUES (1, 1, 'Anonymous', 'Personal User', 0, 1),
(2, 1, 'Admin', 'Personal User', 0, 1);
# --------------------------------------------------------

#
# Table structure for table `tools_posts`
#

CREATE TABLE tools_posts (
  post_id mediumint(8) unsigned NOT NULL auto_increment,
  topic_id mediumint(8) unsigned NOT NULL default '0',
  forum_id smallint(5) unsigned NOT NULL default '0',
  poster_id mediumint(8) NOT NULL default '0',
  post_time int(11) NOT NULL default '0',
  poster_ip varchar(8) NOT NULL default '',
  post_username varchar(25) default NULL,
  enable_bbcode tinyint(1) NOT NULL default '1',
  enable_html tinyint(1) NOT NULL default '0',
  enable_smilies tinyint(1) NOT NULL default '1',
  enable_sig tinyint(1) NOT NULL default '1',
  post_edit_time int(11) default NULL,
  post_edit_count smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (post_id),
  KEY forum_id (forum_id),
  KEY topic_id (topic_id),
  KEY poster_id (poster_id),
  KEY post_time (post_time)
) TYPE=MyISAM;

#
# Dumping data for table `tools_posts`
#

INSERT INTO tools_posts (post_id, topic_id, forum_id, poster_id, post_time, poster_ip, post_username, enable_bbcode, enable_html, enable_smilies, enable_sig, post_edit_time, post_edit_count) VALUES (2, 2, 1, 2, 1082001592, '44b8d3c9', '', 1, 0, 1, 0, NULL, 0),
(3, 3, 3, 2, 1082001896, '44b8d3c9', '', 1, 0, 1, 0, NULL, 0),
(4, 4, 3, 2, 1082002419, '44b8d3c9', '', 1, 0, 1, 0, NULL, 0),
(5, 5, 7, 2, 1082600289, '18cff400', '', 1, 0, 1, 0, NULL, 0),
(6, 6, 5, 2, 1082603515, '18cff400', '', 1, 0, 1, 0, NULL, 0);
# --------------------------------------------------------

#
# Table structure for table `tools_posts_text`
#

CREATE TABLE tools_posts_text (
  post_id mediumint(8) unsigned NOT NULL default '0',
  bbcode_uid varchar(10) NOT NULL default '',
  post_subject varchar(60) default NULL,
  post_text text,
  PRIMARY KEY  (post_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_posts_text`
#

INSERT INTO tools_posts_text (post_id, bbcode_uid, post_subject, post_text) VALUES (2, '391cd405bb', 'Welcome: Introduce Yourself', 'Use this thread to announce your arrival, say hi, and inform everyone of who you are.\r\n\r\nCaboWabo\r\nI\'m a designer / developer from St. Louis - word to your mom.'),
(3, 'a43bea139b', 'Inspiration: Links to sites to inspire creative design', 'Use this thread to post links to sites with inspiration or general purpose in design.'),
(4, 'b9e6bfd241', 'HTML: Special Characters', '&amp;lsquo;			‘	left single quote \r\n&amp;rsquo;			’	right single quote \r\n&amp;sbquo;			‚	single low-9 quote \r\n&amp;ldquo;			“	left double quote \r\n&amp;rdquo;			”	right double quote \r\n&amp;bdquo;			„	double low-9 quote \r\n&amp;dagger;		†	dagger \r\n&amp;Dagger;		‡	double dagger \r\n&amp;permil;		‰	per mill sign \r\n&amp;lsaquo;		‹	single left-pointing angle quote \r\n&amp;rsaquo;		›	single right-pointing angle quote \r\n&amp;spades;		&#9824;	black spade suit \r\n&amp;clubs;			&#9827;	black club suit \r\n&amp;hearts;		&#9829;	black heart suit \r\n&amp;diams;			&#9830;	black diamond suit \r\n&amp;oline;			&#8254;	overline, = spacing overscore \r\n&amp;larr;			&#8592;	leftward arrow \r\n&amp;uarr;			&#8593;	upward arrow \r\n&amp;rarr;			&#8594;	rightward arrow \r\n&amp;darr;			&#8595;	downward arrow \r\n&amp;trade;			™	trademark sign\r\n\r\n\r\n		&#00;-\r\n		&#08;		unused \r\n		&#09;		horizontal tab \r\n		&#10;		line feed \r\n		&#11;		unused \r\n		&#32;		space \r\n		&#33;	!	exclamation mark \r\n&amp;quot;		&#34;	"	double quotation mark \r\n		&#35;	#	number sign \r\n		&#36;	$	dollar sign \r\n		&#37;	%	percent sign \r\n&amp;amp;		&#38;	&amp;	ampersand \r\n		&#39;	\'	apostrophe \r\n		&#40;	(	left parenthesis \r\n		&#41;	)	right parenthesis \r\n		&#42;	*	asterisk \r\n		&#43;	+	plus sign \r\n		&#44;	,	comma \r\n		&#45;	-	hyphen \r\n		&#46;	.	period'),
(5, '1688e3256d', 'Tools: ASP.NET QuickStart Tutorials', 'If you haven\'t already installed the .NET environment with the QuickStart Tutorials in place, you can use the online version.\r\n\r\nhttp://samples.gotdotnet.com/quickstart/aspplus/'),
(6, '6bbf864856', 'PHP: Download PHP', 'PHP: Hypertext Preprocessor - http://www.php.net');
# --------------------------------------------------------

#
# Table structure for table `tools_privmsgs`
#

CREATE TABLE tools_privmsgs (
  privmsgs_id mediumint(8) unsigned NOT NULL auto_increment,
  privmsgs_type tinyint(4) NOT NULL default '0',
  privmsgs_subject varchar(255) NOT NULL default '0',
  privmsgs_from_userid mediumint(8) NOT NULL default '0',
  privmsgs_to_userid mediumint(8) NOT NULL default '0',
  privmsgs_date int(11) NOT NULL default '0',
  privmsgs_ip varchar(8) NOT NULL default '',
  privmsgs_enable_bbcode tinyint(1) NOT NULL default '1',
  privmsgs_enable_html tinyint(1) NOT NULL default '0',
  privmsgs_enable_smilies tinyint(1) NOT NULL default '1',
  privmsgs_attach_sig tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (privmsgs_id),
  KEY privmsgs_from_userid (privmsgs_from_userid),
  KEY privmsgs_to_userid (privmsgs_to_userid)
) TYPE=MyISAM;

#
# Dumping data for table `tools_privmsgs`
#

# --------------------------------------------------------

#
# Table structure for table `tools_privmsgs_text`
#

CREATE TABLE tools_privmsgs_text (
  privmsgs_text_id mediumint(8) unsigned NOT NULL default '0',
  privmsgs_bbcode_uid varchar(10) NOT NULL default '0',
  privmsgs_text text,
  PRIMARY KEY  (privmsgs_text_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_privmsgs_text`
#

# --------------------------------------------------------

#
# Table structure for table `tools_ranks`
#

CREATE TABLE tools_ranks (
  rank_id smallint(5) unsigned NOT NULL auto_increment,
  rank_title varchar(50) NOT NULL default '',
  rank_min mediumint(8) NOT NULL default '0',
  rank_special tinyint(1) default '0',
  rank_image varchar(255) default NULL,
  PRIMARY KEY  (rank_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_ranks`
#

INSERT INTO tools_ranks (rank_id, rank_title, rank_min, rank_special, rank_image) VALUES (1, 'Site Admin', -1, 1, NULL);
# --------------------------------------------------------

#
# Table structure for table `tools_search_results`
#

CREATE TABLE tools_search_results (
  search_id int(11) unsigned NOT NULL default '0',
  session_id varchar(32) NOT NULL default '',
  search_array text NOT NULL,
  PRIMARY KEY  (search_id),
  KEY session_id (session_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_search_results`
#

# --------------------------------------------------------

#
# Table structure for table `tools_search_wordlist`
#

CREATE TABLE tools_search_wordlist (
  word_text varchar(50) binary NOT NULL default '',
  word_id mediumint(8) unsigned NOT NULL auto_increment,
  word_common tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (word_text),
  KEY word_id (word_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_search_wordlist`
#

INSERT INTO tools_search_wordlist (word_text, word_id, word_common) VALUES ('welcome', 23, 0),
('thread', 22, 0),
('phpbb', 3, 0),
('mom', 21, 0),
('louis', 20, 0),
('introduce', 19, 0),
('inform', 18, 0),
('developer', 17, 0),
('designer', 16, 0),
('cabowabo', 15, 0),
('arrival', 14, 0),
('announce', 13, 0),
('word', 24, 0),
('yourself', 25, 0),
('creative', 26, 0),
('design', 27, 0),
('general', 28, 0),
('inspiration', 29, 0),
('inspire', 30, 0),
('links', 31, 0),
('post', 32, 0),
('purpose', 33, 0),
('8254', 34, 0),
('8592', 35, 0),
('8593', 36, 0),
('8594', 37, 0),
('8595', 38, 0),
('9824', 39, 0),
('9827', 40, 0),
('9829', 41, 0),
('9830', 42, 0),
('amp', 43, 0),
('ampersand', 44, 0),
('angle', 45, 0),
('apostrophe', 46, 0),
('arrow', 47, 0),
('asterisk', 48, 0),
('bdquo', 49, 0),
('black', 50, 0),
('characters', 51, 0),
('club', 52, 0),
('clubs', 53, 0),
('comma', 54, 0),
('dagger', 55, 0),
('darr', 56, 0),
('diamond', 57, 0),
('diams', 58, 0),
('dollar', 59, 0),
('double', 60, 0),
('downward', 61, 0),
('exclamation', 62, 0),
('feed', 63, 0),
('heart', 64, 0),
('hearts', 65, 0),
('horizontal', 66, 0),
('html', 67, 0),
('hyphen', 68, 0),
('larr', 69, 0),
('ldquo', 70, 0),
('left', 71, 0),
('leftpointing', 72, 0),
('leftward', 73, 0),
('line', 74, 0),
('low9', 75, 0),
('lsaquo', 76, 0),
('lsquo', 77, 0),
('mark', 78, 0),
('mill', 79, 0),
('number', 80, 0),
('oline', 81, 0),
('overline', 82, 0),
('overscore', 83, 0),
('parenthesis', 84, 0),
('per', 85, 0),
('percent', 86, 0),
('period', 87, 0),
('permil', 88, 0),
('plus', 89, 0),
('quot', 90, 0),
('quotation', 91, 0),
('rarr', 92, 0),
('rdquo', 93, 0),
('right', 94, 0),
('rightpointing', 95, 0),
('rightward', 96, 0),
('rsaquo', 97, 0),
('rsquo', 98, 0),
('sbquo', 99, 0),
('sign', 100, 0),
('single', 101, 0),
('space', 102, 0),
('spacing', 103, 0),
('spade', 104, 0),
('spades', 105, 0),
('special', 106, 0),
('suit', 107, 0),
('tab', 108, 0),
('trade', 109, 0),
('trademark', 110, 0),
('uarr', 111, 0),
('unused', 112, 0),
('upward', 113, 0),
('‚', 114, 0),
('„', 115, 0),
('†', 116, 0),
('‡', 117, 0),
('‰', 118, 0),
('‹', 119, 0),
('‘', 120, 0),
('’', 121, 0),
('“', 122, 0),
('”', 123, 0),
('™', 124, 0),
('›', 125, 0),
('already', 126, 0),
('asp', 127, 0),
('environment', 128, 0),
('installed', 129, 0),
('net', 130, 0),
('online', 131, 0),
('place', 132, 0),
('quickstart', 133, 0),
('tools', 134, 0),
('tutorials', 135, 0),
('download', 136, 0),
('hypertext', 137, 0),
('php', 138, 0),
('preprocessor', 139, 0);
# --------------------------------------------------------

#
# Table structure for table `tools_search_wordmatch`
#

CREATE TABLE tools_search_wordmatch (
  post_id mediumint(8) unsigned NOT NULL default '0',
  word_id mediumint(8) unsigned NOT NULL default '0',
  title_match tinyint(1) NOT NULL default '0',
  KEY post_id (post_id),
  KEY word_id (word_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_search_wordmatch`
#

INSERT INTO tools_search_wordmatch (post_id, word_id, title_match) VALUES (2, 25, 1),
(2, 23, 1),
(2, 19, 1),
(2, 24, 0),
(2, 13, 0),
(2, 14, 0),
(2, 15, 0),
(2, 16, 0),
(2, 17, 0),
(2, 18, 0),
(2, 20, 0),
(2, 21, 0),
(2, 22, 0),
(3, 22, 0),
(3, 27, 0),
(3, 28, 0),
(3, 29, 0),
(3, 31, 0),
(3, 32, 0),
(3, 33, 0),
(3, 26, 1),
(3, 27, 1),
(3, 29, 1),
(3, 30, 1),
(3, 31, 1),
(4, 34, 0),
(4, 35, 0),
(4, 36, 0),
(4, 37, 0),
(4, 38, 0),
(4, 39, 0),
(4, 40, 0),
(4, 41, 0),
(4, 42, 0),
(4, 43, 0),
(4, 44, 0),
(4, 45, 0),
(4, 46, 0),
(4, 47, 0),
(4, 48, 0),
(4, 49, 0),
(4, 50, 0),
(4, 52, 0),
(4, 53, 0),
(4, 54, 0),
(4, 55, 0),
(4, 56, 0),
(4, 57, 0),
(4, 58, 0),
(4, 59, 0),
(4, 60, 0),
(4, 61, 0),
(4, 62, 0),
(4, 63, 0),
(4, 64, 0),
(4, 65, 0),
(4, 66, 0),
(4, 68, 0),
(4, 69, 0),
(4, 70, 0),
(4, 71, 0),
(4, 72, 0),
(4, 73, 0),
(4, 74, 0),
(4, 75, 0),
(4, 76, 0),
(4, 77, 0),
(4, 78, 0),
(4, 79, 0),
(4, 80, 0),
(4, 81, 0),
(4, 82, 0),
(4, 83, 0),
(4, 84, 0),
(4, 85, 0),
(4, 86, 0),
(4, 87, 0),
(4, 88, 0),
(4, 89, 0),
(4, 90, 0),
(4, 91, 0),
(4, 92, 0),
(4, 93, 0),
(4, 94, 0),
(4, 95, 0),
(4, 96, 0),
(4, 97, 0),
(4, 98, 0),
(4, 99, 0),
(4, 100, 0),
(4, 101, 0),
(4, 102, 0),
(4, 103, 0),
(4, 104, 0),
(4, 105, 0),
(4, 107, 0),
(4, 108, 0),
(4, 109, 0),
(4, 110, 0),
(4, 111, 0),
(4, 112, 0),
(4, 113, 0),
(4, 114, 0),
(4, 115, 0),
(4, 116, 0),
(4, 117, 0),
(4, 118, 0),
(4, 119, 0),
(4, 120, 0),
(4, 121, 0),
(4, 122, 0),
(4, 123, 0),
(4, 124, 0),
(4, 125, 0),
(4, 51, 1),
(4, 67, 1),
(4, 106, 1),
(5, 126, 0),
(5, 128, 0),
(5, 129, 0),
(5, 130, 0),
(5, 131, 0),
(5, 132, 0),
(5, 133, 0),
(5, 135, 0),
(5, 127, 1),
(5, 130, 1),
(5, 133, 1),
(5, 134, 1),
(5, 135, 1),
(6, 137, 0),
(6, 138, 0),
(6, 139, 0),
(6, 136, 1),
(6, 138, 1);
# --------------------------------------------------------

#
# Table structure for table `tools_sessions`
#

CREATE TABLE tools_sessions (
  session_id char(32) NOT NULL default '',
  session_user_id mediumint(8) NOT NULL default '0',
  session_start int(11) NOT NULL default '0',
  session_time int(11) NOT NULL default '0',
  session_ip char(8) NOT NULL default '0',
  session_page int(11) NOT NULL default '0',
  session_logged_in tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (session_id),
  KEY session_user_id (session_user_id),
  KEY session_id_ip_user_id (session_id,session_ip,session_user_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_sessions`
#

INSERT INTO tools_sessions (session_id, session_user_id, session_start, session_time, session_ip, session_page, session_logged_in) VALUES ('80329fd50b70f2aa79ab22c3650d5c42', 2, 1083859332, 1083859399, '40f018c2', 0, 1);
# --------------------------------------------------------

#
# Table structure for table `tools_smilies`
#

CREATE TABLE tools_smilies (
  smilies_id smallint(5) unsigned NOT NULL auto_increment,
  code varchar(50) default NULL,
  smile_url varchar(100) default NULL,
  emoticon varchar(75) default NULL,
  PRIMARY KEY  (smilies_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_smilies`
#

INSERT INTO tools_smilies (smilies_id, code, smile_url, emoticon) VALUES (1, ':D', 'icon_biggrin.gif', 'Very Happy'),
(2, ':-D', 'icon_biggrin.gif', 'Very Happy'),
(3, ':grin:', 'icon_biggrin.gif', 'Very Happy'),
(4, ':)', 'icon_smile.gif', 'Smile'),
(5, ':-)', 'icon_smile.gif', 'Smile'),
(6, ':smile:', 'icon_smile.gif', 'Smile'),
(7, ':(', 'icon_sad.gif', 'Sad'),
(8, ':-(', 'icon_sad.gif', 'Sad'),
(9, ':sad:', 'icon_sad.gif', 'Sad'),
(10, ':o', 'icon_surprised.gif', 'Surprised'),
(11, ':-o', 'icon_surprised.gif', 'Surprised'),
(12, ':eek:', 'icon_surprised.gif', 'Surprised'),
(13, ':shock:', 'icon_eek.gif', 'Shocked'),
(14, ':?', 'icon_confused.gif', 'Confused'),
(15, ':-?', 'icon_confused.gif', 'Confused'),
(16, ':???:', 'icon_confused.gif', 'Confused'),
(17, '8)', 'icon_cool.gif', 'Cool'),
(18, '8-)', 'icon_cool.gif', 'Cool'),
(19, ':cool:', 'icon_cool.gif', 'Cool'),
(20, ':lol:', 'icon_lol.gif', 'Laughing'),
(21, ':x', 'icon_mad.gif', 'Mad'),
(22, ':-x', 'icon_mad.gif', 'Mad'),
(23, ':mad:', 'icon_mad.gif', 'Mad'),
(24, ':P', 'icon_razz.gif', 'Razz'),
(25, ':-P', 'icon_razz.gif', 'Razz'),
(26, ':razz:', 'icon_razz.gif', 'Razz'),
(27, ':oops:', 'icon_redface.gif', 'Embarassed'),
(28, ':cry:', 'icon_cry.gif', 'Crying or Very sad'),
(29, ':evil:', 'icon_evil.gif', 'Evil or Very Mad'),
(30, ':twisted:', 'icon_twisted.gif', 'Twisted Evil'),
(31, ':roll:', 'icon_rolleyes.gif', 'Rolling Eyes'),
(32, ':wink:', 'icon_wink.gif', 'Wink'),
(33, ';)', 'icon_wink.gif', 'Wink'),
(34, ';-)', 'icon_wink.gif', 'Wink'),
(35, ':!:', 'icon_exclaim.gif', 'Exclamation'),
(36, ':?:', 'icon_question.gif', 'Question'),
(37, ':idea:', 'icon_idea.gif', 'Idea'),
(38, ':arrow:', 'icon_arrow.gif', 'Arrow'),
(39, ':|', 'icon_neutral.gif', 'Neutral'),
(40, ':-|', 'icon_neutral.gif', 'Neutral'),
(41, ':neutral:', 'icon_neutral.gif', 'Neutral'),
(42, ':mrgreen:', 'icon_mrgreen.gif', 'Mr. Green');
# --------------------------------------------------------

#
# Table structure for table `tools_themes`
#

CREATE TABLE tools_themes (
  themes_id mediumint(8) unsigned NOT NULL auto_increment,
  template_name varchar(30) NOT NULL default '',
  style_name varchar(30) NOT NULL default '',
  head_stylesheet varchar(100) default NULL,
  body_background varchar(100) default NULL,
  body_bgcolor varchar(6) default NULL,
  body_text varchar(6) default NULL,
  body_link varchar(6) default NULL,
  body_vlink varchar(6) default NULL,
  body_alink varchar(6) default NULL,
  body_hlink varchar(6) default NULL,
  tr_color1 varchar(6) default NULL,
  tr_color2 varchar(6) default NULL,
  tr_color3 varchar(6) default NULL,
  tr_class1 varchar(25) default NULL,
  tr_class2 varchar(25) default NULL,
  tr_class3 varchar(25) default NULL,
  th_color1 varchar(6) default NULL,
  th_color2 varchar(6) default NULL,
  th_color3 varchar(6) default NULL,
  th_class1 varchar(25) default NULL,
  th_class2 varchar(25) default NULL,
  th_class3 varchar(25) default NULL,
  td_color1 varchar(6) default NULL,
  td_color2 varchar(6) default NULL,
  td_color3 varchar(6) default NULL,
  td_class1 varchar(25) default NULL,
  td_class2 varchar(25) default NULL,
  td_class3 varchar(25) default NULL,
  fontface1 varchar(50) default NULL,
  fontface2 varchar(50) default NULL,
  fontface3 varchar(50) default NULL,
  fontsize1 tinyint(4) default NULL,
  fontsize2 tinyint(4) default NULL,
  fontsize3 tinyint(4) default NULL,
  fontcolor1 varchar(6) default NULL,
  fontcolor2 varchar(6) default NULL,
  fontcolor3 varchar(6) default NULL,
  span_class1 varchar(25) default NULL,
  span_class2 varchar(25) default NULL,
  span_class3 varchar(25) default NULL,
  img_size_poll smallint(5) unsigned default NULL,
  img_size_privmsg smallint(5) unsigned default NULL,
  PRIMARY KEY  (themes_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_themes`
#

INSERT INTO tools_themes (themes_id, template_name, style_name, head_stylesheet, body_background, body_bgcolor, body_text, body_link, body_vlink, body_alink, body_hlink, tr_color1, tr_color2, tr_color3, tr_class1, tr_class2, tr_class3, th_color1, th_color2, th_color3, th_class1, th_class2, th_class3, td_color1, td_color2, td_color3, td_class1, td_class2, td_class3, fontface1, fontface2, fontface3, fontsize1, fontsize2, fontsize3, fontcolor1, fontcolor2, fontcolor3, span_class1, span_class2, span_class3, img_size_poll, img_size_privmsg) VALUES (1, 'subSilver', 'subSilver', 'subSilver.css', '', 'E5E5E5', '000000', '006699', '5493B4', '', 'DD6900', 'EFEFEF', 'DEE3E7', 'D1D7DC', '', '', '', '98AAB1', '006699', 'FFFFFF', 'cellpic1.gif', 'cellpic3.gif', 'cellpic2.jpg', 'FAFAFA', 'FFFFFF', '', 'row1', 'row2', '', 'Verdana, Arial, Helvetica, sans-serif', 'Trebuchet MS', 'Courier, \'Courier New\', sans-serif', 10, 11, 12, '444444', '006600', 'FFA34F', '', '', '', NULL, NULL);
# --------------------------------------------------------

#
# Table structure for table `tools_themes_name`
#

CREATE TABLE tools_themes_name (
  themes_id smallint(5) unsigned NOT NULL default '0',
  tr_color1_name char(50) default NULL,
  tr_color2_name char(50) default NULL,
  tr_color3_name char(50) default NULL,
  tr_class1_name char(50) default NULL,
  tr_class2_name char(50) default NULL,
  tr_class3_name char(50) default NULL,
  th_color1_name char(50) default NULL,
  th_color2_name char(50) default NULL,
  th_color3_name char(50) default NULL,
  th_class1_name char(50) default NULL,
  th_class2_name char(50) default NULL,
  th_class3_name char(50) default NULL,
  td_color1_name char(50) default NULL,
  td_color2_name char(50) default NULL,
  td_color3_name char(50) default NULL,
  td_class1_name char(50) default NULL,
  td_class2_name char(50) default NULL,
  td_class3_name char(50) default NULL,
  fontface1_name char(50) default NULL,
  fontface2_name char(50) default NULL,
  fontface3_name char(50) default NULL,
  fontsize1_name char(50) default NULL,
  fontsize2_name char(50) default NULL,
  fontsize3_name char(50) default NULL,
  fontcolor1_name char(50) default NULL,
  fontcolor2_name char(50) default NULL,
  fontcolor3_name char(50) default NULL,
  span_class1_name char(50) default NULL,
  span_class2_name char(50) default NULL,
  span_class3_name char(50) default NULL,
  PRIMARY KEY  (themes_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_themes_name`
#

INSERT INTO tools_themes_name (themes_id, tr_color1_name, tr_color2_name, tr_color3_name, tr_class1_name, tr_class2_name, tr_class3_name, th_color1_name, th_color2_name, th_color3_name, th_class1_name, th_class2_name, th_class3_name, td_color1_name, td_color2_name, td_color3_name, td_class1_name, td_class2_name, td_class3_name, fontface1_name, fontface2_name, fontface3_name, fontsize1_name, fontsize2_name, fontsize3_name, fontcolor1_name, fontcolor2_name, fontcolor3_name, span_class1_name, span_class2_name, span_class3_name) VALUES (1, 'The lightest row colour', 'The medium row color', 'The darkest row colour', '', '', '', 'Border round the whole page', 'Outer table border', 'Inner table border', 'Silver gradient picture', 'Blue gradient picture', 'Fade-out gradient on index', 'Background for quote boxes', 'All white areas', '', 'Background for topic posts', '2nd background for topic posts', '', 'Main fonts', 'Additional topic title font', 'Form fonts', 'Smallest font size', 'Medium font size', 'Normal font size (post body etc)', 'Quote & copyright text', 'Code text colour', 'Main table header text colour', '', '', '');
# --------------------------------------------------------

#
# Table structure for table `tools_topics`
#

CREATE TABLE tools_topics (
  topic_id mediumint(8) unsigned NOT NULL auto_increment,
  forum_id smallint(8) unsigned NOT NULL default '0',
  topic_title char(60) NOT NULL default '',
  topic_poster mediumint(8) NOT NULL default '0',
  topic_time int(11) NOT NULL default '0',
  topic_views mediumint(8) unsigned NOT NULL default '0',
  topic_replies mediumint(8) unsigned NOT NULL default '0',
  topic_status tinyint(3) NOT NULL default '0',
  topic_vote tinyint(1) NOT NULL default '0',
  topic_type tinyint(3) NOT NULL default '0',
  topic_first_post_id mediumint(8) unsigned NOT NULL default '0',
  topic_last_post_id mediumint(8) unsigned NOT NULL default '0',
  topic_moved_id mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (topic_id),
  KEY forum_id (forum_id),
  KEY topic_moved_id (topic_moved_id),
  KEY topic_status (topic_status),
  KEY topic_type (topic_type)
) TYPE=MyISAM;

#
# Dumping data for table `tools_topics`
#

INSERT INTO tools_topics (topic_id, forum_id, topic_title, topic_poster, topic_time, topic_views, topic_replies, topic_status, topic_vote, topic_type, topic_first_post_id, topic_last_post_id, topic_moved_id) VALUES (2, 1, 'Welcome: Introduce Yourself', 2, 1082001592, 1, 0, 0, 0, 1, 2, 2, 0),
(3, 3, 'Inspiration: Links to sites to inspire creative design', 2, 1082001896, 1, 0, 0, 0, 0, 3, 3, 0),
(4, 3, 'HTML: Special Characters', 2, 1082002419, 1, 0, 0, 0, 0, 4, 4, 0),
(5, 7, 'Tools: ASP.NET QuickStart Tutorials', 2, 1082600289, 1, 0, 0, 0, 0, 5, 5, 0),
(6, 5, 'PHP: Download PHP', 2, 1082603515, 1, 0, 0, 0, 0, 6, 6, 0);
# --------------------------------------------------------

#
# Table structure for table `tools_topics_watch`
#

CREATE TABLE tools_topics_watch (
  topic_id mediumint(8) unsigned NOT NULL default '0',
  user_id mediumint(8) NOT NULL default '0',
  notify_status tinyint(1) NOT NULL default '0',
  KEY topic_id (topic_id),
  KEY user_id (user_id),
  KEY notify_status (notify_status)
) TYPE=MyISAM;

#
# Dumping data for table `tools_topics_watch`
#

# --------------------------------------------------------

#
# Table structure for table `tools_user_group`
#

CREATE TABLE tools_user_group (
  group_id mediumint(8) NOT NULL default '0',
  user_id mediumint(8) NOT NULL default '0',
  user_pending tinyint(1) default NULL,
  KEY group_id (group_id),
  KEY user_id (user_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_user_group`
#

INSERT INTO tools_user_group (group_id, user_id, user_pending) VALUES (1, -1, 0),
(2, 2, 0);
# --------------------------------------------------------

#
# Table structure for table `tools_users`
#

CREATE TABLE tools_users (
  user_id mediumint(8) NOT NULL default '0',
  user_active tinyint(1) default '1',
  username varchar(25) NOT NULL default '',
  user_password varchar(32) NOT NULL default '',
  user_session_time int(11) NOT NULL default '0',
  user_session_page smallint(5) NOT NULL default '0',
  user_lastvisit int(11) NOT NULL default '0',
  user_regdate int(11) NOT NULL default '0',
  user_level tinyint(4) default '0',
  user_posts mediumint(8) unsigned NOT NULL default '0',
  user_timezone decimal(5,2) NOT NULL default '0.00',
  user_style tinyint(4) default NULL,
  user_lang varchar(255) default NULL,
  user_dateformat varchar(14) NOT NULL default 'd M Y H:i',
  user_new_privmsg smallint(5) unsigned NOT NULL default '0',
  user_unread_privmsg smallint(5) unsigned NOT NULL default '0',
  user_last_privmsg int(11) NOT NULL default '0',
  user_emailtime int(11) default NULL,
  user_viewemail tinyint(1) default NULL,
  user_attachsig tinyint(1) default NULL,
  user_allowhtml tinyint(1) default '1',
  user_allowbbcode tinyint(1) default '1',
  user_allowsmile tinyint(1) default '1',
  user_allowavatar tinyint(1) NOT NULL default '1',
  user_allow_pm tinyint(1) NOT NULL default '1',
  user_allow_viewonline tinyint(1) NOT NULL default '1',
  user_notify tinyint(1) NOT NULL default '1',
  user_notify_pm tinyint(1) NOT NULL default '0',
  user_popup_pm tinyint(1) NOT NULL default '0',
  user_rank int(11) default '0',
  user_avatar varchar(100) default NULL,
  user_avatar_type tinyint(4) NOT NULL default '0',
  user_email varchar(255) default NULL,
  user_icq varchar(15) default NULL,
  user_website varchar(100) default NULL,
  user_from varchar(100) default NULL,
  user_sig text,
  user_sig_bbcode_uid varchar(10) default NULL,
  user_aim varchar(255) default NULL,
  user_yim varchar(255) default NULL,
  user_msnm varchar(255) default NULL,
  user_occ varchar(100) default NULL,
  user_interests varchar(255) default NULL,
  user_actkey varchar(32) default NULL,
  user_newpasswd varchar(32) default NULL,
  PRIMARY KEY  (user_id),
  KEY user_session_time (user_session_time)
) TYPE=MyISAM;

#
# Dumping data for table `tools_users`
#

INSERT INTO tools_users (user_id, user_active, username, user_password, user_session_time, user_session_page, user_lastvisit, user_regdate, user_level, user_posts, user_timezone, user_style, user_lang, user_dateformat, user_new_privmsg, user_unread_privmsg, user_last_privmsg, user_emailtime, user_viewemail, user_attachsig, user_allowhtml, user_allowbbcode, user_allowsmile, user_allowavatar, user_allow_pm, user_allow_viewonline, user_notify, user_notify_pm, user_popup_pm, user_rank, user_avatar, user_avatar_type, user_email, user_icq, user_website, user_from, user_sig, user_sig_bbcode_uid, user_aim, user_yim, user_msnm, user_occ, user_interests, user_actkey, user_newpasswd) VALUES (-1, 0, 'Anonymous', '', 0, 0, 0, 1081999375, 0, 0, '0.00', NULL, '', '', 0, 0, 0, NULL, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 0, NULL, '', 0, '', '', '', '', '', NULL, '', '', '', '', '', '', ''),
(2, 1, 'CaboWabo', 'a86c34995eece685937b5b0189b4b182', 1083859399, 0, 1082603577, 1081999375, 1, 5, '0.00', 1, 'english', 'd M Y h:i a', 0, 0, 0, NULL, 1, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, '', 0, 'superdupersleuth2002@yahoo.com', '', '', '', '', NULL, '', '', '', '', '', '', '');
# --------------------------------------------------------

#
# Table structure for table `tools_vote_desc`
#

CREATE TABLE tools_vote_desc (
  vote_id mediumint(8) unsigned NOT NULL auto_increment,
  topic_id mediumint(8) unsigned NOT NULL default '0',
  vote_text text NOT NULL,
  vote_start int(11) NOT NULL default '0',
  vote_length int(11) NOT NULL default '0',
  PRIMARY KEY  (vote_id),
  KEY topic_id (topic_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_vote_desc`
#

# --------------------------------------------------------

#
# Table structure for table `tools_vote_results`
#

CREATE TABLE tools_vote_results (
  vote_id mediumint(8) unsigned NOT NULL default '0',
  vote_option_id tinyint(4) unsigned NOT NULL default '0',
  vote_option_text varchar(255) NOT NULL default '',
  vote_result int(11) NOT NULL default '0',
  KEY vote_option_id (vote_option_id),
  KEY vote_id (vote_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_vote_results`
#

# --------------------------------------------------------

#
# Table structure for table `tools_vote_voters`
#

CREATE TABLE tools_vote_voters (
  vote_id mediumint(8) unsigned NOT NULL default '0',
  vote_user_id mediumint(8) NOT NULL default '0',
  vote_user_ip char(8) NOT NULL default '',
  KEY vote_id (vote_id),
  KEY vote_user_id (vote_user_id),
  KEY vote_user_ip (vote_user_ip)
) TYPE=MyISAM;

#
# Dumping data for table `tools_vote_voters`
#

# --------------------------------------------------------

#
# Table structure for table `tools_words`
#

CREATE TABLE tools_words (
  word_id mediumint(8) unsigned NOT NULL auto_increment,
  word char(100) NOT NULL default '',
  replacement char(100) NOT NULL default '',
  PRIMARY KEY  (word_id)
) TYPE=MyISAM;

#
# Dumping data for table `tools_words`
#


