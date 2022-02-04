% Sizes

int: width = 8;
int: height = 4;

set of int: columns = 1..width;
set of int: rows = 1..height;

% Tetris

int: I = 3;
int: O = 0;
int: T = 0;
int: J = 2;
int: L = 2;
int: S = 1;
int: Z = 0;

array[1..7] of int: shapes = [I, O, T, J, L, S, Z];

set of int: pieces = 1..sum(shapes);
array[pieces] of 1..7: shape = [i | i in 1..7, j in 1.. shapes[i]];

% Board

array[pieces] of var rows: row;
array[pieces] of var columns: column;

array[rows, columns] of var pieces: board;
array[pieces] of var 0..3 : rotation;

% Constraints

constraint sum(shapes)*4 = width*height;

constraint forall (p in pieces) (

  if shape[p] == 1 \/ shape[p] == 6 \/ shape[p] == 7 then
    rotation[p] = 0 \/ rotation[p] = 1
    
  elseif shape[p] == 2 then
    rotation[p] = 0
      
  else true endif

);

constraint forall(p in pieces)
(
    if shape[p] == 1 then
    
      if rotation[p] == 0 then
        board[ row[p], column[p] ] = p /\ board[ row[p], column[p]+1 ] = p /\ board[ row[p], column[p]+2 ] = p /\ board[ row[p], column[p]+3 ] = p
        
      elseif rotation[p] == 1 then
        board[ row[p], column[p] ] = p /\ board[ row[p]+1, column[p] ] = p /\ board[ row[p]+2, column[p] ] = p /\ board[ row[p]+3, column[p] ] = p
 
      else true endif
    
    
    elseif shape[p] == 2 then
     
        board[ row[p], column[p] ] = p /\ board[ row[p]+1, column[p] ] = p /\ board[ row[p], column[p]+1 ] = p /\ board[ row[p]+1, column[p]+1 ] = p
      
   
   elseif shape[p] == 3 then
    
      if rotation[p] == 0 then
        board[ row[p], column[p] ] = p /\ board[ row[p], column[p]-1 ] = p /\ board[ row[p], column[p]+1 ] = p /\ board[ row[p]-1, column[p] ] = p
        
      elseif rotation[p] == 1 then
        board[ row[p], column[p] ] = p /\ board[ row[p]-1, column[p] ] = p /\ board[ row[p]+1, column[p] ] = p /\ board[ row[p], column[p]+1 ] = p
        
      elseif rotation[p] == 2 then
        board[ row[p], column[p] ] = p /\ board[ row[p], column[p]-1 ] = p /\ board[ row[p], column[p]+1 ] = p /\ board[ row[p]+1, column[p] ] = p
        
      elseif rotation[p] == 3 then
        board[ row[p], column[p] ] = p /\ board[ row[p]-1, column[p] ] = p /\ board[ row[p]+1, column[p] ] = p /\ board[ row[p], column[p]-1 ] = p
         
      else true endif
         
      
    elseif shape[p] == 4 then
    
      if rotation[p] == 0 then
        board[ row[p], column[p] ] = p /\ board[ row[p], column[p]-1 ] = p /\ board[ row[p], column[p]+1 ] = p /\ board[ row[p]-1, column[p]-1 ] = p
        
      elseif rotation[p] == 1 then
        board[ row[p], column[p] ] = p /\ board[ row[p]-1, column[p] ] = p /\ board[ row[p]+1, column[p] ] = p /\ board[ row[p]-1, column[p]+1 ] = p
        
      elseif rotation[p] == 2 then
        board[ row[p], column[p] ] = p /\ board[ row[p], column[p]-1 ] = p /\ board[ row[p], column[p]+1 ] = p /\ board[ row[p]+1, column[p]+1 ] = p
        
      elseif rotation[p] == 3 then
        board[ row[p], column[p] ] = p /\ board[ row[p]-1, column[p] ] = p /\ board[ row[p]+1, column[p] ] = p /\ board[ row[p]+1, column[p]-1 ] = p
         
      else true endif
      
      
    elseif shape[p] == 5 then
    
      if rotation[p] == 0 then
        board[ row[p], column[p] ] = p /\ board[ row[p], column[p]-1 ] = p /\ board[ row[p], column[p]+1 ] = p /\ board[ row[p]-1, column[p]+1 ] = p
        
      elseif rotation[p] == 1 then
        board[ row[p], column[p] ] = p /\ board[ row[p]-1, column[p] ] = p /\ board[ row[p]+1, column[p] ] = p /\ board[ row[p]+1, column[p]+1 ] = p
        
      elseif rotation[p] == 2 then
        board[ row[p], column[p] ] = p /\ board[ row[p], column[p]-1 ] = p /\ board[ row[p], column[p]+1 ] = p /\ board[ row[p]+1, column[p]-1 ] = p
        
      elseif rotation[p] == 3 then
        board[ row[p], column[p] ] = p /\ board[ row[p]-1, column[p] ] = p /\ board[ row[p]+1, column[p] ] = p /\ board[ row[p]-1, column[p]-1 ] = p
         
      else true endif
      
      
    elseif shape[p] == 6 then
    
      if rotation[p] == 0 then
        board[ row[p], column[p] ] = p /\ board[ row[p], column[p]-1 ] = p /\ board[ row[p]-1, column[p] ] = p /\ board[ row[p]-1, column[p]+1 ] = p
        
      elseif rotation[p] == 1 then
        board[ row[p], column[p] ] = p /\ board[ row[p], column[p]+1 ] = p /\ board[ row[p]-1, column[p] ] = p /\ board[ row[p]+1, column[p]+1 ] = p
         
      else true endif
      
      
    elseif shape[p] == 7 then
    
      if rotation[p] == 0 then
        board[ row[p], column[p] ] = p /\ board[ row[p], column[p]+1 ] = p /\ board[ row[p]-1, column[p] ] = p /\ board[ row[p]-1, column[p]-1 ] = p
        
      elseif rotation[p] == 1 then
        board[ row[p], column[p] ] = p /\ board[ row[p], column[p]+1 ] = p /\ board[ row[p]+1, column[p] ] = p /\ board[ row[p]-1, column[p]+1 ] = p
         
      else true endif
      
      
    else true endif
);


solve :: seq_search([
    
    int_search(column, first_fail, indomain_random),
    int_search(row, first_fail, indomain_random),
    restart_linear(1000)
    
])satisfy;

output [ show(board[i,j]) ++ " " ++ if j == width then "\n" else " " endif | i in rows, j in columns ];