with Text_IO, Ada.Integer_Text_IO;
use Text_IO, Ada.Integer_Text_IO;
procedure LD4 is
   task MaxElementInRow is

      entry TotalRequests (N : in Integer);
      entry Row (i : in Integer);

   end MaxElementInRow;

   task ListofRows is

      entry Result (Max : in Integer);

   end ListofRows;


   task body MaxElementInRow is

      type MType is array (Integer range <>, Integer range <>) of Integer;

      K: constant Integer :=7;
      M: constant Integer :=7;

      Matr : MType(1..K, 1..M) := ((1,2,3,4,5,6,7),
                                   (6,7,8,9,10,11,12),
                                   (11,12,13,14,15,16,17),
                                   (16,17,18,19,20,21,22),
                                   (21,22,23,24,25,26,27),
                                   (26,27,28,29,30,31,32),
                                   (31,32,33,34,35,36,37));
      x,y,j,max: integer;

   begin

      accept TotalRequests (N : in Integer) do

         x:= N;

      end TotalRequests;

      for xi in 1..x loop

         accept Row (i : in Integer) do

            y:= i;

         end Row;


          max:= Matr'First(2);
            j:=1;
         while j /= Matr'Length(2)+1 loop

            IF Matr(y,j) > max then

                  max:= Matr(y,j);

            end if;

            j:=j+1;
         end loop;
         ListofRows.Result (max);
      end loop;

end MaxElementInRow;


   task body ListofRows is

      type VectType is array (Integer range <>) of Integer;

      K: constant Integer :=7;

      Vect : VectType(1..K) := (4,3,5,2,1,7,2);

      rez,rinda,i: integer;

   begin
      MaxElementInRow.TotalRequests(Vect'Length);
      i:=1;
      while i /= Vect'Length+1 loop
         rinda:= Vect(i);
         MaxElementInRow.Row(rinda);
         accept Result (Max : in Integer) do
            rez:= Max;
         end Result;

            put_line("Row:" & Positive'Image(rinda) & " Maximal element:" &  Positive'Image(rez));
         i:=i+1;
      end loop;
   end ListofRows;
begin

null;

end LD4;

