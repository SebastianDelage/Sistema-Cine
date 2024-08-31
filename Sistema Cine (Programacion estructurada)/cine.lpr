{$CODEPAGE UTF-8}
program cine;
        uses crt,dos ;
        const
          F = 15;
          C = 20;
        type
          butacas = array [1..C,1..F] of char;
          Tcolor = record
                         titulo : byte ;
                         menu : byte ;
                         fondo : byte ;
                         linea : byte ;
                         usuario : byte ;
                         opciones: byte ;
                   end;
        var
          Mbutacas:butacas;
          color : Tcolor ;
          op, opChar, opOps, op2, p: char;
          pelicula: string;
          i,j,x,y,xm,opByte, colorOp, filaVenta, columnaVenta,w,z,v,g,r :byte;
          D, M, A, ds,H,MM,S,MS: word;
          flagVenta : boolean ;
          vendidas, reservadas, libres: integer;
          precio, totalRecaudado : real;


procedure LimpiarLineas;
begin
  GotoXY(1, 29);
  ClrEol;
  GotoXY(1, 28);
  ClrEol;
  GotoXY(1, 28);
end;

begin
  getdate(A,M,D,ds);
  gettime(H,MM,S,MS);
  color.titulo := 3 ;
  color.menu := 15 ;
  color.fondo := 0 ;
  color.linea := 10 ;
  color.usuario := 5 ;
  color.opciones := 14 ;
  flagVenta := false ;
  totalRecaudado := 0 ;
  repeat
        textbackground (color.fondo);
        clrscr ();

        textcolor (color.titulo);
        xm := 55 ;
        r := 1 ;
        for i := 1 to 14 do begin
            repeat
                  randomize ();
                  gotoxy (xm,1);
                  write(chr(random(255)));
                  r := r + 1 ;
                  delay (50);
            until (r = 6);
            r := 1 ;
            case (xm) of
              55:begin
                  gotoxy (xm,1);
                  write ('M');
                 end;
              56:begin
                  gotoxy (xm,1);
                  write ('E');
                 end;
              57:begin
                  gotoxy (xm,1);
                  write ('N');
                 end;
              58:begin
                  gotoxy (xm,1);
                  write ('U');
                 end;
              59:begin
                  gotoxy (xm,1);
                  write (' ');
                 end;
              60:begin
                  gotoxy (xm,1);
                  write ('P');
                 end;
              61:begin
                  gotoxy (xm,1);
                  write ('R');
                 end;
              62:begin
                  gotoxy (xm,1);
                  write ('I');
                 end;
              63:begin
                  gotoxy (xm,1);
                  write ('N');
                 end;
              64:begin
                  gotoxy (xm,1);
                  write ('C');
                 end;
              65:begin
                  gotoxy (xm,1);
                  write ('I');
                 end;
              66:begin
                  gotoxy (xm,1);
                  write ('P');
                 end;
              67:begin
                  gotoxy (xm,1);
                  write ('A');
                 end;
              68:begin
                  gotoxy (xm,1);
                  write ('L');
                 end;
            end;
            xm := xm + 1 ;
        end;
        textcolor (color.opciones);
        gotoxy(51,9);
        write ('<P>');
        gotoxy (51,10);
        write ('<V>');
        gotoxy (51,11);
        write ('<E>');
        gotoxy (51,12);
        write ('<C>');
        gotoxy (51,13);
        write ('<S>');
        textcolor (color.linea);
        gotoxy (1,2);
        write ('------------------------------------------------------------------------------------------------------------------------');
        gotoxy (1,25);
        write ('------------------------------------------------------------------------------------------------------------------------');
        gotoxy(1,27);
        write ('------------------------------------------------------------------------------------------------------------------------');
        textcolor (color.menu);
        gotoxy (55,9);
        write ('PELICULAS');
        gotoxy (55,10);
        write ('VENTAS');;
        gotoxy (55,11);
        write ('ESTADISTICAS');
        gotoxy (55,12);
        write ('CONFIGURACION');
        gotoxy (55,13);
        write ('SALIR DEL SISTEMA');
        gotoxy (55,15);
        write ('OPCION: ');

        ///////
        textcolor (color.linea);
        w := 1 ;
        z := 120;
        repeat
        gotoxy(w,7);
        write ('_');
        w := w + 1;
        if (z > 48) then begin
          gotoxy(z,17);
          write ('_');
          z := z - 1 ;
        end;
        delay (20);
        until (w = 74);
        gotoxy (1,7);
        write ('                                                ');
        gotoxy (74,17);
        clreol;

        v := 8 ;
        g := 17 ;
        repeat
        gotoxy(74,v);
        write ('|');
        v := v + 1 ;
        gotoxy(48,g);
        write ('|');
        g := g - 1 ;
        delay (35);
        until (v = 18);
        ///////

        repeat
          gotoxy (63,15);
          textcolor (color.usuario);
          op := readkey();
          op:=Upcase(op);
          if (op <> 'C') and (op <> 'V') and (op <> 'E') and (op <> 'P') and (op <> 'S') then begin
             gotoxy (59,12);
             clreol;
             gotoxy(1,28);
             write ('Opcion no valida');
          end;
        until (op = 'C') or (op = 'V') or (op = 'E') or (op = 'P') or (op = 'S');
        case (op) of
             'S' : begin
                    textbackground (color.fondo);
                    clrscr();
                    textcolor (color.linea);
                    gotoxy (1,2);
                    write ('------------------------------------------------------------------------------------------------------------------------');
                    gotoxy (1,25);
                    write ('------------------------------------------------------------------------------------------------------------------------');
                    gotoxy(1,27);
                    write ('------------------------------------------------------------------------------------------------------------------------');
                    y := 10 ;
                    repeat
                          gotoxy (44,y);
                        write ('|');
                        gotoxy (77,y);
                        write ('|');
                        y := y + 1 ;
                    until (y = 16);
                    gotoxy (45,9);
                    write ('________________________________');
                    gotoxy (45,15);
                    write ('________________________________');
                    textcolor(color.titulo);
                    gotoxy (47,1);
                    write ('CONFIRMAR SALIR DEL SISTEMA');
                    textcolor (color.opciones);
                    gotoxy (47,11);
                    write ('<S>');
                    gotoxy (47,12);
                    write ('<G>');
                    textcolor (color.menu);
                    gotoxy (51,11);
                    write('CONFIRMAR SALIR');
                    gotoxy (51,12);
                    write('VOLVER AL MENU PRINCIPAL');
                    gotoxy (51,14);
                    write ('OPCION: ');
                    repeat
                          textcolor (color.usuario);
                          gotoxy (59,14);
                          op := readkey ();
                          op:= upcase(op);
                          if (op <> 'S') and (op <> 'G') then begin
                             gotoxy (59,14);
                             write (' ');
                             gotoxy (1,28);
                             write('Opcion no valida');
                          end;
                    until (op = 'S') or (op = 'G');
                   end;
////////////////////////////////////////////////////////////////////////////////
             'V': begin
                       if (pelicula = '') then begin
                          textbackground (color.fondo);
                          clrscr();
                          textcolor (4);
                          gotoxy (1,2);
                          write ('------------------------------------------------------------------------------------------------------------------------');
                          gotoxy (1,25);
                          write ('------------------------------------------------------------------------------------------------------------------------');
                          gotoxy(1,27);
                          write ('------------------------------------------------------------------------------------------------------------------------');
                          y := 9 ;
                          repeat
                                gotoxy (40,y);
                                write ('*');
                                gotoxy (80,y);
                                write ('*');
                                y := y + 1 ;
                          until (y = 16);
                          gotoxy (40,9);
                          write ('* * * * * * * * * * * * * * * * * * * * *');
                          gotoxy (40,15);
                          write ('* * * * * * * * * * * * * * * * * * * * *');
                          gotoxy (46,11);
                          write ('No se elijio una pelicula aun');
                          gotoxy (43,13);
                          write ('Presione cualquier tecla para salir');
                          readkey ();
                       end else begin
                       textbackground (color.fondo);
                       clrscr();
                       textcolor(color.titulo);
                       gotoxy (56,1);
                       write ('VENTAS');
                       textcolor(color.opciones);
                       gotoxy(7,3);
                       write ('Fecha: ',D,'/',M,'/',A);
                       gotoxy(40,3);
                       write ('Hora: ',H,':',MM);
                       gotoxy(70,3);
                       write('Pelicula: ',pelicula);
                       gotoxy(100,3);
                       write('Sala: 1');
                       textbackground (color.titulo);
                       gotoxy(35,5);
                       textcolor (15);
                       write('------------------- PANTALLA -------------------');
                       textbackground (color.fondo);
                       textcolor (color.linea);
                       gotoxy(1,4);
                       write('------------------------------------------------------------------------------------------------------------------------');
                       gotoxy (1,2);
                       write ('------------------------------------------------------------------------------------------------------------------------');
                       gotoxy (1,25);
                       write ('------------------------------------------------------------------------------------------------------------------------');
                       gotoxy(1,27);
                       write ('------------------------------------------------------------------------------------------------------------------------');
                       //////////////// Comienzo
                       if (flagVenta = false) then begin
                         for i:=1 to C do
                         begin
                              for j:= 1 to F do begin
                                Mbutacas[i,j] := 'V';
                              end;
                         end;
                       end;
                       ////// Simbolos al principio de venta ///////
                       if (flagVenta = false) then begin
                         x := 20;
                         y := 7;
                         textcolor (color.linea);
                         for i:= 1 to F do begin
                             for j:= 1 to C do begin
                                 gotoxy(x,y);
                                 write(chr(12));
                                 x := x + 4 ;
                             end;
                             x := 20 ;
                             y := y + 1 ;
                         end;
                       end else begin
                         x := 20;
                         y := 7;
                         textcolor (color.linea);
                         for i:= 1 to F do begin
                             for j:= 1 to C do begin
                                 gotoxy(x,y);
                                 case (Mbutacas[i,j]) of
                                      'C': begin
                                                textcolor (4);
                                                write (Mbutacas[i,j]);
                                           end;
                                      'R': begin
                                                textcolor (14);
                                                write(Mbutacas[i,j]);
                                           end;
                                      'V': begin
                                                textcolor (2);
                                                write (Mbutacas[i,j]);
                                           end;
                                 end;
                                 x := x + 4 ;
                             end;
                             x := 20 ;
                             y := y + 1 ;
                         end;
                       end;
                       ///////////////// Numeros y letras de butacas
                       x:= 20;
                       y:= 23;
                       textcolor(color.titulo);
                       for i:=1 to C do begin
                            gotoxy(x,y);
                            writeln(i);
                            x:=x+4;
                       end;

                       x:=100;
                       y:=7;
                       j:=65;
                       for i:=1 to F do begin
                           gotoxy(x,y);
                           write(char(j));
                           j:=j+1;
                           y:=y+1;
                       end;
                       ///////////////////
                       repeat
                             textcolor (color.opciones);
                             gotoxy(53,26);
                             write('<ESC> salir');
                             textcolor (color.menu);
                             gotoxy(1,26);
                             write('VENTA');
                             gotoxy(1,28);
                             write('Fila: ');
                             gotoxy(1,29);
                             write('Columna: ');
                             repeat
                                   textcolor (color.usuario);
                                   gotoxy(7,28);
                                   clreol;
                                   opChar := readkey;
                                   opChar := upcase(opChar);
                                   filaVenta := ((Ord(opChar)) - 64);
                                   if ((opChar < 'A') or (opChar > 'O')) and (ord(opChar) <> 27) then begin
                                      gotoxy (18,26);
                                      textcolor (4);
                                      write ('**Fila no valida**');
                                   end;
                             until ((opChar >= 'A') and (opChar <= 'O')) or (ord(opChar) = 27);
                             gotoxy (18,26);
                             clreol;
                             if (ord(opChar) = 27) then begin
                                //// Que no haga nada asi vuelve al menu ////
                             end else begin
                                textcolor (color.usuario);
                                gotoxy(7,28);
                                write(opChar);
                                repeat
                                      textcolor (color.usuario);
                                      gotoxy(9,29);
                                      clreol();
                                      readln(opByte);
                                      columnaVenta := opByte ;
                                      if (opByte < 1) or (opByte > 20) then begin
                                         gotoxy (18,26);
                                         textcolor (4);
                                         write ('**Columna no valida**');
                                      end;
                                until (opByte >= 1) and (opByte <= 20);
                                gotoxy (18,26);
                                clreol;

                                ////////////////
                                LimpiarLineas ;
                                case (Mbutacas[filaVenta,columnaVenta]) of
                                  'V': begin
                                         textcolor (color.opciones);
                                         gotoxy(1,28);
                                         write('<C> COMPRAR | <R> RESERVAR');
                                         textcolor (color.menu);
                                         gotoxy(1,29);
                                         write ('Opcion:');
                                         repeat
                                               textcolor (color.usuario);
                                               gotoxy (9,29);
                                               opOps := readkey;
                                               opOps := upcase (opOps);
                                               if (opOps <> 'C') and (opOps <> 'R') then begin
                                                  gotoxy (18,26);
                                                  textcolor (4);
                                                  write ('**Opcion no valida**');
                                               end
                                         until (opOps = 'C') or (opOps = 'R') ;
                                         gotoxy (18,26);
                                         clreol;
                                         if (opOps = 'C') then begin
                                            Mbutacas[filaVenta,columnaVenta]:= 'C' ;
                                         end else begin
                                             Mbutacas[filaVenta,columnaVenta]:= 'R' ;
                                         end;
                                       end;
                                  'R': begin
                                         LimpiarLineas;
                                         textcolor (color.opciones);
                                         gotoxy (1,28);
                                         write('<C> Comprar butaca | <V> Cancelar butaca');
                                         gotoxy (1,29);
                                         write ('Opcion:');
                                         repeat
                                               textcolor (color.usuario);
                                               gotoxy (9,29);
                                               opOps := readkey ;
                                               opOps := upcase (opOps);
                                               if (opOps <> 'C') and (opOps <> 'V') then begin
                                                  gotoxy (18,26);
                                                  textcolor (4);
                                                  write ('**Opcion no valida**');
                                               end;
                                         until (opOps = 'C') or (opOps = 'V');
                                         gotoxy (18,26);
                                         clreol;
                                         if (opOps = 'C') then begin
                                            Mbutacas[filaVenta,columnaVenta] := 'C';
                                         end else begin
                                            if (opOps = 'V') then begin
                                            Mbutacas[filaVenta,columnaVenta] := 'V';
                                            end;
                                         end;
                                       end;
                                  'C': begin
                                         LimpiarLineas ;
                                         gotoxy (1,28);
                                         textcolor (color.menu);
                                         write('La butaca esta vendida.');
                                         readln ();
                                       end;
                                end;
                             end;

                             if (flagVenta = false) then begin
                                x := 20;
                                y := 7;
                                textcolor (2);
                                for i:=1 to F do begin
                                    for j:= 1 to C do begin
                                        gotoxy(x,y) ;
                                        write('V') ;
                                        x := x + 4 ;
                                    end;
                                x := 20 ;
                                y := y + 1 ;
                                end;
                                flagVenta := true ;
                             end;
                             if (flagVenta = true) then begin
                               x := 20;
                               y := 7;
                               for i := 1 to F do begin
                                   for j := 1 to C do begin
                                       if (filaVenta = i) and (columnaVenta = j) then begin
                                          gotoxy (x,y);
                                          case (Mbutacas[i,j]) of
                                               'C': begin
                                                         textcolor(4);
                                                         write (Mbutacas[i,j]);
                                                    end;
                                               'R': begin
                                                         textcolor(14);
                                                         write (Mbutacas[i,j]);
                                                    end;
                                               'V': begin
                                                         textcolor (2);
                                                         write (Mbutacas[i,j]);
                                                    end;
                                          end;
                                       end;
                                       x := x + 4;
                                   end;
                               x := 20 ;
                               y := y + 1 ;
                               end;
                             end;
                       until ord(opChar) = 27 ;
                       end;
                  end;
////////////////////////////////////////////////////////////////////////////////
             'C': begin
                       clrscr();
                       textcolor (color.titulo);
                       gotoxy (53,1);
                       write ('CONFIGURACION');
                       textcolor (color.linea);
                       gotoxy (1,2);
                       write ('------------------------------------------------------------------------------------------------------------------------');
                       gotoxy (1,26);
                       write ('------------------------------------------------------------------------------------------------------------------------');
                       gotoxy(1,28);
                       write ('------------------------------------------------------------------------------------------------------------------------');
                       textcolor (color.menu);
                       gotoxy(1,29);
                       write ('Tema a seleccionar: ');
                       /////////////////////////////////////
                       i:= 1 ;   // CUADRO TEMA 1 //
                       j:= 3 ;
                       repeat
                             gotoxy(i,j);
                             textbackground (0);
                             clreol;
                             j := j + 1 ;
                       until (j = 14);
                       gotoxy (27,3);
                       textcolor (3);
                       write ('TITULO');
                       textcolor (10);
                       gotoxy (1,4);
                       write('----------------------------------------------------------');
                       gotoxy (1,12);
                       write('----------------------------------------------------------');
                       gotoxy (25,5);
                       textcolor (15);
                       write ('CONFIGURACION');
                       gotoxy (25,6);
                       write ('VENTAS');;
                       gotoxy (25,7);
                       write ('ESTADISTICAS');
                       gotoxy (25,8);
                       write ('PELICULA');
                       gotoxy (25,9);
                       write ('SALIR DEL SISTEMA');
                       gotoxy (25,11);
                       write ('OPCION: ');
                       textcolor (5);
                       gotoxy (33,11);
                       write ('Usuario');
                        textcolor (14);
                        gotoxy(21,5);
                        write ('<C>');
                        gotoxy (21,6);
                        write ('<V>');
                        gotoxy (21,7);
                        write ('<E>');
                        gotoxy (21,8);
                        write ('<P>');
                        gotoxy (21,9);
                        write ('<S>');
                        gotoxy (25,13);
                        textcolor (15);
                        write ('TEMA 1');

                        i:= 59 ;      // CUADRO TEMA 2 //
                        j:= 3 ;
                        repeat
                              gotoxy(i,j);
                              textbackground (15);
                              clreol;
                              j := j + 1 ;
                        until (j = 14);
                        gotoxy (87,3);
                        textcolor (4);
                        write ('TITULO');
                        textcolor (4);
                        gotoxy (59,4);
                        write('----------------------------------------------------------');
                        gotoxy (59,12);
                        write('----------------------------------------------------------');
                        gotoxy (85,5);
                        textcolor (0);
                        write ('CONFIGURACION');
                        gotoxy (85,6);
                        write ('VENTAS');;
                        gotoxy (85,7);
                        write ('ESTADISTICAS');
                        gotoxy (85,8);
                        write ('PELICULA');
                        gotoxy (85,9);
                        write ('SALIR DEL SISTEMA');
                        gotoxy (85,11);
                        write ('OPCION: ');
                        textcolor (4);
                        gotoxy (93,11);
                        write ('Usuario');
                        textcolor (4);
                        gotoxy(81,5);
                        write ('<C>');
                        gotoxy (81,6);
                        write ('<V>');
                        gotoxy (81,7);
                        write ('<E>');
                        gotoxy (81,8);
                        write ('<P>');
                        gotoxy (81,9);
                        write ('<S>');
                        gotoxy (85,13);
                        textcolor (0);
                        write ('TEMA 2');

                        i:= 1 ;   // CUADRO TEMA 3 //
                        j:= 15 ;
                        repeat
                              gotoxy(i,j);
                              textbackground (11);
                              clreol;
                              j := j + 1 ;
                        until (j = 26);
                        gotoxy (27,15);
                        textcolor (1);
                        write ('TITULO');
                        textcolor (0);
                        gotoxy (1,16);
                        write('----------------------------------------------------------');
                        gotoxy (1,24);
                        write('----------------------------------------------------------');
                        gotoxy (25,17);
                        textcolor (15);
                        write ('CONFIGURACION');
                        gotoxy (25,18);
                        write ('VENTAS');;
                        gotoxy (25,19);
                        write ('ESTADISTICAS');
                        gotoxy (25,20);
                        write ('PELICULA');
                        gotoxy (25,21);
                        write ('SALIR DEL SISTEMA');
                        gotoxy (25,23);
                        write ('OPCION: ');
                        textcolor (0);
                        gotoxy (33,23);
                        write ('Usuario');
                        textcolor (1);
                        gotoxy(21,17);
                        write ('<C>');
                        gotoxy (21,18);
                        write ('<V>');
                        gotoxy (21,19);
                        write ('<E>');
                        gotoxy (21,20);
                        write ('<P>');
                        gotoxy (21,21);
                        write ('<S>');
                        gotoxy (25,25);
                        textcolor (0);
                        write ('TEMA 3');

                        i:= 59 ;      // CUADRO TEMA 4 //
                        j:= 15 ;
                        repeat
                              gotoxy(i,j);
                              textbackground (0);
                              clreol;
                              j := j + 1 ;
                        until (j = 26);
                        gotoxy (87,15);
                        textcolor (4);
                        write ('TITULO');
                        textcolor (6);
                        gotoxy (59,16);
                        write('----------------------------------------------------------');
                        gotoxy (59,24);
                        write('----------------------------------------------------------');
                        gotoxy (85,17);
                        textcolor (5);
                        write ('CONFIGURACION');
                        gotoxy (85,18);
                        write ('VENTAS');;
                        gotoxy (85,19);
                        write ('ESTADISTICAS');
                        gotoxy (85,20);
                        write ('PELICULA');
                        gotoxy (85,21);
                        write ('SALIR DEL SISTEMA');
                        gotoxy (85,23);
                        write ('OPCION: ');
                        textcolor (9);
                        gotoxy (93,23);
                        write ('Usuario');
                        textcolor (8);
                        gotoxy(81,17);
                        write ('<C>');
                        gotoxy (81,18);
                        write ('<V>');
                        gotoxy (81,19);
                        write ('<E>');
                        gotoxy (81,20);
                        write ('<P>');
                        gotoxy (81,21);
                        write ('<S>');
                        gotoxy (85,25);
                        textcolor (15);
                        write ('TEMA 4');
                        /////////////////////////////////////
                        textbackground (color.fondo);
                        repeat
                        textcolor (color.usuario);
                        gotoxy (21,29);
                        clreol;
                        readln (colorOp);
                        if (colorOp <> 1) or (colorOP <> 2) or (colorOp <> 3) or (colorOp <> 4) then begin
                           gotoxy (1,27);
                           textcolor(4);
                           write('El tema no es valido');
                        end;
                        until (colorOp = 1) or (colorOP = 2) or (colorOp = 3) or (colorOp = 4);

                        case colorOp of
                             1: begin
                                     color.titulo := 3 ;
                                     color.menu := 15 ;
                                     color.fondo := 0 ;
                                     color.linea := 10 ;
                                     color.usuario := 5 ;
                                     color.opciones := 14 ;
                                end;
                             2: begin
                                     color.titulo := 4;
                                     color.menu := 0;
                                     color.fondo := 15;
                                     color.linea := 4;
                                     color.usuario := 4;
                                     color.opciones := 4;
                                end;
                             3: begin
                                     color.titulo := 1;
                                     color.menu :=  15;
                                     color.fondo := 11;
                                     color.linea := 0;
                                     color.usuario := 0;
                                     color.opciones := 1;
                                end;
                             4: begin
                                     color.titulo := 4;
                                     color.menu := 5;
                                     color.fondo := 0;
                                     color.linea := 6;
                                     color.usuario := 9;
                                     color.opciones := 8;
                                end;
                        end;
       end;

             'P':
                 begin
                 textbackground (color.fondo);
                 repeat
                       clrscr();
                       textcolor(color.linea);
                       gotoxy (1,2);
                       write ('------------------------------------------------------------------------------------------------------------------------');
                       gotoxy (1,26);
                       write ('------------------------------------------------------------------------------------------------------------------------');
                       gotoxy(1,28);
                       write ('------------------------------------------------------------------------------------------------------------------------');
                       textcolor (color.titulo);
                       gotoxy (55,1);
                       write ('PELICULA');
                       textcolor(color.opciones);
                       gotoxy(53,27);
                       write('<ESC> salir');
                       gotoxy(46,7);
                       write('<A>');
                       gotoxy(46,8);
                       write('<B>');
                       gotoxy(46,9);
                       write('<C>');
                       gotoxy(46,10);
                       write('<D>');
                       textcolor (color.menu);
                       gotoxy(50,5);
                       write('ELIGA LA PELICULA');
                       gotoxy(50,7);
                       write('STAR WARS');
                       gotoxy(50,8);
                       write('SPIDER MAN');
                       gotoxy(50,9);
                       write('CODIGO ENIGMA');
                       gotoxy(50,10);
                       write('MATRIX');
                       gotoxy (50,12);
                       write ('OPCION: ');
                       repeat
                             textcolor (color.usuario);
                             gotoxy (58,12);
                             op2:= readkey;
                             op2:= upcase(op2);
                             if (op2 <> 'A') and (op2 <> 'B') and (op2 <> 'C') and (op2 <> 'D') and (ord(op2) <> 27) then begin
                                gotoxy (58,12);
                                clreol;
                                gotoxy (1,29);
                                textcolor (4);
                                write ('La opcion ingresada no es valida');
                             end;
                       until (op2 = 'A') or (op2 = 'B') or (op2 = 'C') or (op2 = 'D') or (ord(op2) = 27) ;
                       if (op2 = 'A') or (op2 = 'B') or (op2 = 'C') or (op2 = 'D') then begin
                 case (op2) of
                    'A':
                        begin
                        pelicula := 'STAR WARS';
                        clrscr;
                        textcolor (color.titulo);
                        gotoxy (55,1);
                        write ('PELICULA');
                        gotoxy (60,5);
                        write (pelicula);
                        textcolor(color.linea);
                        gotoxy (1,2);
                        write ('------------------------------------------------------------------------------------------------------------------------');
                        gotoxy (1,26);
                        write ('------------------------------------------------------------------------------------------------------------------------');
                        gotoxy(1,28);
                        write ('------------------------------------------------------------------------------------------------------------------------');
                        gotoxy(50,5);
                        textcolor (color.menu);
                        write('PELICULA:');
                        gotoxy(50,7);
                        write('PRECIO 2D: $1000');;
                        gotoxy(50,8);
                        write('PRECIO 3D: $1500');
                        gotoxy (50,10);
                        write ('OPCION: ');
                        textcolor(color.opciones);
                        gotoxy(46,7);
                        write('<A>');
                        gotoxy(46,8);
                        write('<B>');
                        repeat
                              gotoxy (58,10);
                              p := readkey;
                              p := UpCase(p);
                              if (p <> 'A') and (p <> 'B') then begin
                                 gotoxy (58,10);
                                 clreol;
                                 textcolor (4);
                                 gotoxy (1,29);
                                 write ('La opcion ingresada no es valida');
                              end else begin
                                  if (p = 'A') then begin
                                     precio := 1000;
                                  end else begin
                                      precio := 1500;
                                  end;
                              end;
                        until (p = 'A') or (p = 'B');
                    end;





                    'B':
                    begin
                        pelicula:= 'SPIDER MAN';
                        clrscr;
                        textcolor (color.titulo);
                        gotoxy (55,1);
                        write ('PELICULA');
                        gotoxy (60,5);
                        write (pelicula);
                        textcolor(color.linea);
                        gotoxy (1,2);
                        write ('------------------------------------------------------------------------------------------------------------------------');
                        gotoxy (1,26);
                        write ('------------------------------------------------------------------------------------------------------------------------');
                        gotoxy(1,28);
                        write ('------------------------------------------------------------------------------------------------------------------------');
                        gotoxy(50,5);
                        textcolor (color.menu);
                        Write('PELICULA:');
                        gotoxy(50,7);
                        write('PRECIO 2D: $1000');
                        gotoxy(50,8);
                        write('PRECIO 3D: $1500');
                        gotoxy (50,10);
                        write ('OPCION: ');
                        textcolor(color.opciones);
                        gotoxy(46,7);
                        write('<A>');
                        gotoxy(46,8);
                        write('<B>');
                        repeat
                              textcolor (color.usuario);
                              gotoxy (58,10);
                              p := readkey;
                              p := UpCase(p);
                              if (p <> 'A') or (p <> 'B') then begin
                                 gotoxy (58,10);
                                 clreol;
                                 textcolor (4);
                                 gotoxy (1,29);
                                 write ('La opcion ingresada no es valida');
                              end else begin
                                  if p = 'A' then begin
                                     precio := 1000;
                                  end else begin
                                     precio := 1500;
                                  end;
                              end;
                        until (p = 'A') or (p = 'B');
                    end;

                    'C':
                        begin
                        pelicula:= 'CODIGO ENIGMA';
                        clrscr;
                        textcolor (color.titulo);
                        gotoxy (55,1);
                        write ('PELICULA');
                        gotoxy (60,5);
                        write (pelicula);
                        textcolor(color.linea);
                        gotoxy (1,2);
                        write ('------------------------------------------------------------------------------------------------------------------------');
                        gotoxy (1,26);
                        write ('------------------------------------------------------------------------------------------------------------------------');
                        gotoxy(1,28);
                        write ('------------------------------------------------------------------------------------------------------------------------');
                        gotoxy(50,5);
                        textcolor (color.menu);
                        Write('PELICULA:');
                        gotoxy(50,7);
                        write('PRECIO 2D: $1000');;
                        gotoxy(50,8);
                        write('PRECIO 3D: $1500');
                        gotoxy (50,10);
                        write ('OPCION: ');
                        textcolor(color.opciones);
                        gotoxy(46,7);
                        write('<A>');
                        gotoxy(46,8);
                        write('<B>');
                        gotoxy (58,10);
                        repeat
                              textcolor (color.usuario);
                              gotoxy (58,10);
                              p := readkey;
                              p := UpCase(p);
                              if (p <> 'A') or (p <> 'B') then begin
                                 gotoxy (58,10);
                                 clreol;
                                 textcolor (4);
                                 gotoxy (1,29);
                                 write ('La opcion ingresada no es valida');
                              end else begin
                                  if p = 'A' then begin
                                     precio := 1000;
                                  end else begin
                                     precio := 1500;
                                  end;
                              end;
                        until (p = 'A') or (p = 'B');
                        end;

                    'D':
                    begin
                        pelicula:= 'MATRIX';
                        clrscr;
                        textcolor (color.titulo);
                        gotoxy (55,1);
                        write ('PELICULA');
                        gotoxy (60,5);
                        write (pelicula);
                        textcolor(color.linea);
                        gotoxy (1,2);
                        write ('------------------------------------------------------------------------------------------------------------------------');
                        gotoxy (1,26);
                        write ('------------------------------------------------------------------------------------------------------------------------');
                        gotoxy(1,28);
                        write ('------------------------------------------------------------------------------------------------------------------------');
                        gotoxy(50,5);
                        textcolor (color.menu);
                        Write('PELICULA:');
                        gotoxy(50,7);
                        write('PRECIO 2D: $1000');
                        gotoxy(50,8);
                        write('PRECIO 3D: $1500');
                        gotoxy (50,10);
                        write ('OPCION: ');
                        textcolor(color.opciones);
                        gotoxy(46,7);
                        write('<A>');
                        gotoxy(46,8);
                        write('<B>');
                        gotoxy (58,10);
                        repeat
                              textcolor (color.usuario);
                              gotoxy (58,10);
                              p := readkey;
                              p := UpCase(p);
                              if (p <> 'A') or (p <> 'B') then begin
                                 gotoxy (58,10);
                                 clreol;
                                 textcolor (4);
                                 gotoxy (1,29);
                                 write ('La opcion ingresada no es valida');
                              end else begin
                                  if p = 'A' then begin
                                     precio := 1000;
                                  end else begin
                                      precio := 1500;
                                  end;
                              end;
                        until (p = 'A') or (p = 'B');
                        end;
                        end;
                        end else begin
                            //Que no haga nada asi se repite//
                        end;
                 until Ord(op2) = 27 ;
                end;

             'E' : begin
                        textbackground (color.fondo);
                        clrscr();
                        textcolor (color.linea);
                        gotoxy (1,2);
                        write ('------------------------------------------------------------------------------------------------------------------------');
                        gotoxy (1,25);
                        write ('------------------------------------------------------------------------------------------------------------------------');
                        gotoxy(1,27);
                        write ('------------------------------------------------------------------------------------------------------------------------');
                        textcolor(color.titulo);
                        gotoxy(55, 1);
                        write('ESTADISTICAS');

                        vendidas := 0;
                        reservadas := 0;
                        libres := 0;
                        totalRecaudado:= 0;

                  // Recorre la matriz
                  for i := 1 to C do begin
                    for j := 1 to F do begin
                      case Mbutacas[i,j] of
                        'V': begin
                                  libres := libres + 1;
                             end;
                        'R': begin
                                  reservadas := reservadas + 1;
                             end;
                        'C': begin
                                  vendidas := vendidas + 1;
                                  totalRecaudado := totalRecaudado + precio ;
                             end;
                        end;
                    end;
                    end;


                  // Imprime los resultados
                  textcolor (color.linea);
                  y := 8 ;
                  repeat
                        gotoxy (44,y);
                        write ('|');
                        gotoxy (76,y);
                        write ('|');
                        y := y + 1 ;
                  until (y = 18);
                  gotoxy (45,7);
                  write ('_______________________________');
                  gotoxy (45,17);
                  write ('_______________________________');
                  textcolor (color.menu);
                  gotoxy(47, 9);
                  write('Total butacas vendidas: ', vendidas);
                  gotoxy(47, 11);
                  write('Total butacas reservadas: ', reservadas);
                  gotoxy(47, 13);
                  write('Total butacas libres: ', libres);
                  gotoxy(47, 15);
                  write('Total recaudado: ', totalRecaudado:0:2);
                  gotoxy (1,28);
                  write ('Presione cualquier tecla para continuar');
                  readkey();
                end;

                 end;




  until (op = 'S') ;
  textbackground (color.fondo);
  clrscr();
  textcolor(color.titulo);
  gotoxy(55,13);
  write('Saliendo');
  delay(1000);
  gotoxy(63,13);
  write('.');
  delay(1000);
  gotoxy(64,13);
  write('.');
  delay(1000);
  gotoxy(65,13);
  write('.');
  delay (500);
end.
