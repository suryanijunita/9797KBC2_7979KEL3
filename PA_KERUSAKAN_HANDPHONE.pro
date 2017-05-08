%=====================================================================================
%           SISTEM PENDETEKSI KERUSAKAN PADA SMARTPHONE IPHONE
%				KELOMPOK 3
%		             KECERDASAN BUATAN
%=====================================================================================




domains
            kerusakan = symbol
            gejala = symbol
            tanya = string
            jawab = char
            nama = symbol
            listnama = string*
database
            xcari(gejala)
            xgagal(gejala)
predicates
            mulai
            cari(tanya,gejala)
            gagal(tanya,gejala)
	    anggota(listnama)           	
  nondeterm gejala(gejala)
            clear_fakta2
            simpan(gejala,jawab)
            tanya(tanya,gejala,jawab)
            pergi
  nondeterm diagnosa(kerusakan)
            solusi(kerusakan)
            penanganan(kerusakan)
       
goal
	write("-------------------------------------------------------------------CREATED BY---------------------------------------------------------------------"),nl,
	anggota(["\t\t\tSuryani Junita Patandianan","\t\t\tHadriyani","\t\t\tAhmad Arief"]),
	write("-------------------------------------------------------------------------------------------------------------------------------------------------------------"),nl,nl,
	write("\t----------SELAMAT DATANG DI COUNTER SERVICE IPHONE-------------"),nl,
	write("\t----------------PEMERIKSAAN KERUSAKAN PADA IPHONE-------------------"),nl,nl,
	write("SILAHKAN ISI DIAGNOSA DIBAWAH DENGAN KONDISI Y (benar) & T (untuk tidak) B)"),nl,nl,
        mulai.
clauses
		anggota([]).
		anggota([H|T]):-
		write(H),nl,anggota(T).
            mulai:-
                        pergi,nl,nl,nl,nl,nl,
                        write("Apakah Ingin mengulang lagi (Y/T) ?"),
                        readchar(Jawab),nl,
                        Jawab = 'y',
                        mulai.
            pergi:-
                        diagnosa(_),!,write("Save"),
                        save("test.dat"),
                        clear_fakta2.
            pergi:-
                        nl,nl,nl,nl,write("	MAAF SAYA TIDAK MENEMUKAN KERUSAKAN YANG ADA PADA SMARTPHONE ANDA"),nl,
                        write(" ----------------------------------------------------------------------------------------------------------------------------------------------------------------------"),nl,
                        clear_fakta2.
            cari(_,Gejala):-write("Apakah "),
                        xcari(Gejala),!.
            cari(Tanya,Gejala):-write("Iphone"),
                        not(xgagal(Gejala)),
                        tanya(Tanya,Gejala,Jawab),
                        Jawab='y'.
            gagal(_,Gejala):-
                        xgagal(Gejala),!.
            gagal(Tanya,Gejala):-
                        not(xcari(Gejala)),
                        tanya(Tanya,Gejala,Jawab),
                        Jawab='t'.
            tanya(Tanya,Gejala,Jawab):-
                        write(Tanya),
                        readchar(Jawab),
                        write(Jawab),nl,
                        simpan(Gejala,Jawab).
            simpan(Gejala,'y'):-
                        asserta(xcari(Gejala)).
            simpan(Gejala,'t'):-
                        asserta(xgagal(Gejala)).
            clear_fakta2:-
                        retract(xcari(_)),fail.
            clear_fakta2:-
                        retract(xgagal(_)),fail.
            clear_fakta2.

%-------------------GEJALA----------------------%

            gejala(Gejala):-
                        xcari(Gejala),!.
            gejala(Gejala):-
                        xgagal(Gejala),!,fail.

            gejala(kerusakan_layar):-
            		write("-----------------------------------------------------------------------------------------"),nl,
            		write("-	Pertanyaan Kerusakan Pada Layar                -"),nl,
            		write("-----------------------------------------------------------------------------------------"),nl,
                        cari(" Layar Tidak Bisa Dinyalakan(y/t)? ",kerusakan_layar),
                        cari(" Tidak Bisa Masuk OS(y/t)? ",kerusakan_layar1),
                        cari(" Tampilan Beranda Tidak Terbuka(y/t)? ",kerusakan_layar2).
                        
            gejala(touchpad):-
            		write("-----------------------------------------------------------------------------------------"),nl,
            		write("-	Pertanyaan Kerusakan Pada Touchpad         -"),nl,
            		write("-----------------------------------------------------------------------------------------"),nl,
                        cari(" Huruf Tidak Mau Muncul Ketika Di Ketik (y/t)? ",touchpad),
                        cari(" Hanya Beberapa Huruf Yang Muncul (y/t)? ",touchpad1).
                        
             gejala(sound):-
             		write("-----------------------------------------------------------------------------------------"),nl,
            		write("-	Pertanyaan Kerusakan Pada Sound               -"),nl,
            		write("-----------------------------------------------------------------------------------------"),nl,
                        cari(" Suara Tidak Terdengar(y/t)? ",sound),
                        cari(" Suara Tidak Jelas(y/t)? ",sound1),
                        cari(" Volume Suara Tidak Bisa Diperkecil(y/t)? ",sound2),
                        cari(" Volume Suara Tidak Bisa Diperbesar(y/t)? ",sound3),    
                        cari(" Suara Mati Total(y/t)? ",sound4).
                        
	     gejala(kamera):-
	     		write("-----------------------------------------------------------------------------------------"),nl,
            		write("-	Pertanyaan Kerusakan Kamera                      -"),nl,
            		write("-----------------------------------------------------------------------------------------"),nl,
                        cari(" Hasil Foto Buram, (y/t)? ",kamera),
                        cari(" Suara Kamera Tidak Bisa Di Silent (y/t)? ",kamera1),
             		cari(" Iphone Anda Pernah Jatuh (y/t)? ",kamera2),
             		cari(" Fitur Didalam Kamera Tidak Bisa Dijalankan (y/t)? ",kamera3),
            		cari(" Kamera Tidak Berfungsi Dengan Baik (y/t)? ",kamera4).
            		
     	     gejala(tombol):-
             		write("-----------------------------------------------------------------------------------------"),nl,
            		write("-	Pertanyaan Kerusakan Tombol Home            -"),nl,
            		write("-----------------------------------------------------------------------------------------"),nl,
            		cari(" Tombol Home Tidak Bekerja  (y/t)? ",tombol),
                        cari(" Pernah Di Reboot Atau Di Reset Sebelumnya (y/t)? ",tombol1).
                                             	
             gejala(wifi):-
             		write("-----------------------------------------------------------------------------------------"),nl,
            		write("-	Pertanyaan Kerusakan Wifi/Hostpot              -"),nl,
            		write("-----------------------------------------------------------------------------------------"),nl,
                        cari(" Tidak Mau Tersambung Wifi/Hostpot(y/t)? ",wifi),
                        cari(" Susah Di Restart Saat Iphone Tidak Bisa Tersambung Wifi/Hostpot(y/t)? ",wifi1).
                        
                        
%-------------------DIANOSA----------------------%

           
            diagnosa("Kerusakan_Layar"):-
                        gejala(kerusakan_layar),
                        gejala(kerusakan_layar1),
                        gejala(kerusakan_layar2),
                        solusi("Layar Non-Aktif"),
            penanganan("1.Anda bisa mencoba untuk menonaktifkan ponsel dan kemudian kembali \n\t\t 2.Perbarui perangkat lunagk iOS anda \n\t\t 3.Hubungi Service Iphone Atau Datang Langsung ke Service Center Apple Diaerahmu.").
                        
            diagnosa("Touchpad"):-
                        gejala(touchpad),
                        gejala(touchpad1),
                        solusi("Touchpad Non-Aktif"),
            penanganan("1.Matikan iPhone anda kemudian nyalakan kemabali. \n\t\t 2.Cobalah masuk ke menu Settings->Pesan dan nonaktifkan fitur Raise to Listen. \n\t\t 3.Hubungi Service Iphone Atau Datang Langsung ke Service Center Apple Diaerahmu.").
            
            diagnosa("Sound"):-
                        gejala(sound),
                        gejala(sound1),
                        gejala(sound2),
                        gejala(sound3),
                        gejala(sound4),
                        solusi("Sound Non-Aktif"),
            penanganan("1.Bersihkan port headphone anda untuk memastikan tidak ada debu atau kotoran yang menyebabkan masalah ini. \n\t\t 2.Jika masih tidak berfungsi bawa iphone anda ke Service Center Iphone.").
	    
	    diagnosa("Kamera"):-
                        gejala(kamera),
       			gejala(kamera1),
       			gejala(kamera2),
       			gejala(kamera3),
       			gejala(kamera4),
                        solusi("Kamera Non-Aktif"),
            penanganan("1.Perbarui perangkat lunak iOS dan restore iPhone melalui iTunes. \n\t\t 2.Hubungi Servis Iphone Atau Datang Langsung Dikantor Servis Didaerahmu").
           
            diagnosa("Tombol"):-
                        gejala(tombol),
                        gejala(tombol1),
                    	solusi("Tombol Non-Aktif"),
            penanganan("Perbaikan Tombol ada dua cara :\n\t\t 1.Perbarui perangkat lunak iOS atau untuk . \n\t\t 2.restore iPhone melalui iTunes. \n\t\t Jika masih tidak berfungsi hubungi Service Center Iphone").
            
            diagnosa("Wifi"):-
                        gejala(wifi),
                        gejala(wifi1),
                        solusi("Wifi Non-Aktif"),
            penanganan("1.Hubungi Servis Iphone Atau Datang Langsung Dikantor Servis Didaerahmu.").
%-------------------------------------------------------------------------------------------------------%           
            
            solusi(Kerusakan):-
                        upper_lower(XKerusakan,Kerusakan),nl,nl,nl,
                        write("  # Gejala yang ada pada Iphone anda adalah = ",XKerusakan),nl.  

            penanganan(Kerusakan):-
                        upper_lower(BKerusakan,Kerusakan),nl,nl,nl,
                        write("  # Solusinya adalah = ",BKerusakan),nl.  