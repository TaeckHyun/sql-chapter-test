CREATE TABLE Users (
    user_id bigint primary key auto_increment,
    username varchar(255) not null unique,
    email varchar(255) not null unique,
    password varchar(255) not null,
    created_at datetime default CURRENT_TIMESTAMP
);

CREATE TABLE Boards (
    board_id bigint primary key auto_increment,
    name varchar(255) not null,
    description text
);

CREATE TABLE Posts (
    post_id bigint primary key auto_increment,
    title varchar(255) not null,
    content text not null,
    user_id bigint,
    board_id bigint,
    created_at datetime default CURRENT_TIMESTAMP,
    foreign key (user_id) references Users(user_id),
    foreign key (board_id) references Boards(board_id)
);

CREATE TABLE Comments (
    comment_id bigint primary key auto_increment,
    content text not null,
    user_id bigint,
    post_id bigint,
    created_at datetime default CURRENT_TIMESTAMP,
    foreign key (user_id) references Users(user_id),
    foreign key (post_id) references Posts(post_id)
);

CREATE TABLE Tags (
    tag_id bigint primary key auto_increment,
    name varchar(255) not null unique
);

CREATE TABLE Post_Tags (
    post_id bigint,
    tag_id bigint,
    foreign key (post_id) references Posts(post_id),
    foreign key (tag_id) references Tags(tag_id)
);
