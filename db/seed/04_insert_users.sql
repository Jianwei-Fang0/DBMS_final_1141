-- 04_insert_users.sql
-- 自動產生大量 demo 使用者（email 唯一 user1@ntu.edu.tw ...）

INSERT INTO "user" (email, password_hash, name, phone, affiliation, org_id, status)
VALUES
    ('user1@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Tom Su', '0910216856', 'Internal', 113, 'Active'),
    ('user2@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Bob Lee', '0910545322', 'Internal', 9, 'Active'),
    ('user3@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Jack Chen', '0981350949', 'Internal', 134, 'Active'),
    ('user4@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '王采潔', '0910734364', 'Internal', 25, 'Active'),
    ('user5@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Sara Chang', '0910310298', 'Internal', 32, 'Active'),
    ('user6@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ellen Wu', '0900418678', 'Internal', 173, 'Active'),
    ('user7@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '呂柏妤', '0930643866', 'Internal', 177, 'Active'),
    ('user8@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '朱冠儒', '0901466150', 'Internal', 69, 'Active'),
    ('user9@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '徐佩玲', '0920719180', 'Internal', 50, 'Active'),
    ('user10@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Frank Wang', '0901816185', 'Internal', 177, 'Active'),
    ('user11@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Alice Hsueh', '0910668353', 'Internal', 183, 'Active'),
    ('user12@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Alice Chen', '0910231272', 'Internal', 120, 'Active'),
    ('user13@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '高怡君', '0930422526', 'Internal', 111, 'Active'),
    ('user14@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Grace Tsai', '0901774825', 'Internal', 5, 'Active'),
    ('user15@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Tom Lin', '0920811908', 'Internal', 103, 'Active'),
    ('user16@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Bob Wang', '0920946710', 'Internal', 199, 'Active'),
    ('user17@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '賴佩玲', '0981301185', 'Internal', 3, 'Active'),
    ('user18@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '謝雅婷', '0900843540', 'Internal', 93, 'Active'),
    ('user19@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '鄭宗翰', '0981127857', 'Internal', 126, 'Active'),
    ('user20@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '高鈺婷', '0910407874', 'Internal', 52, 'Active'),
    ('user21@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '徐雅雯', '0930409750', 'Internal', 170, 'Active'),
    ('user22@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Mike Tsai', '0920250894', 'Internal', 168, 'Active'),
    ('user23@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '許鈺婷', '0930742921', 'Internal', 56, 'Active'),
    ('user24@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Grace Wang', '0901310213', 'Internal', 7, 'Active'),
    ('user25@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Frank Wu', '0920183000', 'Internal', 80, 'Active'),
    ('user26@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '陳佩玲', '0920984070', 'Internal', 48, 'Active'),
    ('user27@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '胡鈺婷', '0981578712', 'Internal', 43, 'Active'),
    ('user28@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '李郁婷', '0900628251', 'Internal', 179, 'Active'),
    ('user29@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '周冠儒', '0930965286', 'Internal', 165, 'Active'),
    ('user30@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '何雅雯', '0901736782', 'Internal', 47, 'Active'),
    ('user31@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '唐家豪', '0981102650', 'Internal', 162, 'Active'),
    ('user32@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '周志強', '0910558750', 'Internal', 47, 'Active'),
    ('user33@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '唐俊傑', '0901141994', 'Internal', 148, 'Active'),
    ('user34@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '張俊傑', '0901845862', 'Internal', 134, 'Active'),
    ('user35@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '張俊傑', '0930215007', 'Internal', 177, 'Active'),
    ('user36@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Mike Lin', '0981388419', 'Internal', 74, 'Active'),
    ('user37@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '周志強', '0930199647', 'Internal', 59, 'Active'),
    ('user38@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '周俊傑', '0930699228', 'Internal', 173, 'Active'),
    ('user39@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '朱鈺婷', '0920647644', 'Internal', 159, 'Active'),
    ('user40@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '陳采潔', '0981512701', 'Internal', 105, 'Active'),
    ('user41@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Queen Tsai', '0900834007', 'Internal', 169, 'Active'),
    ('user42@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Alice Lin', '0900691925', 'Internal', 131, 'Active'),
    ('user43@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '謝俊傑', '0901757892', 'Internal', 126, 'Active'),
    ('user44@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Grace Su', '0910622916', 'Internal', 131, 'Active'),
    ('user45@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '蔡柏妤', '0900119608', 'Internal', 144, 'Active'),
    ('user46@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '蔡冠宇', '0900509798', 'Internal', 43, 'Active'),
    ('user47@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'David Lee', '0981220282', 'Internal', 3, 'Active'),
    ('user48@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Bob Hsueh', '0901958699', 'Internal', 67, 'Active'),
    ('user49@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Grace Wang', '0910633679', 'Internal', 6, 'Active'),
    ('user50@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '黃采潔', '0981339278', 'Internal', 104, 'Active'),
    ('user51@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Tom Chen', '0900517849', 'Internal', 89, 'Active'),
    ('user52@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Jack Lee', '0930603799', 'Internal', 71, 'Active'),
    ('user53@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Sara Huang', '0900440979', 'Internal', 16, 'Active'),
    ('user54@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '林柏妤', '0900108460', 'Internal', 120, 'Active'),
    ('user55@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '謝雅婷', '0981528262', 'Internal', 168, 'Active'),
    ('user56@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '周冠儒', '0900155343', 'Internal', 13, 'Active'),
    ('user57@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Sara Tsai', '0900761853', 'Internal', 66, 'Active'),
    ('user58@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Kevin Hsueh', '0981524793', 'Internal', 66, 'Active'),
    ('user59@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ellen Tsai', '0930247078', 'Internal', 120, 'Active'),
    ('user60@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Penny Wang', '0981524238', 'Internal', 42, 'Active'),
    ('user61@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ryan Lee', '0901377470', 'Internal', 168, 'Active'),
    ('user62@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '孫怡君', '0981661246', 'Internal', 85, 'Active'),
    ('user63@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Nina Huang', '0900881573', 'Internal', 17, 'Active'),
    ('user64@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '蔡雅婷', '0900314799', 'Internal', 18, 'Active'),
    ('user65@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ivy Tsai', '0920128701', 'Internal', 82, 'Active'),
    ('user66@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '謝俊傑', '0981967066', 'Internal', 111, 'Active'),
    ('user67@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ryan Wu', '0981397086', 'Internal', 179, 'Active'),
    ('user68@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Queen Su', '0910183232', 'Internal', 171, 'Active'),
    ('user69@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Grace Huang', '0930340053', 'Internal', 186, 'Active'),
    ('user70@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Penny Chen', '0901926390', 'Internal', 101, 'Active'),
    ('user71@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Nina Hsueh', '0920330328', 'Internal', 91, 'Active'),
    ('user72@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Mike Chen', '0930148617', 'Internal', 107, 'Active'),
    ('user73@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '張佳穎', '0930818329', 'Internal', 82, 'Active'),
    ('user74@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '謝冠廷', '0901961506', 'Internal', 13, 'Active'),
    ('user75@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Queen Wang', '0910474276', 'Internal', 195, 'Active'),
    ('user76@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Nina Wang', '0920304522', 'Internal', 161, 'Active'),
    ('user77@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '李雅雯', '0900473011', 'Internal', 52, 'Active'),
    ('user78@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '鄭郁婷', '0920450936', 'Internal', 80, 'Active'),
    ('user79@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '謝冠儒', '0920849799', 'Internal', 123, 'Active'),
    ('user80@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '蔡柏妤', '0910790738', 'Internal', 69, 'Active'),
    ('user81@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '許雅雯', '0901349740', 'Internal', 173, 'Active'),
    ('user82@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '趙俊傑', '0910671645', 'Internal', 49, 'Active'),
    ('user83@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Cindy Lin', '0900492481', 'Internal', 39, 'Active'),
    ('user84@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Alice Su', '0920584149', 'Internal', 1, 'Active'),
    ('user85@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '呂怡君', '0920340581', 'Internal', 43, 'Active'),
    ('user86@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Henry Chen', '0920215670', 'Internal', 97, 'Active'),
    ('user87@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '吳宗翰', '0910197987', 'Internal', 161, 'Active'),
    ('user88@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '李佩玲', '0920473699', 'Internal', 157, 'Active'),
    ('user89@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Jack Hsueh', '0920759335', 'Internal', 182, 'Active'),
    ('user90@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Mike Tsai', '0930858979', 'Internal', 96, 'Active'),
    ('user91@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Frank Chang', '0910971832', 'Internal', 76, 'Active'),
    ('user92@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Grace Lee', '0930569893', 'Internal', 160, 'Active'),
    ('user93@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '林佳穎', '0901714918', 'Internal', 170, 'Active'),
    ('user94@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Tom Su', '0920786241', 'Internal', 85, 'Active'),
    ('user95@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Mike Su', '0981384995', 'Internal', 131, 'Active'),
    ('user96@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Grace Chang', '0910234520', 'Internal', 80, 'Active'),
    ('user97@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ellen Huang', '0981404175', 'Internal', 20, 'Active'),
    ('user98@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'David Chen', '0901954703', 'Internal', 20, 'Active'),
    ('user99@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Nina Wu', '0981269994', 'Internal', 108, 'Active'),
    ('user100@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Oscar Wu', '0981456517', 'Internal', 43, 'Active'),
    ('user101@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '呂柏妤', '0981863004', 'Internal', 171, 'Active'),
    ('user102@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ryan Chen', '0901332669', 'Internal', 7, 'Active'),
    ('user103@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ivy Huang', '0901972125', 'Internal', 112, 'Active'),
    ('user104@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Bob Chang', '0981530163', 'Internal', 187, 'Active'),
    ('user105@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '蔡冠瑋', '0901527009', 'Internal', 167, 'Active'),
    ('user106@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Bob Chang', '0910926947', 'Internal', 40, 'Active'),
    ('user107@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ivy Lee', '0930537119', 'Internal', 6, 'Active'),
    ('user108@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '呂佳穎', '0901392117', 'Internal', 123, 'Active'),
    ('user109@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '王彥廷', '0910579545', 'Internal', 90, 'Active'),
    ('user110@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Nina Su', '0910442813', 'Internal', 173, 'Active'),
    ('user111@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Sara Tsai', '0910376078', 'Internal', 178, 'Active'),
    ('user112@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '陳冠廷', '0930679123', 'Internal', 82, 'Active'),
    ('user113@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '吳家豪', '0900772982', 'Internal', 135, 'Active'),
    ('user114@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '呂采潔', '0910796044', 'Internal', 53, 'Active'),
    ('user115@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '蔡雅雯', '0901455885', 'Internal', 2, 'Active'),
    ('user116@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Frank Chen', '0981166704', 'Internal', 31, 'Active'),
    ('user117@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '賴郁婷', '0901756859', 'Internal', 183, 'Active'),
    ('user118@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Linda Chen', '0981782838', 'Internal', 131, 'Active'),
    ('user119@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '徐宗翰', '0920703442', 'Internal', 23, 'Active'),
    ('user120@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Kevin Lee', '0901385588', 'Internal', 130, 'Active'),
    ('user121@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '何宗翰', '0901809858', 'Internal', 117, 'Active'),
    ('user122@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Frank Lin', '0920949420', 'Internal', 85, 'Active'),
    ('user123@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'David Hsueh', '0920827489', 'Internal', 115, 'Active'),
    ('user124@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Henry Huang', '0901508706', 'Internal', 115, 'Active'),
    ('user125@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ivy Hsueh', '0981614689', 'Internal', 124, 'Active'),
    ('user126@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'David Hsueh', '0981416825', 'Internal', 199, 'Active'),
    ('user127@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '王郁婷', '0901682105', 'Internal', 27, 'Active'),
    ('user128@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Alice Wang', '0930728922', 'Internal', 1, 'Active'),
    ('user129@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ivy Wang', '0900348363', 'Internal', 148, 'Active'),
    ('user130@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '李冠瑋', '0900914122', 'Internal', 136, 'Active'),
    ('user131@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '王志強', '0981954415', 'Internal', 148, 'Active'),
    ('user132@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '謝冠瑋', '0930460153', 'Internal', 131, 'Active'),
    ('user133@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Bob Lin', '0900225118', 'Internal', 157, 'Active'),
    ('user134@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Alice Chen', '0900400331', 'Internal', 83, 'Active'),
    ('user135@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '吳柏妤', '0920126931', 'Internal', 163, 'Active'),
    ('user136@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Henry Huang', '0930258619', 'Internal', 37, 'Active'),
    ('user137@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Frank Chen', '0981228150', 'Internal', 58, 'Active'),
    ('user138@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '吳雅雯', '0901114605', 'Internal', 181, 'Active'),
    ('user139@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '許采潔', '0981828400', 'Internal', 145, 'Active'),
    ('user140@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Jack Wang', '0900857154', 'Internal', 33, 'Active'),
    ('user141@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Alice Chen', '0920139914', 'Internal', 30, 'Active'),
    ('user142@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Jack Chang', '0930244183', 'Internal', 12, 'Active'),
    ('user143@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '唐鈺婷', '0901691765', 'Internal', 104, 'Active'),
    ('user144@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'David Chen', '0920608942', 'Internal', 137, 'Active'),
    ('user145@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Nina Chang', '0900507467', 'Internal', 82, 'Active'),
    ('user146@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Alice Su', '0981938465', 'Internal', 17, 'Active'),
    ('user147@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '林怡君', '0910657337', 'Internal', 99, 'Active'),
    ('user148@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Queen Wang', '0981420346', 'Internal', 44, 'Active'),
    ('user149@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Oscar Tsai', '0920694482', 'Internal', 22, 'Active'),
    ('user150@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '陳怡君', '0920546880', 'Internal', 27, 'Active'),
    ('user151@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '吳鈺婷', '0930857351', 'Internal', 152, 'Active'),
    ('user152@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '唐柏妤', '0930250685', 'Internal', 70, 'Active'),
    ('user153@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Kevin Tsai', '0900734185', 'Internal', 134, 'Active'),
    ('user154@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '趙冠廷', '0930943991', 'Internal', 189, 'Active'),
    ('user155@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Nina Wang', '0900644031', 'Internal', 1, 'Active'),
    ('user156@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '何佩玲', '0920475117', 'Internal', 137, 'Active'),
    ('user157@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ivy Wu', '0910228896', 'Internal', 60, 'Active'),
    ('user158@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Grace Lee', '0901942580', 'Internal', 163, 'Active'),
    ('user159@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '孫佩玲', '0910379669', 'Internal', 104, 'Active'),
    ('user160@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '王俊傑', '0930576776', 'Internal', 194, 'Active'),
    ('user161@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Oscar Wu', '0981760891', 'Internal', 162, 'Active'),
    ('user162@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'David Wu', '0900521035', 'Internal', 137, 'Active'),
    ('user163@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ryan Su', '0910823367', 'Internal', 115, 'Active'),
    ('user164@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '王采潔', '0981417449', 'Internal', 188, 'Active'),
    ('user165@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Tom Huang', '0981878728', 'Internal', 164, 'Active'),
    ('user166@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ivy Hsueh', '0901259395', 'Internal', 166, 'Active'),
    ('user167@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '陳冠廷', '0930556621', 'Internal', 16, 'Active'),
    ('user168@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'David Lee', '0900959780', 'Internal', 10, 'Active'),
    ('user169@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '趙俊傑', '0930922732', 'Internal', 144, 'Active'),
    ('user170@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ryan Chen', '0981742372', 'Internal', 137, 'Active'),
    ('user171@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Sara Lin', '0930102324', 'Internal', 65, 'Active'),
    ('user172@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '林冠儒', '0901295018', 'Internal', 136, 'Active'),
    ('user173@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Kevin Chang', '0910604903', 'Internal', 11, 'Active'),
    ('user174@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '何采潔', '0930932811', 'Internal', 155, 'Active'),
    ('user175@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '賴佳穎', '0910470004', 'Internal', 48, 'Active'),
    ('user176@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '吳佳穎', '0930134550', 'Internal', 79, 'Active'),
    ('user177@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '孫冠廷', '0910804216', 'Internal', 61, 'Active'),
    ('user178@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Penny Huang', '0920635951', 'Internal', 170, 'Active'),
    ('user179@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '李采潔', '0910600474', 'Internal', 190, 'Active'),
    ('user180@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '賴宗翰', '0901738490', 'Internal', 105, 'Active'),
    ('user181@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Penny Su', '0920395461', 'Internal', 114, 'Active'),
    ('user182@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '謝柏妤', '0930124060', 'Internal', 57, 'Active'),
    ('user183@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Cindy Wang', '0910397517', 'Internal', 95, 'Active'),
    ('user184@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ryan Chen', '0910395943', 'Internal', 4, 'Active'),
    ('user185@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '李俊傑', '0920134259', 'Internal', 145, 'Active'),
    ('user186@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '鄭家豪', '0930358055', 'Internal', 111, 'Active'),
    ('user187@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '周志強', '0981650494', 'Internal', 121, 'Active'),
    ('user188@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Jack Su', '0910649722', 'Internal', 181, 'Active'),
    ('user189@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '陳冠廷', '0901148364', 'Internal', 140, 'Active'),
    ('user190@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Penny Lee', '0930916780', 'Internal', 126, 'Active'),
    ('user191@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '許怡君', '0920255826', 'Internal', 95, 'Active'),
    ('user192@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '謝彥廷', '0910955716', 'Internal', 184, 'Active'),
    ('user193@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '吳佩玲', '0981660790', 'Internal', 11, 'Active'),
    ('user194@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Nina Chen', '0900215132', 'Internal', 81, 'Active'),
    ('user195@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Ivy Chang', '0910968963', 'Internal', 71, 'Active'),
    ('user196@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Frank Su', '0981870521', 'Internal', 189, 'Active'),
    ('user197@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '謝彥廷', '0900962499', 'Internal', 61, 'Active'),
    ('user198@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Henry Lee', '0920212189', 'Internal', 26, 'Active'),
    ('user199@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', '陳鈺婷', '0920780814', 'Internal', 98, 'Active'),
    ('user200@ntu.edu.tw', '$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu', 'Henry Hsueh', '0920791652', 'Internal', 145, 'Active');

-- 使用者角色
INSERT INTO user_role (user_id, role) VALUES (1, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (2, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (3, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (4, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (5, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (6, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (7, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (8, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (9, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (10, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (11, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (12, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (13, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (14, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (15, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (16, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (17, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (18, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (19, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (20, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (21, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (22, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (23, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (24, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (25, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (26, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (27, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (28, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (29, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (30, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (31, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (32, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (33, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (34, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (35, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (36, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (37, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (38, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (39, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (40, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (41, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (42, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (43, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (44, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (45, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (46, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (47, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (48, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (49, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (50, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (51, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (52, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (53, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (54, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (55, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (56, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (57, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (58, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (59, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (60, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (61, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (62, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (63, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (64, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (65, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (66, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (67, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (68, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (69, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (70, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (71, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (72, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (73, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (74, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (75, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (76, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (77, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (78, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (79, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (80, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (81, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (82, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (83, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (84, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (85, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (86, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (87, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (88, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (89, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (90, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (91, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (92, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (93, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (94, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (95, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (96, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (97, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (98, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (99, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (100, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (101, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (102, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (103, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (104, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (105, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (106, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (107, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (108, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (109, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (110, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (111, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (112, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (113, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (114, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (115, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (116, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (117, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (118, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (119, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (120, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (121, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (122, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (123, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (124, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (125, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (126, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (127, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (128, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (129, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (130, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (131, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (132, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (133, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (134, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (135, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (136, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (137, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (138, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (139, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (140, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (141, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (142, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (143, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (144, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (145, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (146, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (147, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (148, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (149, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (150, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (151, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (152, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (153, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (154, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (155, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (156, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (157, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (158, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (159, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (160, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (161, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (162, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (163, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (164, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (165, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (166, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (167, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (168, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (169, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (170, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (171, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (172, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (173, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (174, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (175, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (176, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (177, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (178, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (179, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (180, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (181, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (182, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (183, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (184, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (185, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (186, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (187, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (188, 'SysAdmin');
INSERT INTO user_role (user_id, role) VALUES (189, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (190, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (191, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (192, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (193, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (194, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (195, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (196, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (197, 'Finance');
INSERT INTO user_role (user_id, role) VALUES (198, 'VenueManager');
INSERT INTO user_role (user_id, role) VALUES (199, 'Applicant');
INSERT INTO user_role (user_id, role) VALUES (200, 'SysAdmin');

-- 組織成員
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (113, 1, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (9, 2, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (134, 3, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (25, 4, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (32, 5, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (173, 6, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (177, 7, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (69, 8, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (50, 9, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (177, 10, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (183, 11, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (120, 12, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (111, 13, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (5, 14, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (103, 15, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (199, 16, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (3, 17, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (93, 18, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (126, 19, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (52, 20, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (170, 21, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (168, 22, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (56, 23, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (7, 24, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (80, 25, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (48, 26, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (43, 27, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (179, 28, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (165, 29, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (47, 30, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (162, 31, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (47, 32, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (148, 33, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (134, 34, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (177, 35, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (74, 36, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (59, 37, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (173, 38, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (159, 39, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (105, 40, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (169, 41, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (131, 42, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (126, 43, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (131, 44, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (144, 45, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (43, 46, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (3, 47, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (67, 48, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (6, 49, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (104, 50, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (89, 51, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (71, 52, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (16, 53, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (120, 54, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (168, 55, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (13, 56, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (66, 57, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (66, 58, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (120, 59, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (42, 60, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (168, 61, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (85, 62, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (17, 63, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (18, 64, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (82, 65, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (111, 66, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (179, 67, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (171, 68, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (186, 69, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (101, 70, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (91, 71, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (107, 72, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (82, 73, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (13, 74, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (195, 75, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (161, 76, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (52, 77, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (80, 78, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (123, 79, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (69, 80, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (173, 81, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (49, 82, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (39, 83, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (1, 84, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (43, 85, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (97, 86, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (161, 87, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (157, 88, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (182, 89, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (96, 90, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (76, 91, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (160, 92, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (170, 93, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (85, 94, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (131, 95, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (80, 96, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (20, 97, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (20, 98, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (108, 99, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (43, 100, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (171, 101, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (7, 102, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (112, 103, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (187, 104, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (167, 105, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (40, 106, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (6, 107, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (123, 108, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (90, 109, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (173, 110, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (178, 111, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (82, 112, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (135, 113, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (53, 114, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (2, 115, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (31, 116, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (183, 117, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (131, 118, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (23, 119, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (130, 120, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (117, 121, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (85, 122, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (115, 123, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (115, 124, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (124, 125, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (199, 126, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (27, 127, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (1, 128, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (148, 129, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (136, 130, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (148, 131, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (131, 132, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (157, 133, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (83, 134, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (163, 135, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (37, 136, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (58, 137, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (181, 138, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (145, 139, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (33, 140, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (30, 141, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (12, 142, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (104, 143, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (137, 144, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (82, 145, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (17, 146, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (99, 147, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (44, 148, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (22, 149, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (27, 150, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (152, 151, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (70, 152, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (134, 153, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (189, 154, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (1, 155, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (137, 156, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (60, 157, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (163, 158, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (104, 159, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (194, 160, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (162, 161, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (137, 162, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (115, 163, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (188, 164, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (164, 165, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (166, 166, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (16, 167, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (10, 168, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (144, 169, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (137, 170, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (65, 171, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (136, 172, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (11, 173, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (155, 174, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (48, 175, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (79, 176, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (61, 177, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (170, 178, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (190, 179, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (105, 180, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (114, 181, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (57, 182, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (95, 183, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (4, 184, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (145, 185, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (111, 186, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (121, 187, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (181, 188, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (140, 189, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (126, 190, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (95, 191, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (184, 192, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (11, 193, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (81, 194, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (71, 195, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (189, 196, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (61, 197, TRUE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (26, 198, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (98, 199, FALSE);
INSERT INTO org_member (org_id, user_id, verified_bool) VALUES (145, 200, TRUE);

