# phpMyAdmin MySQL-Dump
# version 2.2.4
# http://phpwizard.net/phpMyAdmin/
# http://phpmyadmin.sourceforge.net/ (download page)
#
# Host: localhost
# Generation Time: Jul 22, 2004 at 01:24 PM
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

INSERT INTO myMovies VALUES (1, 9, 'Boiler Room', '120', 1, 'Giovanni Ribisi, Vin Diesel, Nia Long, Nicky Katt', '1');
INSERT INTO myMovies VALUES (2, 7, 'Blade', '120', 1, 'Wesley Snipes, Stephen Dorff', '1');
INSERT INTO myMovies VALUES (3, 1, 'Bad Boys', '119', 1, 'Will Smith, Martin Lawrence', '1');
INSERT INTO myMovies VALUES (4, 9, 'Assassins', '133', 1, 'Sylvester Stallone, Antonio Banderas', '1');
INSERT INTO myMovies VALUES (5, 4, 'Stuart Saves His Family', '97', 3, 'Al Franken, Laura San Giacomo', '1');
INSERT INTO myMovies VALUES (6, 4, 'Big Momma\\\'s House', '98', 3, 'Martin Lawrence', '1');
INSERT INTO myMovies VALUES (7, 4, 'Big Daddy', '93', 3, 'Adam Sandler', '1');
INSERT INTO myMovies VALUES (8, 4, 'The Big Lebowski', '98', 1, 'Jeff Bridges, John Goodman, Julianne Moore, Steve Buscemi, John Turturro', '1');
INSERT INTO myMovies VALUES (9, 3, 'Bed Of Roses', '88', 4, 'Christian Slater, Mary Stuart Masterson', '1');
INSERT INTO myMovies VALUES (10, 5, 'American Beauty', '122', 1, 'Kevin Spacey, Annette Bening', '1');
INSERT INTO myMovies VALUES (11, 1, 'Bait', '119', 1, 'Jamie Foxx', '1');
INSERT INTO myMovies VALUES (12, 4, 'Austin Powers: International Man Of Mystery', '90', 3, 'Mike Meyers, Elizabeth Hurley', '1');
INSERT INTO myMovies VALUES (13, 4, 'Analyze This', '104', 1, 'Robert Deniro, Billy Crystal, Lisa Kudrow', '1');
INSERT INTO myMovies VALUES (14, 5, 'Any Given Sunday', '157', 1, 'Al Pacino, Dennis Quaid, Jamie Foxx, Cameron Diaz, James Woods, LL Cool J', '1');
INSERT INTO myMovies VALUES (15, 4, 'Austin Powers: The Spy Who Shagged Me', '*', 3, 'Mike Meyers, Heather Graham', '1');
INSERT INTO myMovies VALUES (16, 5, 'The Bonfire Of The Vanities', '126', 1, 'Tom Hanks, Bruce Willis, Melanie Griffith', '1');
INSERT INTO myMovies VALUES (17, 5, 'Almost Famous', '123', 1, 'Kate Hudson, Billy Crudup, Frances McDormand, Philip Seymour Hoffman', '1');
INSERT INTO myMovies VALUES (18, 5, 'Traffic', '147', 1, 'Michael Douglas, Don Cheadle, Benicio Del Toro, Dennis Quaid, Catherine Zeta-Jones', '1');
INSERT INTO myMovies VALUES (19, 5, 'Braveheart', '177', 1, 'Mel Gibson, Sophie Marceau', '1');
INSERT INTO myMovies VALUES (20, 4, 'Bowfinger', '97', 3, 'Eddie Murphy, Steve Martin', '1');
INSERT INTO myMovies VALUES (21, 5, 'The Basketball Diaries', '102', 1, 'Leonard DiCaprio, Mark Wahlberg, Bruno Kirby, Lorraine Bracco', '1');
INSERT INTO myMovies VALUES (22, 4, 'Beetlejuice', '92', 4, 'Michael Keaton, Geena Davis, Alec Baldwin, Winona Ryder, Sylvia Sidney', '1');
INSERT INTO myMovies VALUES (23, 5, 'The Beach', '*', 1, 'Leonardo DiCaprio, Virginie Ledoyen', '1');
INSERT INTO myMovies VALUES (24, 1, 'Blue Streak', '94', 3, 'Martin Lawrence, Luke Wilson, Dave Chappelle', '1');
INSERT INTO myMovies VALUES (25, 1, 'Batman', '126', 3, 'Jack Nicholson, Michael Keaton, Kim Basinger', '1');
INSERT INTO myMovies VALUES (26, 1, 'Batman Returns', '126', 3, 'Michael Keaton, Danny DeVito, Michelle Pfeiffer', '1');
INSERT INTO myMovies VALUES (27, 1, 'Batman Forever', '122', 3, 'Val Kilmer, Tommy Lee Jones, Jim Carrey, Nichole Kidman, Chris O\\\'Donnell', '1');
INSERT INTO myMovies VALUES (28, 1, 'Batman & Robin', '125', 3, 'Arnold Schwarzenegger, George Clooney, Chris O\\\'Donnell, Uma Thurman, Alicia Silverstone', '1');
INSERT INTO myMovies VALUES (29, 3, 'Down To You', '92', 3, 'Freddie Prinze Jr., Julia Stiles', '1');
INSERT INTO myMovies VALUES (30, 4, 'Drowning Mona', '96', 3, 'Danny DeVito, Bette Midler, Neve Campbell, Jamie Lee Curtis', '1');
INSERT INTO myMovies VALUES (31, 2, 'Dr. Seuss\\\'s How The Grinch Stole Christmas!', '60', 5, 'Grinch', '1');
INSERT INTO myMovies VALUES (32, 4, 'Dumb And Dumber', '106', 3, 'Jim Carrey, Jeff Daniels', '1');
INSERT INTO myMovies VALUES (33, 2, 'Frosty The Snowman', '70', 5, 'Frosty', '1');
INSERT INTO myMovies VALUES (34, 4, 'Dogma', '128', 1, 'Ben Affleck, Matt Damon, Linda Fiorentino, Salma Hayek, Jason Lee, Jason Mewes, Allan Rickman, Chris Rock, Kevin Smith', '1');
INSERT INTO myMovies VALUES (35, 5, 'As Good As It Gets', '139', 3, 'Jack Nicholson, Helen Hunt, Greg Kinnear', '1');
INSERT INTO myMovies VALUES (36, 9, 'Final Destination', '98', 1, 'Devon Sawa, Ali Larter, Kerr Smith', '1');
INSERT INTO myMovies VALUES (37, 9, 'The Firm', '154', 1, 'Tom Cruise, Jeanne Tripplehorn, Gene Hackman, Ed Harris, Holly Hunter', '1');
INSERT INTO myMovies VALUES (38, 4, 'Four Rooms', '98', 1, 'Tim Roth, Antonio Bandaras, Jennifer Beals, Paul Calderon, Sammi Davis, Madonna, Valeria Golino, David Proval, Ione Skye, Lilli Taylor, Marisa Tomei, Tamlyn Tomita', '1');
INSERT INTO myMovies VALUES (39, 6, 'From Dusk Till Dawn', '108', 1, 'Harvey Keitel, George Clooney, Quentin Tarantino, Juliette Lewis, Salma Hayek, Cheech Marin', '1');
INSERT INTO myMovies VALUES (40, 6, 'Fargo', '98', 1, 'Frances McDormand, William H Macy, Steve Buscemi, Harve Presnell', '1');
INSERT INTO myMovies VALUES (41, 5, 'The Fan', '116', 1, 'Robert DeNiro, Wesley Snipes', '1');
INSERT INTO myMovies VALUES (42, 1, 'Face / Off', '140', 1, 'John Travolta, Nicolas Cage, Joan Allen, Gina Gershon', '1');
INSERT INTO myMovies VALUES (43, 4, 'Ace Ventura: Pet Detective', '87', 3, 'Jim Carrey, Sean Young, Courtney Cox, Tone Loc, Dan Marino', '1');
INSERT INTO myMovies VALUES (44, 9, 'The Fugitive', '131', 3, 'Harrison Ford, Tommy Lee Jones, Sela Ward, Joe Pantoliano', '1');
INSERT INTO myMovies VALUES (45, 1, 'Full Metal Jacket', '116', 1, 'Matthew Modine, Adam Baldwin, Vincent D\\\'onofrio', '1');
INSERT INTO myMovies VALUES (46, 9, 'Enemy Of The State', '132', 1, 'Will Smith, Gene Hackman, John Voight, Regina King, Barry Pepper', '1');
INSERT INTO myMovies VALUES (47, 6, '8MM', '123', 1, 'Nicolas Cage, Joaquin Phoenix, James Gandolfini', '1');
INSERT INTO myMovies VALUES (48, 1, 'Eraser', '115', 1, 'Arnold Schwarzenegger, James Caan, Vanessa Williams', '1');
INSERT INTO myMovies VALUES (49, 5, 'Erin Brockovich', '132', 1, 'Julia Roberts, Albert Finney, Arron Eckhart', '1');
INSERT INTO myMovies VALUES (50, 1, 'Desperado', '103', 1, 'Antonio Bandaras, Salma Hayek, Steve Buscemi, Cheech Marin, Quentin Tartantino', '1');
INSERT INTO myMovies VALUES (51, 4, 'Deuce Bigalow Male Gigolo', '88', 1, 'Rob Schneider,William Forsythe, Eddie Griffin', '1');
INSERT INTO myMovies VALUES (52, 5, 'Corrina, Corrina', '115', 4, 'Whoopi Goldberg, Ray Liotta', '1');
INSERT INTO myMovies VALUES (53, 7, 'Contact', '150', 4, 'Jodie Foster, Matthew McConaughhey, James Woods, John Hurt', '1');
INSERT INTO myMovies VALUES (54, 5, 'Casino', '179', 1, 'Robert DiNiro, Sharon Stone, Joe Pesci, Don Rickles, Alan King, Kevin Pollak', '1');
INSERT INTO myMovies VALUES (55, 6, 'The Cell', '107', 1, 'Jennifer Lopez, Vince Vaughn, Vincent D\\\'Onfrio', '1');
INSERT INTO myMovies VALUES (56, 4, 'Clueless', '97', 3, 'Alicia Silverstone, Brittany Murphy, Justin Walker, Paul Rudd, Stacey Dash', '1');
INSERT INTO myMovies VALUES (57, 4, 'Clerks', '92', 1, 'Kevin Smith, Jason Mewes, Jeff Anderson, Scott Mosier, Marilyn Ghigliotti, Lisa Spoonhauer', '1');
INSERT INTO myMovies VALUES (58, 4, 'A Christmas Story', '98', 4, 'Melinda Dillon, Darren McGavin, Peter Billingsley', '1');
INSERT INTO myMovies VALUES (59, 4, 'Chasing Amy', '113', 1, 'Kevin Smith, Ben Affleck, Jason Lee, Jason Mewes, Joey Lauren Adams, Dwight Ewell', '1');
INSERT INTO myMovies VALUES (60, 1, 'Demolition Man', '115', 1, 'Sylvester Stallone, Wesley Snipes, Sandra Bullock, Nigel Hawthorne', '1');
INSERT INTO myMovies VALUES (61, 4, 'Dazed And Confused', '103', 1, 'Jason London, Joey Lauren Adams, Milla Jovovich, Rory Cochrane, Marissa Ribisi', '1');
INSERT INTO myMovies VALUES (62, 5, 'A Bronx Tale', '122', 1, 'Robert DeNiro, Chazz Palminteri', '1');
INSERT INTO myMovies VALUES (63, 4, 'Caddyshack', '99', 1, 'Chevy Chase, Rodney Dangerfield, Ted Knight, Michael O\\\'Keefe, Bill Murray', '1');
INSERT INTO myMovies VALUES (64, 5, 'Clockers', '129', 1, 'Harvey Keitel, John Turturro, Delroy Lindo, Mekhi Phifer, Isaiah Washington', '1');
INSERT INTO myMovies VALUES (65, 2, 'Charlie Brown: A Charlie Brown Christmas', '25', 5, 'Charlie Brown', '1');
INSERT INTO myMovies VALUES (66, 2, 'Charlie Brown: A Charlie Brown Thanksgiving', '30', 5, 'Charlie Brown', '1');
INSERT INTO myMovies VALUES (67, 2, 'Charlie Brown: It\\\'s The Great Pumpkin, Charlie Brown', '25', 5, 'Charlie Brown', '1');
INSERT INTO myMovies VALUES (68, 1, 'Die Hard: Die Hard', '132', 1, 'Bruce Willis, Alan Rickman, Bonnie Bedelia', '1');
INSERT INTO myMovies VALUES (69, 1, 'Die Hard: Die Hard 2', '124', 1, 'Bruce Willis, Bonnie Bedelia, William Atherton', '1');
INSERT INTO myMovies VALUES (70, 1, 'Die Hard: Die Hard With A Vengeance', '131', 1, 'Bruce Willis, Jeremy Irons, Samuel L. Jackson', '1');
INSERT INTO myMovies VALUES (71, 5, 'A Beautiful Mind', '136', 3, 'Russell Crowe, Jennifer Connelly, Paul Bettany, Adam Goldberg, Judd Hersch', '1');
INSERT INTO myMovies VALUES (72, 3, 'Sleepless in Seatle', '105', 4, 'Tom Hanks, Meg Ryan', '1');
INSERT INTO myMovies VALUES (73, 1, 'Spider-Man', '121', 3, 'Tobey Maguire, Willem Dafoe, Kristen Dunst, James Franco', '1');
INSERT INTO myMovies VALUES (74, 9, 'Minority Report', '146', 3, 'Tom Cruise, Colin Farrell, Samantha Morton, Max Von Sydow', '1');
INSERT INTO myMovies VALUES (75, 7, 'Harry Potter And The Sorcerer\\\'s Stone', '152', 4, 'Daniel Radcliffe, Rupert Grint, Emma Watson, John Cleese, Robbie Coltrane, Warwick Davis, Richard Griffiths, Richard Harris, Ian Hart, John Hurt, Alan Rickman, Fiona Shaw, Maggie Smith, Julie Walters', '1');
INSERT INTO myMovies VALUES (76, 4, 'Old School (Unrated And Out Of Control)', '92', 1, 'Luke Wilson, Will Ferrell, Vince Vaughn', '1');
INSERT INTO myMovies VALUES (77, 4, 'Money Talks', '95', 1, 'Chris Tucker, Charlie Sheen, Heather Locklear, Gerard Ismael, Paul Sorvino', '1');
INSERT INTO myMovies VALUES (78, 1, 'Charlie\\\'s Angels', '99', 3, 'Cameron Diaz, Drew Barrymore, Lucy Liu, Bill Murray, Sam Rockwell, Tim Curry, Kelly Lynch, Crispin Glover', '1');
INSERT INTO myMovies VALUES (79, 1, 'The Lord Of The Rings: The Two Towers', '179', 3, 'Elijah Wood, Ian McKellen, Liv Tyler, Viggo Mortensen, Sean Astin, Cate Blanchett', '1');
INSERT INTO myMovies VALUES (80, 9, 'Insomnia', '118', 1, 'Al Pacino, Robin Williams, Hilary Swank', '1');
INSERT INTO myMovies VALUES (81, 9, 'Phone Booth', '81', 1, 'Colin Ferrell, Forest Whitaker, Kiefer Sutherland, Katie Holmes', '1');
INSERT INTO myMovies VALUES (82, 6, 'Identity', '90', 1, 'John Cusack, Ray Liotta, Amanda Peet', '1');
INSERT INTO myMovies VALUES (83, 1, '007: Die Another Day', '132', 3, 'Pierce Brosnan, Halle Berry, Toby Stephens, John Cleese', '1');
INSERT INTO myMovies VALUES (84, 8, 'Sex And The City 1: The Complete First Season (2 Discs)', '300', 1, 'Sarah Jessica Parker, Cynthia Nixon, Kim Cattrall, Kristin Davis', '1');
INSERT INTO myMovies VALUES (85, 8, 'Sex And The City 2: The Complete Second Season (3 Discs)', '540', 1, 'Sarah Jessica Parker, Cynthia Nixon, Kim Cattrall, Kristin Davis', '1');
INSERT INTO myMovies VALUES (86, 8, 'Sex And The City 3: The Complete Third Season (3 Discs)', '540', 1, 'Sarah Jessica Parker, Cynthia Nixon, Kim Cattrall, Kristin Davis', '1');
INSERT INTO myMovies VALUES (87, 8, 'Sex And The City 4: The Complete Fourth Season (3 Discs)', '540', 1, 'Sarah Jessica Parker, Cynthia Nixon, Kim Cattrall, Kristin Davis', '1');
INSERT INTO myMovies VALUES (88, 8, '24: Season One (6 Discs)', '1152', 1, 'Kiefer Sutherland', '1');
INSERT INTO myMovies VALUES (89, 8, 'The Sopranos 1: The Complete First Season (3 Discs)', '680', 1, 'James Gandolfini, Lorraine Bracco, Edie Falco, Michael Imperioli, Dominic Chianese, Vincent Pastore', '1');
INSERT INTO myMovies VALUES (90, 8, 'The Sopranos 2: The Complete Second Season (4 Discs)', '696', 1, 'James Gandolfini, Lorraine Bracco, Edie Falco, Michael Imperioli, Dominic Chianese, Vincent Pastore', '1');
INSERT INTO myMovies VALUES (91, 8, 'The Sopranos 3: The Complete Third Season (4 Discs)', '780', 1, 'James Gandolfini, Lorraine Bracco, Edie Falco, Michael Imperioli, Dominic Chianese, Vincent Pastore', '1');
INSERT INTO myMovies VALUES (92, 8, 'The X-Files 1: The Complete First Season (6 Discs)', '*', 4, 'David Duchovny, Gillian Anderson, Robert Patrick', '1');
INSERT INTO myMovies VALUES (93, 8, 'The X-Files 2: The Complete Second Season (6 Discs)', '*', 4, 'David Duchovny, Gillian Anderson, Robert Patrick', '1');
INSERT INTO myMovies VALUES (94, 8, 'The X-Files 3: The Complete Third Season (6 Discs)', '*', 4, 'David Duchovny, Gillian Anderson, Robert Patrick', '1');
INSERT INTO myMovies VALUES (95, 8, 'The X-Files 4: The Complete Fourth Season (6 Discs)', '*', 4, 'David Duchovny, Gillian Anderson, Robert Patrick', '1');
INSERT INTO myMovies VALUES (96, 8, 'The X-Files 5: The Complete Fifth Season (5 Discs)', '*', 4, 'David Duchovny, Gillian Anderson, Robert Patrick', '1');
INSERT INTO myMovies VALUES (97, 8, 'The X-Files 6: The Complete Sixth Season (6 Discs)', '*', 4, 'David Duchovny, Gillian Anderson, Robert Patrick', '1');
INSERT INTO myMovies VALUES (98, 4, 'Austin Powers: Gold Member', '94', 3, 'Mike Myers, Beyonce Knowles, Michael Caine, Verne Troyer, Seth Green', '1');
INSERT INTO myMovies VALUES (99, 3, 'Grease', '110', 4, 'John Travolta, Oliva Newton-John', '1');
INSERT INTO myMovies VALUES (100, 7, 'Star Wars: Episode II - Attack Of The Clones', '142', 4, 'Ewan McGreggor, Natalie Portman, Hayden Christensen, Samuel L. Jackson', '1');
INSERT INTO myMovies VALUES (101, 4, 'Me, Myself & Irene', '116', 1, 'Jim Carrey, Renee Zellweger', '1');
INSERT INTO myMovies VALUES (102, 7, 'E.T. The Extra-Terrestrial ', '121', 4, 'Henry Thomas, Dee Wallace-Stone, Robert MacNaughton, Drew Barrymore, C. Thomas Howell', '1');
INSERT INTO myMovies VALUES (103, 2, 'Shrek', '93', 4, 'Mike Myers, Eddie Murphy, Cameron Diaz, John Lithgow', '1');
INSERT INTO myMovies VALUES (104, 5, 'Dr. Seuss\\\' How The Grinch Stole Christmas (Non-Animated)', '105', 4, 'Jim Carrey, Jeffrey Tambor, Christine Baranski, Molly Shannon', '1');
INSERT INTO myMovies VALUES (105, 1, 'Lara Croft Tomb Raider', '100', 3, 'Angelina Jolie, Jon Voight, Ian Glen, Noah Taylor', '1');
INSERT INTO myMovies VALUES (106, 4, 'The Rocky Horror Picture Show', '100', 1, 'Tim Curry, Susan Sarandon, Barry Bostwick', '1');
INSERT INTO myMovies VALUES (107, 4, 'American Pie 2 (Unrated)', '111', 1, 'Jason Biggs, Shannon Elizabeth, Alyson Hannigan, Chris Klein, Seann William Scott', '1');
INSERT INTO myMovies VALUES (108, 5, 'Lord Of The Flies', '90', 1, 'Balthazar Getty, Chris Furrh', '1');
INSERT INTO myMovies VALUES (109, 4, 'Drawing Flies', '76', 1, 'Jason Lee, Jason Mewes, Joey Lauren Adams, Ren&eacute;e Humphrey, Carmen Lee', '1');
INSERT INTO myMovies VALUES (110, 6, 'The Hitcher', '98', 1, 'Rutger Hauer, C. Thomas Howell, Jennifer Jason Leigh', '1');
INSERT INTO myMovies VALUES (111, 4, 'Ocean\\\'s Eleven', '117', 3, 'George Clooney, Bernie Mac, Brad Pitt, Elliot Gould, Casey Affleck, Julia Roberts, Andy Garcia, Matt Damon, Carl Reiner', '1');
INSERT INTO myMovies VALUES (112, 4, 'Zoolander', '89', 3, 'Will Ferrell, Ben Stiller, Owen Wilson, Christine Taylor', '1');
INSERT INTO myMovies VALUES (113, 1, 'Swordfish', '99', 1, 'John Travolta, Hugh Jackman, Halle Berry, Don Cheadle, Sam Shepard', '1');
INSERT INTO myMovies VALUES (114, 4, 'Scary Movie 2', '82', 1, 'Shawn Wayans, Marlon Wayans, Regina Hall, Tori Spelling, Tim Curry, David Cross, Chris Elliot, James Woods', '1');
INSERT INTO myMovies VALUES (115, 4, 'Shallow Hal', '113', 3, 'Jack Black, Gwyneth Paltrow, Jason Alexander', '1');
INSERT INTO myMovies VALUES (116, 2, 'Osmosis Jones', '95', 4, 'Bill Murray, Laurence Fishburne, Chris Rock, David Hyde Pierce, Chris Elliot', '1');
INSERT INTO myMovies VALUES (117, 1, 'The Score', '124', 1, 'Robert DeNiro, Edward Norton, Angela Bassett, Marlon Brando', '1');
INSERT INTO myMovies VALUES (118, 5, 'Training Day', '120', 1, 'Denzel Washington, Ethan Hawke, Scott Glenn, Tom Berenger, Dr. Dre, Snoop Dogg, Macy Gray', '1');
INSERT INTO myMovies VALUES (119, 5, 'Rock Star', '105', 1, 'Mark Wahlberg, Jennifer Aniston', '1');
INSERT INTO myMovies VALUES (120, 4, 'Orange County', '82', 3, 'Jack Black, Colin Hanks, Schuyler Fisk, Catherine O\\\'Hara, John Lithgow, Harold Ramis, Lily Tomlin', '1');
INSERT INTO myMovies VALUES (121, 4, 'Death To Smoochy', '109', 1, 'Robin Williams, Edward Norton, Danny DeVito', '1');
INSERT INTO myMovies VALUES (122, 4, 'Jay And Silent Bob Strike Back', '104', 1, 'Ben Affleck, Shannon Elizabeth, Will Ferrell, Jason Lee, Jason Mewes, Chris Rock', '1');
INSERT INTO myMovies VALUES (123, 9, 'The Sum Of All Fears', '123', 3, 'Ben Affleck, Morgan Freeman', '1');
INSERT INTO myMovies VALUES (124, 1, 'Spy Game', '126', 1, 'Robert Redford, Brad Pitt, Catherine McCormack', '1');
INSERT INTO myMovies VALUES (125, 5, 'Changing Lanes', '99', 1, 'Ben Affleck, Samuel L. Jackson', '1');
INSERT INTO myMovies VALUES (126, 1, 'The Fast And The Furious', '106', 3, 'Paul Walker, Vin Diesel, Michelle Rodriguez, Jordana Brewster, Ja Rule', '1');
INSERT INTO myMovies VALUES (127, 5, 'Vanilla Sky', '135', 1, 'Tom Cruise, Pen&eacute;lope Cruz, Cameron Diaz, Kurt Russell, Jason Lee, Noah Taylor', '1');
INSERT INTO myMovies VALUES (128, 5, 'Artificial Intelligence: AI', '146', 3, 'Haley Joel Osment, Jude Law, William Hurt, Sam Robards, Jake Thomas', '1');
INSERT INTO myMovies VALUES (129, 8, 'The X-Files 7: The Complete Seventh Season', '*', 4, 'David Duchovny, Gillian Anderson, Robert Patrick', '1');
INSERT INTO myMovies VALUES (130, 3, 'Center Stage', '115', 3, 'Amanda Schull, Zoe Saldana, Peter Gallagher', '1');
INSERT INTO myMovies VALUES (131, 5, 'Hoosiers', '115', 4, 'Gene Hackman, Barbara Hershey, Dennis Hopper', '1');
INSERT INTO myMovies VALUES (132, 5, 'Midnight Express', '120', 1, 'Brad Davis, Randy Quaid', '1');
INSERT INTO myMovies VALUES (133, 1, 'Mercury Rising', '108', 1, 'Bruce Willis, Alec Baldwin, Miko Hughes', '1');
INSERT INTO myMovies VALUES (134, 4, 'Mr. Mom', '91', 4, 'Michael Keaton, Teri Garr, Martin Mull', '1');
INSERT INTO myMovies VALUES (135, 4, 'Crooklyn', '115', 3, 'Alfre Woodard, Delroy Lindo, Spike Lee', '1');
INSERT INTO myMovies VALUES (136, 3, 'Coyote Ugly', '101', 3, 'Piper Perabo, Adam Garcia, John Goodman, Tyra Banks', '1');
INSERT INTO myMovies VALUES (137, 4, 'Down To Earth', '87', 3, 'Chris Rock, Eugene Levy, John Cho', '1');
INSERT INTO myMovies VALUES (138, 4, 'Ace Ventura When Nature Calls', '94', 3, 'Jim Carrey, Ian McNeice, Simon Callow, Maynard Eziashi', '1');
INSERT INTO myMovies VALUES (139, 5, 'Cast Away', '143', 3, 'Tom Hanks, Helen Hunt, Nick Searcy', '1');
INSERT INTO myMovies VALUES (140, 3, 'Save The Last Dance', '112', 4, 'Julia Stiles, Sean Patrick Thomas, Terry Kinney, Fredro Starr', '1');
INSERT INTO myMovies VALUES (141, 5, 'Thirteen Days', '147', 3, 'Kevin Costner, Bruce Greenwood, Steven Culp, Dylan Baker', '1');
INSERT INTO myMovies VALUES (142, 4, 'American Pie', '96', 1, 'Jason Biggs, Chris Klein, Shannon Elizabeth, Seann William Scott, Tara Reid', '1');
INSERT INTO myMovies VALUES (143, 4, 'O Brother, Where Art Thou?', '103', 3, 'George Clooney, John Turturro, Tim Blake Nelson, John Goodman', '1');
INSERT INTO myMovies VALUES (144, 5, '61*', '129', 5, 'Thomas Jane, Barry Pepper', '1');
INSERT INTO myMovies VALUES (145, 5, 'JFK', '206', 1, 'Kevin Costner, Kevin Bacon, Tommy Lee Jones, Gary Oldman, Sissy Spacek', '1');
INSERT INTO myMovies VALUES (146, 6, 'The Sixth Sense', '107', 3, 'Bruce Willis, Haley Joel Osment, Toni Collette, Olivia Williams', '1');
INSERT INTO myMovies VALUES (147, 9, 'Murder In The First', '122', 1, 'Christian Slater, Kevin Bacon, Gary Oldman', '1');
INSERT INTO myMovies VALUES (148, 6, 'The Watcher', '97', 1, 'James Spader, Marisa Tomei, Keanu Reeves', '1');
INSERT INTO myMovies VALUES (149, 4, 'Empire Records', '91', 3, 'Anthony LaPaglia, Renee Zellweger, Liv Tyler, Debi Mazar, Rory Cochrane', '1');
INSERT INTO myMovies VALUES (150, 3, 'What Women Want', '126', 3, 'Mel Gibson, Helen Hunt, Marisa Tomei, Lauren Holly', '1');
INSERT INTO myMovies VALUES (151, 5, 'Permanent Midnight', '88', 1, 'Ben Stiller, Elizabeth Hurley, Janeane Garofalo, Owen Wilson', '1');
INSERT INTO myMovies VALUES (152, 5, 'Fight Club', '139', 1, 'Edward Norton, Brad Pitt, Helena Bonham Carter', '1');
INSERT INTO myMovies VALUES (153, 1, 'Mission Impossible 2', '123', 3, 'Tom Cruise, Dougray Scott, Thandie Newton, Ving Rhames', '1');
INSERT INTO myMovies VALUES (154, 2, 'Heavy Metal ', '90', 1, 'Harvey Atkin, John Candy, Eugene Levy', '1');
INSERT INTO myMovies VALUES (155, 9, 'AntiTrust', '108', 3, 'Ryan Phillippe, Racheal Leigh Cook, Claire Forlani, Tim Robbins', '1');
INSERT INTO myMovies VALUES (156, 1, 'Armageddon', '151', 3, 'Bruce Willis, Billy Bob Thornton, Liv Tyler, Ben Affleck, Will Patton, Steve Buscemi', '1');
INSERT INTO myMovies VALUES (157, 5, 'Forrest Gump', '141', 3, 'Tom Hanks, Robin Wright, Gary Sinise, Mykelti Williamson, Sally Field', '1');
INSERT INTO myMovies VALUES (158, 4, 'Snatch', '104', 1, 'Brad Pitt, Benicio Del Toro, Dennis Farina, Vinnie Jones, Rade Sherbedgia, Jason Statham', '1');
INSERT INTO myMovies VALUES (159, 9, 'Unbreakable', '107', 3, 'Bruce Willis, Samuel L. Jackson, Robin Wright Penn', '1');
INSERT INTO myMovies VALUES (160, 5, 'Memento', '113', 1, 'Guy Pearce, Carrie-Anne Moss, Joe Pantoliano', '1');
INSERT INTO myMovies VALUES (161, 5, 'The Usual Suspects', '106', 1, 'Stephen Baldwin, Gabriel Byrne, Chazz Palminteri, Kevin Pollak, Pete Postlethwaite, Kevin Spacey', '1');
INSERT INTO myMovies VALUES (162, 5, 'Malcolm X', '202', 3, 'Denzel Washington, Angela Bassett, Albert Hall, Spike Lee, James McDaniel', '1');
INSERT INTO myMovies VALUES (163, 6, 'The Ring', '115', 3, 'Naomi Watts, Martin Henderson, David Dorfman, Brian Cox', '1');
INSERT INTO myMovies VALUES (164, 5, 'Drugstore Cowboy', '104', 1, 'Matt Dillon, Kelly Lynch, James Remar, James Le Gros, Heather Graham, William Burroughs', '1');
INSERT INTO myMovies VALUES (165, 5, 'Finding Forrester', '136', 3, 'Sean Connery, Rob Brown, F. Murray Abraham, Anna Paquin, Busta Rhymes', '1');
INSERT INTO myMovies VALUES (166, 4, 'Meet The Parents', '108', 3, 'Robert DeNiro, Ben Stiller, Terri Polo', '1');
INSERT INTO myMovies VALUES (167, 6, 'Hannibal', '131', 1, 'Anthony Hopkins, Julianne Moore, Ray Liotta', '1');
INSERT INTO myMovies VALUES (168, 4, 'Do The Right Thing', '120', 1, 'Danny Aiello, Ossie Davis, Ruby Dee, Spike Lee, John Turturro, Rosie Perez, Samuel L. Jackson, Martin Lawrence', '1');
INSERT INTO myMovies VALUES (169, 1, 'Crouching Tiger Hidden Dragon', '120', 3, 'Chow Yun-Fat, Michelle Yeoh, Ziyi Zhang', '1');
INSERT INTO myMovies VALUES (170, 5, 'Pink Floyd The Wall', '95', 1, 'Bob Geldof, Christine Hargreaves, James Laurenson', '1');
INSERT INTO myMovies VALUES (171, 8, 'Mr. Show: The Complete First And Second Seasons', '288', 1, 'David Cross, Bob Odenkirk', '1');
INSERT INTO myMovies VALUES (172, 4, 'Wayne\\\'s World', '94', 3, 'Mike Myers, Dana Carvey, Rob Lowe, Tia Carrere, Donna Dixon', '1');
INSERT INTO myMovies VALUES (173, 4, 'Wayne\\\'s World 2', '94', 3, 'Mike Myers, Dana Carvey, Tia Carrere, Christopher Walken, Kim Basinger', '1');
INSERT INTO myMovies VALUES (174, 5, 'One Hour Photo', '96', 1, 'Robin Williams, Connie Nielsen, Michael Vartan, Dylan Smith, Erin Daniels, Gary Cole', '1');
INSERT INTO myMovies VALUES (175, 5, 'Basic', '98', 1, 'Samuel L. Jackson, John Travolta, Connie Nielsen, Timothy Daly', '1');
INSERT INTO myMovies VALUES (176, 7, 'Star Wars: Episode I - The Phantom Menace', '133', 4, 'Liam Neeson, Ewan McGregor, Natalie Portman, Jake Lloyd, Ian McDiarmid', '1');
INSERT INTO myMovies VALUES (177, 7, 'Harry Potter And The Chamber of Secrets', '161', 4, 'Daniel Radcliffe, Emma Watson, Rupert Grint, Richard Griffiths, Fiona Shaw', '1');
INSERT INTO myMovies VALUES (178, 1, '15 Minutes', '120', 1, 'Robert DeNiro, Edward Burns, Kelsey Grammer, Avery Brooks', '1');
INSERT INTO myMovies VALUES (179, 4, 'Barbarians At The Gate', '107', 1, 'James Garner, Jonathan Pryce, Peter Riegert', '1');
INSERT INTO myMovies VALUES (180, 8, 'The Young Ones: Every Stoopid Episode', '400', 3, 'Rik Mayall, Adrian Edmondson, Nigel Planer, Christopher Ryan, Alexei Sayle', '1');
INSERT INTO myMovies VALUES (181, 4, 'Men In Black II: Back In Black', '88', 3, 'Tommy Lee Jones, Will Smith, Lara Flynn Boyle, Johnny Knoxville, Rosario Dawson, Rip Torn', '1');
INSERT INTO myMovies VALUES (182, 5, '8 Mile', '111', 1, 'Eminem, Kim Basinger, Brittany Murphy, Mekhi Phifer', '1');
INSERT INTO myMovies VALUES (183, 5, 'Midnight In The Garden Of Good And Evil', '155', 1, 'John Cusack, Kevin Spacey, Jack Thompson, Irma P. Hall, Jude Law', '1');
INSERT INTO myMovies VALUES (184, 4, 'Men In Black', '98', 3, 'Tommy Lee Jones, Will Smith, Linda Fiorentino, Vincent D\\\'Onofrio, Rip Torn', '1');
INSERT INTO myMovies VALUES (185, 5, 'The Messenger', '158', 1, 'Milla Jovovich, John Malkovich, Dustin Hoffman, Faye Dunaway', '1');
INSERT INTO myMovies VALUES (186, 4, 'Love &amp; A .45', '101', 1, 'Gil Bellows, Renee Zellweger', '1');
INSERT INTO myMovies VALUES (187, 5, 'The Man In The Iron Mask', '132', 3, 'Leonardo Dicaprio, Jeremy Irons, John Malkovich, Gerard Depardieu, Gabriel Byrne', '1');
INSERT INTO myMovies VALUES (188, 1, 'The Matrix', '136', 1, 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss, Hugo Weaving, Joe Pantoliano', '1');
INSERT INTO myMovies VALUES (189, 1, 'Heat', '172', 1, 'Al Pacino, Robert DeNiro, Val Kilmer, Jon Voight, Tom Sizemore, Ashley Judd', '1');
INSERT INTO myMovies VALUES (190, 4, 'Mallrats', '96', 1, 'Kevin Smith, Jason Mewes, Jason Lee, Jeremy London, Shannen Doherty, Claire Forlani', '1');
INSERT INTO myMovies VALUES (191, 5, 'Magnolia', '188', 1, 'Pat Healy, Genevieve Zweig, Mark Flannagan, Neil Flynn', '1');
INSERT INTO myMovies VALUES (192, 7, 'Lost In Space', '130', 3, 'William Hurt, Mimi Rogers, Lacey Chabert, Heather Graham, Matt LeBlanc', '1');
INSERT INTO myMovies VALUES (193, 5, 'Lord Of The Flies (1963 - B &amp; W)', '92', 1, 'James Aubrey, Tom Chapin, Hugh Edwards, Roger Elwin', '1');
INSERT INTO myMovies VALUES (194, 1, 'The Long Kiss Goodnight', '120', 1, 'Geena Davis, Samuel L. Jackson, Yvonne Zima', '1');
INSERT INTO myMovies VALUES (195, 5, 'Gotti', '104', 1, 'Armand Assante, William Forsythe, Anthony Quinn', '1');
INSERT INTO myMovies VALUES (196, 5, 'Goodfellas', '146', 1, 'Robert DeNiro, Ray Liotta, Joe Pesci, Lorraine Bracco, Paul Sorvino', '1');
INSERT INTO myMovies VALUES (197, 5, 'Good Will Hunting', '126', 1, 'Robin Williams, Matt Damon, Ben Affleck, Minie Driver', '1');
INSERT INTO myMovies VALUES (198, 4, 'Go', '103', 1, 'Scott Wolf, Taye Diggs, Desmond Askew', '1');
INSERT INTO myMovies VALUES (199, 1, 'Gladiator', '155', 1, 'Russell Crowe, Joaquin Phoenix, Connie Nielsen', '1');
INSERT INTO myMovies VALUES (200, 4, 'High Fidelity', '114', 1, 'John Cusack, Jack Black, Todd Louiso, Iben Hjejle, Lily Taylor, Lisa Bonet, Catherine Zeta-Jones', '1');
INSERT INTO myMovies VALUES (201, 4, 'Get Shorty', '105', 1, 'John Travolta, Gene Hackman, Rene Russo, Danny DeVito, Dennis Farina, Delroy Lindo, James Gandolfini', '1');
INSERT INTO myMovies VALUES (202, 9, 'The Game', '128', 1, 'Michael Douglas, Sean Penn', '1');
INSERT INTO myMovies VALUES (203, 7, 'Galaxy Quest', '102', 4, 'Tim Allen, Sigourney Weaver, Alan Rickman', '1');
INSERT INTO myMovies VALUES (204, 5, 'The Legend Of Bagger Vance', '126', 3, 'Will Smith, Matt Damon, Charlize Theron', '1');
INSERT INTO myMovies VALUES (205, 2, 'Lady And The Tramp', '76', 5, 'Lady, Tramp, Jock, Trusty, Peg', '1');
INSERT INTO myMovies VALUES (206, 5, 'L.A. Confidential', '138', 1, 'Kevin Spacey, Russell Crowe, Guy Pearce, Kim Basinger, Danny DeVito', '1');
INSERT INTO myMovies VALUES (207, 1, 'Lethal Weapon', '112', 1, 'Mel Gibson, Danny Glover, Gary Busey', '1');
INSERT INTO myMovies VALUES (208, 1, 'Lethal Weapon 2', '113', 1, 'Mel Gibson, Danny Glover, Joe Pesci', '1');
INSERT INTO myMovies VALUES (209, 1, 'Lethal Weapon 3', '118', 1, 'Mel Gibson, Danny Glover, Joe Pesci, Rene Russo', '1');
INSERT INTO myMovies VALUES (210, 1, 'Lethal Weapon 4', '127', 1, 'Mel Gibson, Danny Glover, Joe Pesci, Rene Russo, Chris Rock, Jet Li', '1');
INSERT INTO myMovies VALUES (211, 1, 'Gone In 60 Seconds', '117', 3, 'Nicolas Cage, Giovanni Ribisi, Angelina Jolie, Delroy Lindo, Will Patton, Robert Duvall', '1');
INSERT INTO myMovies VALUES (212, 4, 'Grosse Pointe Blank', '107', 1, 'John Cusack, Minnie Driver, Alan Arkin, Dan Aykroyd, Joan Cusack, Jeremy Piven', '1');
INSERT INTO myMovies VALUES (213, 5, 'The Green Mile', '188', 1, 'Tom Hanks, David Morse, Bonnie Hunt, Michael Clarke Duncan, James Cromwell, Sam Rockwell, Barry Pepper', '1');
INSERT INTO myMovies VALUES (214, 6, 'I Still Know What You Did Last Summer', '100', 1, 'Jennifer Love Hewitt, Freddie Prinze Jr., Brandy Norwood, Mekhi Phifer', '1');
INSERT INTO myMovies VALUES (215, 4, 'Happy Gilmore', '92', 3, 'Adam Sandler, Christopher McDonald, Carl Weathers, Bob Barker, Lee Trevino, Verne Lundquist', '1');
INSERT INTO myMovies VALUES (216, 6, 'I Know What You Did Last Summer', '100', 1, 'Jennifer Love Hewitt, Sarah Michelle Gellar, Ryan Phillippe, Freddie Prinze Jr., Anne Heche', '1');
INSERT INTO myMovies VALUES (217, 5, 'Hard Eight', '102', 1, 'Philip Baker Hall, John C. Reilly, Gwyneth Paltrow, Samuel L. Jackson, Philip Seymour Hoffman', '1');
INSERT INTO myMovies VALUES (218, 1, 'Mission Impossible', '110', 3, 'Tom Cruise, Jon Voight, Emmanuelle B&eacute;art, Ving Rhames, Kristin Scott Thomas, Vanessa Redgrave', '1');
INSERT INTO myMovies VALUES (219, 6, 'The Silence Of The Lambs', '118', 1, 'Jodie Foster, Anthony Hopkins, Scott Glenn', '1');
INSERT INTO myMovies VALUES (220, 4, 'Singles', '95', 3, 'Bridget Fonda, Campbell Scott, Kyra Sedgwick, Matt Dillon, Bill Pullman, James LeGros, Eric Stoltz, Jeremy Piven, Tom Skerritt', '1');
INSERT INTO myMovies VALUES (221, 5, 'Sleepers', '147', 1, 'Kevin Bacon, Billy Crudup, Robert DeNiro, Minnie Driver, Dustin Hoffman, Bruno Kirby, Brad Pitt', '1');
INSERT INTO myMovies VALUES (222, 6, 'Sleepy Hollow', '105', 1, 'Johnny Depp, Christina Ricci, Miranda Richardson, Christopher Walken', '1');
INSERT INTO myMovies VALUES (223, 1, 'The Negotiator', '139', 1, 'Samuel L. Jackson, Kevin Spacey, David Morse, Ron Rifkin, Regina Taylor', '1');
INSERT INTO myMovies VALUES (224, 1, 'Natural Born Killers', '118', 1, 'Woody Harrelson, Juliette Lewis, Rodney Dangerfield, Robert Downey Jr.', '1');
INSERT INTO myMovies VALUES (225, 4, 'National Lampoon\\\'s Christmas Vacation', '97', 3, 'Chevy Chase, Beverly D\\\'Angelo, Randy Quaid, Juliette Lewis, William Hickey', '1');
INSERT INTO myMovies VALUES (226, 4, 'National Lampoon\\\'s Vacation', '99', 1, 'Chevy Chase, Beverly D\\\'Angelo, Randy Quaid, Christine Brinkley', '1');
INSERT INTO myMovies VALUES (227, 1, 'Murder At 1600', '107', 1, 'Wesley Snipes, Diane Lane, Dennis Miller, Alan Alda, Tate Donovan', '1');
INSERT INTO myMovies VALUES (228, 4, 'Mystery Men', '122', 3, 'Hank Azaria, Claire Forlani, Janeane Garofalo, Eddie Izzard, Greg Kinnear, William H. Macy, Paul Rubens, Ben Stiller, Tom Waits', '1');
INSERT INTO myMovies VALUES (229, 4, 'A Night At The Roxbury', '81', 3, 'Will Ferrell, Chris Kattan, Molly Shannon, Richard Grieco', '1');
INSERT INTO myMovies VALUES (230, 9, 'The Net', '114', 3, 'Sandra Bullock, Jeremy Northam, Dennis Miller', '1');
INSERT INTO myMovies VALUES (231, 5, 'Payback', '100', 1, 'Mel Gibson, Gregg Henry, Maria Bello, David Paymer, Lucy Liu, Kris Kristofferson', '1');
INSERT INTO myMovies VALUES (232, 4, 'Patch Adams', '115', 3, 'Robin Williams, Daniel London, Monica Potter', '1');
INSERT INTO myMovies VALUES (233, 5, 'The Outsiders', '91', 4, 'Matt Dillon, Patrick Swayze, C. Thomas Howell, Tom Cruise, Ralph Macchio, Emilo Estevez, Rob Lowe', '1');
INSERT INTO myMovies VALUES (234, 5, '187', '119', 1, 'Samuel L. Jackson, Clifton Gonzalez Gonzalez', '1');
INSERT INTO myMovies VALUES (235, 4, 'Office Space', '90', 1, 'Ron Livinston, Stephen Root, Gary Cole, Jennifer Aniston', '1');
INSERT INTO myMovies VALUES (236, 4, 'The Nutty Professor II: The Klumps', '107', 3, 'Eddie Murphy, Janet Jackson, Larry Miller', '1');
INSERT INTO myMovies VALUES (237, 4, 'The Nutty Professor', '96', 3, 'Eddie Murphy, Jada Pinkett, James Coburn, Dave Chappelle', '1');
INSERT INTO myMovies VALUES (238, 3, 'Pretty Woman', '119', 1, 'Richard Gere, Julia Roberts, Ralph Bellamy, Jason Alexander, Hector Elizondo', '1');
INSERT INTO myMovies VALUES (239, 1, 'Platoon', '120', 1, 'Tom Berenger, Willem Dafoe, Charlie Sheen, Forest Whitaker, Kevin Dillon, Johnny Depp', '1');
INSERT INTO myMovies VALUES (240, 4, 'Planes, Trains and Automobiles', '92', 1, 'Steve Martin, John Candy', '1');
INSERT INTO myMovies VALUES (241, 7, 'Pitch Black', '112', 1, 'Vin Diesel, Radha Mitchell, Cole Hauser', '1');
INSERT INTO myMovies VALUES (242, 6, 'Pet Sematary', '102', 1, 'Fred Gwynne, Dale Midkiff, Denise Crosby', '1');
INSERT INTO myMovies VALUES (243, 5, 'A Perfect Murder', '108', 1, 'Michael Douglas, Gwyneth Paltrow, Viggo Mortensen', '1');
INSERT INTO myMovies VALUES (244, 5, 'Reservoir Dogs', '100', 1, 'Harvey Keitel, Tim Roth, Michael Madsen, Chris Penn, Steve Buscemi, Quentin Tarantino', '1');
INSERT INTO myMovies VALUES (245, 5, 'Revenge', '123', 1, 'Kevin Costner, Anthony Quinn, Madeleine Stowe', '1');
INSERT INTO myMovies VALUES (246, 5, 'The Right Stuff', '193', 4, 'Sam Shepard, Ed Harris, Dennis Quaid, Barbara Hershey, Fred Ward', '1');
INSERT INTO myMovies VALUES (247, 5, 'Pulp Fiction', '154', 1, 'John Travolta, Samuel L. Jackson, Uma Thurman, Harvey Keitel, Tim Roth, Amanda Plummer', '1');
INSERT INTO myMovies VALUES (248, 5, 'Pump Up The Volume', '102', 1, 'Christian Slater, Ellen Greene', '1');
INSERT INTO myMovies VALUES (249, 4, 'The Princess Bride', '98', 4, 'Cary Elwes, Robin Wright, Mandy Patinkin, Billy Crystal, Peter Falk, Fred Savage', '1');
INSERT INTO myMovies VALUES (250, 5, 'Saving Private Ryan', '169', 1, 'Tom Hanks, Edward Burns, Matt Damon, Tom Sizemore', '1');
INSERT INTO myMovies VALUES (251, 2, 'Rudolph The Red-Nosed Reindeer', '135', 5, 'Ruldolph', '1');
INSERT INTO myMovies VALUES (252, 9, 'Hollow Man', '113', 1, 'Kevin Bacon, Elisabeth Shue', '1');
INSERT INTO myMovies VALUES (253, 5, 'Rounders ', '121', 1, 'Matt Damon, Edward Norton, John Turturro, John Malkovich, Martin Landau', '1');
INSERT INTO myMovies VALUES (254, 3, 'Romeo &amp; Julliet', '120', 3, 'Leonardo DiCaprio, Claire Danes, John Leguizamo, Brian Demnehy, Paul Sorvino', '1');
INSERT INTO myMovies VALUES (255, 5, 'The Shawshank Redemption', '142', 1, 'Tim Robbins, Morgan Freeman, William Sadler, Gil Bellows, James Whitmore, Clancy Brown, Bob Gunton', '1');
INSERT INTO myMovies VALUES (256, 3, 'Shakespeare In Love', '122', 1, 'Gwyneth Paltrow, Joseph Fiennes, Geoffrey Rush, Colin Firth, Ben Affleck', '1');
INSERT INTO myMovies VALUES (257, 9, 'Seven', '127', 1, 'Brad Pitt, Morgan Freeman, Kevin Spacey, Gwyneth Paltrow', '1');
INSERT INTO myMovies VALUES (258, 6, 'Scream', '111', 1, 'David Arquette, Neve Campbell, Courteny Cox, Skeet Ulrich, Drew Barrymore', '1');
INSERT INTO myMovies VALUES (259, 6, 'Scream 2', '120', 1, 'David Arquette, Neve Campbell, Courteney Cox, Sarah Michelle Gellar, Jamie Kennedy, Jerry O\\\'Connell, Jada Pinkette', '1');
INSERT INTO myMovies VALUES (260, 6, 'Scream 3', '117', 1, 'David Arquette, Neve Campbell, Courteney Cox Arquette, Patrick Dempsey, Jenny McCarthy, Parker Posey', '1');
INSERT INTO myMovies VALUES (261, 4, 'Scary Movie', '88', 1, 'Shannon Elizabeth, Carmen Electra, Regina Hall, Sheri Oteri, Marlon Wayans', '1');
INSERT INTO myMovies VALUES (262, 1, 'Six Days Seven Nights', '102', 3, 'Harrison Ford, Anne Heche, David Schwimmer', '1');
INSERT INTO myMovies VALUES (263, 7, 'Stargate', '119', 3, 'Kurt Russell, James Spader', '1');
INSERT INTO myMovies VALUES (264, 5, 'Stand By Me', '88', 1, 'Wil Wheaton, River Phoenix, Corey Feldman, Jerry O\\\'Connell, Kiefer Sutherland', '1');
INSERT INTO myMovies VALUES (265, 3, 'Stepmom', '125', 3, 'Julia Roberts, Susan Sarandon, Ed Harris', '1');
INSERT INTO myMovies VALUES (266, 4, 'So I Married An Axe Murderer', '93', 3, 'Mike Myers, Nancy Travis, Anthony LaPaglia, Amanda Plummer', '1');
INSERT INTO myMovies VALUES (267, 5, 'Sneakers', '125', 3, 'Robert Redford, Dan Aykroyd, Ben Kingsley, Mary McDonnell, River Phoenix, Sidney Poitier, David Strathairn', '1');
INSERT INTO myMovies VALUES (268, 1, 'Snake Eyes', '98', 1, 'Nicolas Cage, Gary Sinise, John Heard, Carla Gugino', '1');
INSERT INTO myMovies VALUES (269, 5, 'Sling Blade', '135', 1, 'Billy Bob Thornton, John Ritter, Rober Duvall, Dwight Yoakam, J.T. Walsh', '1');
INSERT INTO myMovies VALUES (270, 4, 'Tommy Boy', '97', 3, 'Chris Farley, David Spade, Bo Derek, Brian Dennehy', '1');
INSERT INTO myMovies VALUES (271, 4, 'There\\\'s Something About Mary', '119', 1, 'Cameron Diaz, Ben Stiller, Matt Dillon, Chris Elliott', '1');
INSERT INTO myMovies VALUES (272, 4, 'Swingers', '96', 1, 'Jon Favreau, Vince Vaughn, Ron Livingston, Heather Graham', '1');
INSERT INTO myMovies VALUES (273, 4, 'Swimming With Sharks', '93', 1, 'Kevin Spacey, Frank Whaley, Michelle Forbs, Benicio Del Toro', '1');
INSERT INTO myMovies VALUES (274, 6, 'Stir Of Echos', '99', 1, 'Kevin Bacon, Kathryn Erbe, Illeana Douglas, Zachary David Cope', '1');
INSERT INTO myMovies VALUES (275, 9, 'Suicide Kings', '103', 1, 'Christopher Walken, Denis Leary, Sean Patrick Flanery', '1');
INSERT INTO myMovies VALUES (276, 9, 'Stigmata', '102', 1, 'Patricia Arquette, Gabriel Byrne, Jonathan Pryce, Nia Long', '1');
INSERT INTO myMovies VALUES (277, 9, '12 Monkeys', '130', 1, 'Bruce Willis, Madeleine Stowe, Brad Pitt, Christopher Plummer', '1');
INSERT INTO myMovies VALUES (278, 5, '2 Days In The Valley', '105', 1, 'Danny Aiello, Jeff Daniels, Teri Hatcher, Glenne Headly, Peter Horton, Marsha Mason, Paul Mazursky, James Spader, Eric Stoltz, Charlize Theron', '1');
INSERT INTO myMovies VALUES (279, 2, 'Toy Story', '81', 5, 'Tom Hanks, Tim Allen', '1');
INSERT INTO myMovies VALUES (280, 2, 'Toy Story 2', '92', 5, 'Tom Hanks, Tim Allen', '1');
INSERT INTO myMovies VALUES (281, 5, 'True Romance', '121', 1, 'Christian Slater, Patricia Arquette, Val Kilmer, Dennis Hopper, Gary Oldman, Brad Pitt', '1');
INSERT INTO myMovies VALUES (282, 1, 'Three Kings', '115', 1, 'George Clooney, Mark Wahlberg, Ice Cube', '1');
INSERT INTO myMovies VALUES (283, 5, 'A Time To Kill', '150', 1, 'Sandra Bullock, Samuel L. Jackson, Matthew McConaughey, Kevin Spacey', '1');
INSERT INTO myMovies VALUES (284, 5, 'Unforgiven', '127', 1, 'Clint Eastwood, Gene Hackman, Morgan Freeman, Richard Harris', '1');
INSERT INTO myMovies VALUES (285, 7, 'The X-Files: Fight The Future', '122', 3, 'David Duchovny, Gillian Anderson, Martin Landau, Blythe Danner', '1');
INSERT INTO myMovies VALUES (286, 9, 'What Lies Beneath', '130', 3, 'Harrison Ford, Michelle Pfeiffer, Diana Scarwid', '1');
INSERT INTO myMovies VALUES (287, 5, 'What Dreams May Come', '113', 3, 'Robin Williams, Cuba Gooding Jr., Annabella Sciorra, Max Von Sydow', '1');
INSERT INTO myMovies VALUES (288, 5, 'The Way Of The Gun', '119', 1, 'James Caan, Benicio Del Toro, Taye Diggs, Ryan Phillippe, Juliette Lewis', '1');
INSERT INTO myMovies VALUES (289, 5, 'Wall Street', '125', 1, 'Michael Douglas, Charlie Sheen, Daryl Hannah', '1');
INSERT INTO myMovies VALUES (290, 1, 'U.S. Marshals', '131', 3, 'Tommy Lee Jones, Wesley Snipes, Robert Downey Jr.', '1');
INSERT INTO myMovies VALUES (291, 5, 'The Untouchables', '119', 1, 'Kevin Costner, Robert DeNiro, Charles Martin Smith, Andy Garcia, Sean Connery', '1');
INSERT INTO myMovies VALUES (292, 3, 'Untamed Heart', '102', 3, 'Christian Slater, Marisa Tomei, Rosie Perez', '1');
INSERT INTO myMovies VALUES (293, 1, 'Young Guns', '102', 1, 'Emilio Estevez, Keifer Sutherland, Lou Diamond Phillips, Charlie Sheen, Dermot Mulroney, Casey Siemaszko', '1');
INSERT INTO myMovies VALUES (294, 2, 'The Year Without A Santa Claus', '125', 5, 'Mickey Rooney, Dick Shawn, George S. Irving', '1');
INSERT INTO myMovies VALUES (295, 1, 'X-Men', '104', 3, 'Hugh Jackman, Patrick Stewart, Ian McKellen, Famke Janssen, James Mardsen, Halle Berry, Anna Paquin, Rebecca Romijn-Stamos', '1');
INSERT INTO myMovies VALUES (296, 1, 'Vertical Limit', '124', 4, 'Chris O\\\'Donnell, Bill Paxton, Robin Tunney, Scott Glenn', '1');
INSERT INTO myMovies VALUES (297, 5, 'Blow', '124', 1, 'Johnny Depp, Penelope Cruz, Franka Potente, Rachel Griffiths, Paul Reubens, Ray Liotta, Jesse James', '1');
INSERT INTO myMovies VALUES (298, 9, 'Kalifornia', '117', 1, 'Brad Pitt, Juliette Lewis, David Duchovny, Michelle Forbes', '1');
INSERT INTO myMovies VALUES (299, 1, 'Judgment Night', '110', 1, 'Emilio Estevez, Cuba Gooding Jr., Denis Leary', '1');
INSERT INTO myMovies VALUES (300, 9, 'Instinct', '126', 1, 'Anthony Hopkins, Cuba Gooding Jr., Donald Sutherland, Maura Tierney', '1');
INSERT INTO myMovies VALUES (301, 1, 'Independence Day', '153', 3, 'Will Smith, Bill Pullman, Jeff Goldblum, Mary McDonnell, Judd Hirsch, Randy Quaid', '1');
INSERT INTO myMovies VALUES (302, 9, 'Misery', '108', 1, 'James Caan, Kathy Bates, Frances Sternhagen, Richard Farnsworth', '1');
INSERT INTO myMovies VALUES (303, 4, 'You\\\'ve Got Mail', '120', 4, 'Tom Hanks, Meg Ryan, Parker Posey, Jean Stapleton, Dave Chappelle, Greg Kinnear', '1');
INSERT INTO myMovies VALUES (304, 1, 'Harley Davidson And The Marlboro Man', '98', 1, 'Mickey Rourke, Don Johnson, Chelsea Field, Daniel Baldwin, Vanessa Williams, Tom Sizemore', '1');
INSERT INTO myMovies VALUES (305, 5, 'The Bodyguard', '130', 1, 'Kevin Costner, Whitney Houston, Gary Kemp, Bill Cobbs, Ralph Waite', '1');
INSERT INTO myMovies VALUES (306, 5, 'American History X', '119', 1, 'Edward Norton, Edward Furlong, Beverly D\\\'Angelo, Elliot Gould', '1');
INSERT INTO myMovies VALUES (307, 8, 'Band Of Brothers', '600', 1, 'Damian Lewis, Donnie Wahlberg, Ron Livingston', '1');
INSERT INTO myMovies VALUES (308, 8, 'My So Called Life', '1140', 4, 'Claire Danes, Bess Armstrong, Wilson Cruz', '1');
INSERT INTO myMovies VALUES (309, 1, 'The Matrix Reloaded', '138', 1, 'Laurence Fishburne, Carrie-Anne Moss, Jada Pinkett Smith, Keanu Reeves, Hugo Weaving', '1');
INSERT INTO myMovies VALUES (310, 8, 'South Park 1: The Complete First Season', '310', 2, 'Trey Parker, Matt Stone', '1');
INSERT INTO myMovies VALUES (311, 4, 'Bruce Almighty', '101', 3, 'Jim Carrey, Morgan Freeman, Jennifer Aniston, Philip Baker Hall', '1');
INSERT INTO myMovies VALUES (312, 1, 'We Were Soldiers', '138', 1, 'Mel Gibson, Madeleine Stowe, Greg Kinnear, Sam Elliot, Chris Klein, Keri Russell, Barry Pepper', '1');
INSERT INTO myMovies VALUES (313, 1, 'The Terminator 1', '108', 1, 'Arnold Schwarzenegger, Michael Biehn, Linda Hamilton, Paul Winfield, Lance Henriksen, Bill Paxton', '1');
INSERT INTO myMovies VALUES (314, 1, 'The Terminator 2: Judgment Day', '137', 1, 'Arnold Schwarzenegger, Linda Hamilton, Edward Furlong, Robert Patrick', '1');
INSERT INTO myMovies VALUES (315, 1, 'The Terminator 3: Rise of the Machines', '109', 1, 'Arnold Schwarzenegger, Nich Stahl, Claire Danes', '1');
INSERT INTO myMovies VALUES (316, 5, 'Bowling for Columbine', '120', 1, 'Michael Moore, George W. Bush, Dick Cheney, Dick Clark, Bill Clinton, Charlton Heston, Marilyn Manson, Trey Parker, Chris Rock, Matt Stone', '1');
INSERT INTO myMovies VALUES (317, 1, 'Formula 51', '92', 1, 'Samuel L. Jackson, Nigel Whitmey, Robert Jezerk, Meat Loaf', '1');
INSERT INTO myMovies VALUES (318, 5, 'Catch Me If You Can', '141', 3, 'Leonardo DiCaprio, Tom Hanks, Christopher Walken, Martin Sheen, James Brolin, Jennifer Garner', '1');
INSERT INTO myMovies VALUES (319, 1, 'Indiana Jones 1: Raiders of the Lost Ark', '115', 4, 'Harrison Ford, Karen Allen, Paul Freeman', '1');
INSERT INTO myMovies VALUES (320, 1, 'Indiana Jones 2: The Temple of Doom', '118', 4, 'Harrison Ford, Kate Capshaw, Philip Stone, Dan Aykroyd', '1');
INSERT INTO myMovies VALUES (321, 1, 'Indiana Jones: The Last Crusade', '127', 3, 'Harrison Ford, Sean Connery, Alison Doody, River Phoenix, Michael Byrne', '1');
INSERT INTO myMovies VALUES (322, 1, '007: Tomorrow Never Dies', '119', 3, 'Pierce Brosnan, Jonathan Pryce, Teri Hatcher', '1');
INSERT INTO myMovies VALUES (323, 1, '007: The Spy Who Loved Me', '125', 4, 'Roger Moore, Barbara Bach, Caroline Munro', '1');
INSERT INTO myMovies VALUES (324, 1, '007: The Man With The Golden Gun', '125', 4, 'Roger Moore, Christopher Lee, Maud Adams', '1');
INSERT INTO myMovies VALUES (325, 1, '007: Licence To Kill', '133', 3, 'Timothy Dalton, Carey Lowell, Talisa Soto', '1');
INSERT INTO myMovies VALUES (326, 1, '007: Goldfinger', '112', 4, 'Sean Connery, Honor Blackman, Shirley Eaton, Tania Mallet', '1');
INSERT INTO myMovies VALUES (327, 1, '007: GoldenEye', '130', 3, 'Pierce Brosnan, Sean Bean, Izabella Scorupco', '1');
INSERT INTO myMovies VALUES (328, 1, '007: Dr. No', '110', 4, 'Sean Connery, Ursula Andress, Jack Lord, Bernard Lee', '1');
INSERT INTO myMovies VALUES (329, 5, 'Scarface', '170', 1, 'Al Pacino, Michelle Pfeiffer, Mary Elizabeth Mastrantonio, Robert Loggia', '1');
INSERT INTO myMovies VALUES (330, 2, 'Finding Nemo', '100', 5, 'Albert Brooks, Ellen DeGeneres, Alexander Gould, Willem Dafoe', '1');
INSERT INTO myMovies VALUES (331, 1, 'The Lord Of The Rings: The Fellowship Of The Ring', '208', 3, 'Noel Appleby, Sean Astin, Cate Blanchett', '1');
INSERT INTO myMovies VALUES (332, 4, 'American Wedding (Unrated)', '96', 1, 'Jason Biggs, Seann William Scott, Alyson Hannigan', '1');
INSERT INTO myMovies VALUES (333, 1, 'Bad Boys II', '147', 1, 'Martin Lawrence, Will Smith, Theresa Randle, Joe Pantoliano', '1');
INSERT INTO myMovies VALUES (334, 8, 'The Sopranos 4: The Complete Fourth Season (4 discs)', '800', 1, 'James Gandolfini, Lorraine Bracco, Edie Falco, Michael Imperioli, Dominic Chianese, Vincent Pastore', '1');
INSERT INTO myMovies VALUES (335, 1, 'The Matrix Revolutions', '', 1, 'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss, Harry J. Lennix, Jada Pinkett Smith, Mary Alice, Bruce Spence, Helmut Bakaitias, Huga Weaving', '1');
INSERT INTO myMovies VALUES (336, 1, 'The Skulls III', '103', 3, 'Clare Kramer, Bryche Johnson, Barry Bostwick, Steve Braun, Karl Pruner, Dean McDermott', '1');
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

INSERT INTO myProjects VALUES (1, 1, 'ZeaVision', 'www.zeavision.com', 'ZeaVision LLC is a company that patented a dietary supplement, called zeaxanthin, that helps maintain vision health and brings hope to those with macular degeneration.<br /><br />\r\nZeaVision\\\'s primary audience would consist of consumers over fifty with progressive vision loss. A multi-channel strategy and automated systems support for marketing, sales, order fulfillment, accounting, and financial forecasting was developed from a single back-end system that provides the optimal interaction experiences regardless of the channel.', 'My role was programming the designs for the web site while complying with ADA / 508 / WAI guidelines. Another feature added is the ability to increase or decrease the text size on the site to make it easier to read while still maintaining a visual appeal. I also created several Flash pieces for the site that act as information guides and attention grabbers. Other features include: Tell a Friend, Shopping Cart, Flash detection, dynamic content, administration screens, and more.<br /><br />\r\nI also helped implement voice recognition software that allowed ZeaVision to use any telephone to get the latest information about sales, stock, and more. A web-based commerce, call center, order fulfillment, and real-time customer support system, as well as the ability to provide mobile operational metrics and control through wireless PDA and self-service sales support through interactive kiosks was part of my task and our overall goal, which was a success.', 'zeavision_1.jpg', 'zeavision_2.jpg', 'zeavision_3.jpg', 1);
INSERT INTO myProjects VALUES (2, 2, 'Wear-Dated', 'www.weardated.com', 'A <a href="http://www.solutia.com/" target="_blank">Solutia, Inc.</a> company, Wear-Dated Carpet Fiber and Wear-Dated Upholstery required a complete solution from the ground up, built from scratch. The project consists so far of 2 major phases.<br /><br />\r\nThe first major itteration included a complete re-design and programming of their entire public web site which included some administration screens as well.<br /><br />\r\nThe second major itteration includes another re-design and programming of their entire public web site with enhancements to include a room designer / planner, which will also interact with in-store kiosks that we are developing as well.', 'My role was to program the designs into a fully functioning site while meeting Solutia, Inc. IT teams strict standards and compliance initiatives. Key features include Flash detection and animations, Find a Retailer search, Find Carpet search, survey\'s, registration and contact forms, and much more.', 'weardated_1.jpg', 'weardated_2.jpg', 'weardated_3.jpg', 1);
INSERT INTO myProjects VALUES (6, 3, 'TruSecure', 'www.trusecure.com', 'TruSecure is a leading provider of intelligent risk management products and services. TruSecure claims to dramatically improve security and reduce risk by helping organizations make better security decisions and maximize the effectiveness of their existing security people, processes, and products.', 'My role was to program the entire front-end of the website, meeting cross-browser, cross-platform, and usability standards. The site is also very heavily integrated with a content management system that was previously used, but needed to be completely re-done to accomidate the new features on the site. Coding, making graphics, scripting, and de-bugging were the major roles I played in this project.<br /><br />\r\nThe project itself was a daunting task as time, tools, and learning curves all play significant roles in the project life cycle and timeline. With all the obsticles in our path, essentially a 2 man team was able to met the project deadline and deliver the best possible solution with the project requirements and constraints.', 'trusecure_1.jpg', 'trusecure_2.jpg', 'trusecure_3.jpg', 1);
INSERT INTO myProjects VALUES (7, 6, 'bitPimps Custom Modifications', 'bitpimps.lixlink.com', 'A community leading hobby web site, bitPimps Custom Modifications draws in large numbers of traffic and members by offering fresh information, articles, tutorials, entertainment, and contests related to the micro r/c hobby world.<br /><br />\r\nThe web site also allows visitors to join as members in a discussion forum for members who are seeking more specific information, want learn more, show off, and more.', 'From concept, through construction, then on to maintenance and administration &#8212; I am responsible for it all. In the beginning, I had some concept brain-storming sessions with a few close friends, that gave me the base of the concept. From there on out, I was the only person to design, develop, and maintain the web site.<br /><br />\r\nNow with over well over 400 members and steadily growing, I now over-see a team of forum moderators who help me keep the forums clean and members following the rules.<br /><br />\r\nI have implemented administration screens to help me out when updating content and image galleries on the site. Each page is dynamically created on the server from information entered into the content management system in the administration area.', 'bitpimps_1.jpg', 'bitpimps_2.jpg', 'bitpimps_3.jpg', 1);
INSERT INTO myProjects VALUES (8, 4, 'e-Wireless (#333)', 'none', 'e-Wireless (#333) was a company using cell phone technology to offer consumers connection services, advertisements, information gathering, etc. Sponsors and advertisers could manage advertisements, when they were played, how often, review the ads exposure, results from the ads, and more. Managers could administer sponsors, review calls places, sponsors and advertisers account information and activity, and more.', 'In one of many roles, I helped with the web site architecture, some design and back-end programming. Most of my work was done on the front-end programming aspect where I translated all the designs into workable HTML pages that interfaced with back-end server technologies and applications.', '333_1.jpg', '333_2.jpg', '333_3.jpg', 1);
INSERT INTO myProjects VALUES (10, 5, 'AXS Technologies', 'www.axs-tech.com', 'AXS Technologies is a world leader in developing software technologies that help speed the delivery of data, such as hi-res imaging, data mining, signal correlation, storage, and more.', 'My role was to program the designs in to functioning web pages, and integrating the companies &quot;EyeSpy&quot; technology in to the web site itself. Some features include EyeSpy image demo\'s, Tell a Friend and Contact forms, dynamically generated pages, Press Releases maintained by administration screens, and more.', 'axstech_1.jpg', 'axstech_2.jpg', 'axstech_3.jpg', 1);
INSERT INTO myProjects VALUES (11, 7, 'IconProcess', 'www.iconprocess.com', 'IconProcess is a site based around e-development processes for web and software developers. The site itself, the name, branding, architecture, design, programming, etc. was all built from nothing but an idea. Visitors can request whitepaper downloads, review IconProcess training materials, subscribe to newsletters, and more.', 'My role was to program the entire site including most of the back-end functionality. Features like subscribing, news and press releases, tell a friend, download requests, contact forms, etc. are all maintained via an administration portal provided through an interface identical to that of the public site.', 'iconprocess_1.jpg', 'iconprocess_2.jpg', 'iconprocess_3.jpg', 1);
INSERT INTO myProjects VALUES (12, 9, 'IconTraining', 'training.iconmedialab.com', 'IconTraining advertises and offers custom training solutions to businesses and individuals. The site announces the latest in training methods, key speakers, locations, and more. All of this information is stored in a database and the web site itself is dynamically data-driven and maintained through administration screens. Visitors can subscribe to newsletters, request more information on training, schedule and purchase training courses all via the web site.', 'My main role was to program the entire front-end of the web site as well as part of the back-end. I\'ve also maintained and updated the site regularly as well as adding on new features that tie in to more data-driven content.', 'icontraining_1.jpg', 'icontraining_2.jpg', 'icontraining_3.jpg', 1);
INSERT INTO myProjects VALUES (13, 13, 'IAHP', 'www.iahp.com', 'IAHP, short for International Alliance of Healthcare Practitioners, offers information to visitors and a chance for healthcare professionals to join the IAHP alliance, get listed in the directory, and buy a templated micro-site. IAHP offers both patients and practitioners a chance to enhance their knowledge and network with others. All of this is managed through administration screens that handle transactions and automatically setup micro-sites, and more.', 'My main role was to program the entire front end of the web site, as well as support the project by coming up with new ideas to achieve certain goals such as attracting potential customers and providing current customers the ability to create and manage their own micro-site through an administration interface provided to members of the web site.', 'iahp_1.jpg', 'iahp_2.jpg', 'iahp_3.jpg', 1);
INSERT INTO myProjects VALUES (14, 14, 'IAHE', 'www.iahe.com', 'IAHE (International Alliance of Healthcare Educators is a site dedicated to the presentation of high-quality educational programs for interested healthcare professionals from all disciplines.', 'My roles were to help program some of the front-end elements in to the site as well as help maintain and update the site per the client\'s requests. Frequent database updates and additions as well as code changes to functionality.', 'iahe_1.jpg', 'iahe_2.jpg', 'iahe_3.jpg', 1);
INSERT INTO myProjects VALUES (15, 8, 'IconProject Site', 'none', 'This is an internal tool used by IconMedialab project managers, team members, and clients. The purpose of the tool is to help keep track of resources, schedules, tasks, files, communications, and more.<br /><br />\r\nThe site recognizes members and returns information based on their role, status, and project involvment.', 'I programmed the entire front-end of the web site, helped with middle-ware and back-end development. Conception, layout, and partial design were also a portion of my tasks. I also help maintain and package the site for re-installation, and more.', 'iconprojectsite_1.jpg', 'iconprojectsite_2.jpg', 'iconprojectsite_3.jpg', 1);
INSERT INTO myProjects VALUES (16, 11, 'IconConsultants Db', 'none', 'This application allows users with the proper permissions to administer all consultants for the St. Louis and DC offices. Administrators can check availability, schedules, billing rates, as well as get an over all report on bench time, and more.', 'My role was to help conceptualize, layout, design, and program the entire front-end and middle-ware pieces of the web site. Maintenance and enhancements are an on-going task.', 'iconconsultantdb_1.jpg', 'iconconsultantdb_2.jpg', 'iconconsultantdb_3.jpg', 1);
INSERT INTO myProjects VALUES (17, 15, 'Scott D. Lix (v.1.0)', 'none', 'This was my first version of my personal web site that contained a blog, portfolio, media archives, and a toolbox. I designed and programmed the entire site from front to back and added features like the ability to increase or decrease text sizes, tell a friend, perform searches, and more.', 'The site itself was completely data-driven and utilized a templating system, making updates quick and easy through administration screens I also provided to help maintain all aspects of content through-out the site.', 'lixlink_1.jpg', 'lixlink_2.jpg', 'lixlink_3.jpg', 1);
INSERT INTO myProjects VALUES (18, 12, 'IconCampaign Tracker', 'none', 'The IconCampaign Tracker allows sales staff from all the IconMedialab offices to keep track of the campaigns they send out. The tracker keeps records of what campaigns were sent out, when they were sent out, which link was clicked on, and who clicked on what link.', 'My role was to complete the marketing tool in 1 day, have it functionable and usable — which I did. I was the main developer from inception to implementation, I designed and programmed the entire tool.', 'iconcampaigntracker_1.jpg', 'iconcampaigntracker_2.jpg', 'iconcampaigntracker_3.jpg', 1);
INSERT INTO myProjects VALUES (19, 10, 'Collegiate VIP', 'www.collegiatevip.com', 'I was contacted by an old partner, that now owns and runs <a href="http://www.integritycorporation.com/" target="_blank">Integrity Corporation</a>, to program and script the designs produced in 3 days or less. The overall initial goals were to communicate, elicit contact, and empower Collegiate VIP to successfully follow-up on consumers.<br /><br />\r\nFrom cutting up images &#8212; programming the interface &#8212; and providing the back-end functionality, the project challenged my skills and effectiveness in producing a fully functional system in what turned out to be just under 1 day.', 'I was hired to produce the website and bring it to life &#8212; from an image file to an actual functioning website and mini-system.<br /><br />\r\nI received several image documents to provide me with the intitial layouts and needed graphics. From there - I cut up the graphics to suit the needs, produced the front-end code or scripting to provide the interface and some client-side functionality.<br /><br />\r\nI then implemented back-end coding and functionality to provide the use of forms, recording information, automated email responsed based on user details, and more.<br /><br />\r\nInitially, I already knew I had a tight deadline, and although the designs didn\'t lend themselves to Internet production. I managed to utilize my professional techniques to mimic the designs and still produce a fully functioning, scalable, and user-friendly website / system.<br /><br />\r\nAll that and a bit more &#8212; including revisions &#8212; in just 28 hours! I was even proud of myself!', 'collegiatevip_1.jpg', 'collegiatevip_2.jpg', 'collegiatevip_3.jpg', 1);
INSERT INTO myProjects VALUES (20, 16, 'Double D Enterprises', 'www.doubledenterprise.com', 'As a jewelry maker and seller, Double D Enterprises wanted to start to make an online presence that would allow them to showcase and offer for sale some of the fine jewelry pieces they have to offer.', 'I designed, programmed, architectured, support, etc. the entire project by myself.', 'doubled_1.jpg', 'doubled_2.jpg', 'doubled_3.jpg', 1);

