create database BoardGames


create table BD_Ulke(
ulke_Id int PRIMARY KEY,
ulke_Adý varchar(50) UNIQUE)

create table BD_il(
il_Id int PRIMARY KEY,
il_Adý varchar(50) UNIQUE,
ulke_Id int REFERENCES BD_Ulke(ulke_Id))

create table BD_ilçe(
ilçe_Id int PRIMARY KEY,
ilçe_Adý varchar(50),
ulke_Id int REFERENCES BD_Ulke(ulke_Id),
il_Id int REFERENCES BD_il(il_Id)
)

create table BD_Kategori(
kategori_Id int PRIMARY KEY ,
kategori_Adý varchar (50) UNIQUE
)

create table BD_Mekanizma(
mekanizma_Id int PRIMARY KEY,
mekanizma_Adý varchar(50) UNIQUE
)

create table BD_Odül(
ödül_Adý varchar(60) UNIQUE,
ödül_Id int PRIMARY KEY ,
ödül_Tarih date,
ulke_Id int REFERENCES BD_Ulke(ulke_Id)
)

create table BD_Tasarýmcý(
tasarýmcý_Adý varchar(50),
tasarýmcý_Id int PRIMARY KEY ,
tasarýmcý_Soyad varchar(50),
ulke_Id int REFERENCES BD_Ulke(ulke_Id)
)

create table BD_Artist(
artist_Adý varchar(50),
artist_Id int PRIMARY KEY ,
artist_Soyad varchar(50),
ulke_Id int REFERENCES BD_Ulke(ulke_Id)
)

create table BD_Daðýtýcý(
daðýtýcý_Adý varchar(50) UNIQUE,
daðýtýcý_Id int PRIMARY KEY,
ulke_Id int REFERENCES BD_Ulke(ulke_Id)
)

create table BD_Dil(
dil_Adý varchar(50) UNIQUE,
dil_Id int PRIMARY KEY ,
)

create table BD_Lokasyon(
lokasyon_Adý varchar(50),
lokasyon_Id int PRIMARY KEY ,
ulke_Id int REFERENCES BD_Ulke(ulke_Id),
il_Id int REFERENCES BD_il(il_Id),
ilçe_Id int REFERENCES BD_ilçe(ilçe_Id)
)

create table BD_Oyun(
oyun_Id int PRIMARY KEY ,
oyun_Adý varchar(50),
oyun_enAzOyuncuSayýsý int,
oyun_enCokOyuncuSayýsý int,
oyun_SureMax int,
oyun_SureMin int,
oyun_Yas int,
oyun_Acýklama varchar(2000),
oyun_Tarih date,
oyun_Puan float,
oyun_Aðýrlýk float,
)

create table BD_Kullanýcý(
kullanýcý_Id int PRIMARY KEY ,
kullanýcý_Adý varchar(50),
kullanýcý_Soyad varchar(20),
kullanýcý_Email varchar(20) UNIQUE,
)

create table BD_oyunSeansý(
oyunseansý_Id int PRIMARY KEY ,
oyunseansý_OyunId int REFERENCES BD_Oyun(oyun_Id),
oyunseansý_BaþlangýçSaati time,
oyunseansý_Tarih date,
oyunseansý_BitiþTarihSaati time,
oyunseansý_Kazanan int REFERENCES BD_Kullanýcý(kullanýcý_Id),
oyunseansý_Baþlatan int REFERENCES BD_Kullanýcý(kullanýcý_Id),
oyunseansý_lokasyon int REFERENCES BD_Lokasyon(lokasyon_Id)
)

create table BD_OyunDaðýtým(
oyunD_Ýsim varchar(100) PRIMARY KEY,
oyunD_Tarih date,
oyun_ÜlkeId int REFERENCES BD_Ulke(ulke_Id),
oyun_DilId int REFERENCES BD_Dil(dil_Id),
oyun_Daðýtýcý int REFERENCES BD_Daðýtýcý(daðýtýcý_Id),
oyun_Id int REFERENCES BD_Oyun(Oyun_Id)
)

create table Yorum(
yorum_Id int PRIMARY KEY ,
yorum varchar(2000),
yorum_Tarih datetime,
yorumYapan int REFERENCES BD_Kullanýcý(kullanýcý_Id),
yorumYapýlanOyun int REFERENCES BD_Oyun(oyun_Id)
)

create Table AlýnanOyun(
satýn_AlmaId int PRIMARY KEY ,
alýnan_oyun int REFERENCES BD_Oyun(oyun_Id),
alan_Kullanýcý int REFERENCES BD_Kullanýcý(kullanýcý_Id),
alýnan_Tarih date,
tutar money
)

create table OyuncuSayýsý(
oynayanlar_Id int REFERENCES BD_Kullanýcý(kullanýcý_Id),
oyunSeansý int REFERENCES BD_oyunSeansý(oyunseansý_Id)
)

create table OyunKategori(
oyun_Id int REFERENCES BD_Oyun(oyun_Id),
kategori_Id int REFERENCES BD_Kategori(kategori_Id)
)

create table OyunMekanizma(
oyun_Id int REFERENCES BD_Oyun(oyun_Id),
mekanizma_Id int REFERENCES BD_Mekanizma(mekanizma_Id)
)

create table OyunTasarýmcý(
oyun_Id int REFERENCES BD_Oyun(oyun_Id),
tasarýmcý_Id int REFERENCES BD_Tasarýmcý(tasarýmcý_Id)
)

create table OyunArtist(
oyun_Id int REFERENCES BD_Oyun(oyun_Id),
artist_Id int REFERENCES BD_Artist(artist_Id)
)

create table AlýnanOduller(
oyun_Id int REFERENCES BD_Oyun(oyun_Id),
ödül_Id int REFERENCES BD_Odül(ödül_Id)
)

create table SahipOlunanLokasyon(
lokasyanId int REFERENCES BD_Lokasyon(lokasyon_Id),
kullabýcýId int REFERENCES BD_Kullanýcý(kullanýcý_Id)
)
