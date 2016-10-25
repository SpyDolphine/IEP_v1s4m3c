    INSERT INTO division(divisionno, 
      categoryno, title, seqno, visible, ids, me_no)
    VALUES((SELECT NVL(MAX(divisionno), 0)+1 as divisionno FROM division), 
      1, '제목', 2, 'Y' 'M', 1)
      
      
   UPDATE division
    SET categoryno=1, title='대관령123', seqno=2, visible='Y', ids='M'
    WHERE divisionno = 4
    
    
        UPDATE division 
    SET cnt=cnt + 1 
    WHERE divisionno=4
    
        UPDATE division SET seqno=seqno + 1 
    WHERE divisionno=4
    SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board
    
    INSERT INTO board(boardno,
                  divisionno, me_no, title, content, good, file1, file2, size2, rdate, 
                  grpno, indent, ansnum)  
    VALUES((SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board),
	                1, 1, '제목이래', '내용이라고',0, null, null, null, sysdate,
	                (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM board), 0, 0)
	                
    INSERT INTO board(boardno,
                          divisionno, me_no, title, content, good, file1, file2, size2, date, 
                          grpno, indent, ansnum)  
    VALUES((SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board),
                          #{divisionno}, 1, #{title}, #{content}, 0, #{file1}, #{file2}, #{size2}, sysdate,
                          4, 1, 1)