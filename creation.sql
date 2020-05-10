create database BoardGames


create table BD_Ulke(
ulke_Id int PRIMARY KEY,
ulke_Ad� varchar(50) UNIQUE)

create table BD_il(
il_Id int PRIMARY KEY,
il_Ad� varchar(50) UNIQUE,
ulke_Id int REFERENCES BD_Ulke(ulke_Id))

create table BD_il�e(
il�e_Id int PRIMARY KEY,
il�e_Ad� varchar(50),
ulke_Id int REFERENCES BD_Ulke(ulke_Id),
il_Id int REFERENCES BD_il(il_Id)
)

create table BD_Kategori(
kategori_Id int PRIMARY KEY ,
kategori_Ad� varchar (50) UNIQUE
)

create table BD_Mekanizma(
mekanizma_Id int PRIMARY KEY,
mekanizma_Ad� varchar(50) UNIQUE
)

create table BD_Od�l(
�d�l_Ad� varchar(60) UNIQUE,
�d�l_Id int PRIMARY KEY ,
�d�l_Tarih date,
ulke_Id int REFERENCES BD_Ulke(ulke_Id)
)

create table BD_Tasar�mc�(
tasar�mc�_Ad� varchar(50),
tasar�mc�_Id int PRIMARY KEY ,
tasar�mc�_Soyad varchar(50),
ulke_Id int REFERENCES BD_Ulke(ulke_Id)
)

create table BD_Artist(
artist_Ad� varchar(50),
artist_Id int PRIMARY KEY ,
artist_Soyad varchar(50),
ulke_Id int REFERENCES BD_Ulke(ulke_Id)
)

create table BD_Da��t�c�(
da��t�c�_Ad� varchar(50) UNIQUE,
da��t�c�_Id int PRIMARY KEY,
ulke_Id int REFERENCES BD_Ulke(ulke_Id)
)

create table BD_Dil(
dil_Ad� varchar(50) UNIQUE,
dil_Id int PRIMARY KEY ,
)

create table BD_Lokasyon(
lokasyon_Ad� varchar(50),
lokasyon_Id int PRIMARY KEY ,
ulke_Id int REFERENCES BD_Ulke(ulke_Id),
il_Id int REFERENCES BD_il(il_Id),
il�e_Id int REFERENCES BD_il�e(il�e_Id)
)

create table BD_Oyun(
oyun_Id int PRIMARY KEY ,
oyun_Ad� varchar(50),
oyun_enAzOyuncuSay�s� int,
oyun_enCokOyuncuSay�s� int,
oyun_SureMax int,
oyun_SureMin int,
oyun_Yas int,
oyun_Ac�klama varchar(2000),
oyun_Tarih date,
oyun_Puan float,
oyun_A��rl�k float,
)

create table BD_Kullan�c�(
kullan�c�_Id int PRIMARY KEY ,
kullan�c�_Ad� varchar(50),
kullan�c�_Soyad varchar(20),
kullan�c�_Email varchar(20) UNIQUE,
)

create table BD_oyunSeans�(
oyunseans�_Id int PRIMARY KEY ,
oyunseans�_OyunId int REFERENCES BD_Oyun(oyun_Id),
oyunseans�_Ba�lang��Saati time,
oyunseans�_Tarih date,
oyunseans�_Biti�TarihSaati time,
oyunseans�_Kazanan int REFERENCES BD_Kullan�c�(kullan�c�_Id),
oyunseans�_Ba�latan int REFERENCES BD_Kullan�c�(kullan�c�_Id),
oyunseans�_lokasyon int REFERENCES BD_Lokasyon(lokasyon_Id)
)

create table BD_OyunDa��t�m(
oyunD_�sim varchar(100) PRIMARY KEY,
oyunD_Tarih date,
oyun_�lkeId int REFERENCES BD_Ulke(ulke_Id),
oyun_DilId int REFERENCES BD_Dil(dil_Id),
oyun_Da��t�c� int REFERENCES BD_Da��t�c�(da��t�c�_Id),
oyun_Id int REFERENCES BD_Oyun(Oyun_Id)
)

create table Yorum(
yorum_Id int PRIMARY KEY ,
yorum varchar(2000),
yorum_Tarih datetime,
yorumYapan int REFERENCES BD_Kullan�c�(kullan�c�_Id),
yorumYap�lanOyun int REFERENCES BD_Oyun(oyun_Id)
)

create Table Al�nanOyun(
sat�n_AlmaId int PRIMARY KEY ,
al�nan_oyun int REFERENCES BD_Oyun(oyun_Id),
alan_Kullan�c� int REFERENCES BD_Kullan�c�(kullan�c�_Id),
al�nan_Tarih date,
tutar money
)

create table OyuncuSay�s�(
oynayanlar_Id int REFERENCES BD_Kullan�c�(kullan�c�_Id),
oyunSeans� int REFERENCES BD_oyunSeans�(oyunseans�_Id)
)

create table OyunKategori(
oyun_Id int REFERENCES BD_Oyun(oyun_Id),
kategori_Id int REFERENCES BD_Kategori(kategori_Id)
)

create table OyunMekanizma(
oyun_Id int REFERENCES BD_Oyun(oyun_Id),
mekanizma_Id int REFERENCES BD_Mekanizma(mekanizma_Id)
)

create table OyunTasar�mc�(
oyun_Id int REFERENCES BD_Oyun(oyun_Id),
tasar�mc�_Id int REFERENCES BD_Tasar�mc�(tasar�mc�_Id)
)

create table OyunArtist(
oyun_Id int REFERENCES BD_Oyun(oyun_Id),
artist_Id int REFERENCES BD_Artist(artist_Id)
)

create table Al�nanOduller(
oyun_Id int REFERENCES BD_Oyun(oyun_Id),
�d�l_Id int REFERENCES BD_Od�l(�d�l_Id)
)

create table SahipOlunanLokasyon(
lokasyanId int REFERENCES BD_Lokasyon(lokasyon_Id),
kullab�c�Id int REFERENCES BD_Kullan�c�(kullan�c�_Id)
)
