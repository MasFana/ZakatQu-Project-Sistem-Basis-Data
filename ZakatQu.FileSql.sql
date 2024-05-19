CREATE TABLE amil_zakat (
    id_amil_zakat   SERIAL NOT NULL,
    nama_amil_zakat VARCHAR(50) NOT NULL,
    nik             VARCHAR(50) NOT NULL,
    alamat          VARCHAR(50) NOT NULL,
    "RT/RW"         VARCHAR(10) NOT NULL,
    nomor_telepon   VARCHAR(15) NOT NULL
);

ALTER TABLE amil_zakat ADD CONSTRAINT amil_zakat_pk PRIMARY KEY ( id_amil_zakat );

CREATE TABLE bentuk_zakat (
    id_bentuk_zakat   INTEGER NOT NULL,
    nama_bentuk_zakat VARCHAR(50) NOT NULL
);

ALTER TABLE bentuk_zakat ADD CONSTRAINT bentuk_zakat_pk PRIMARY KEY ( id_bentuk_zakat );

CREATE TABLE distribusi_zakat (
    id_distribusi_zakat     SERIAL NOT NULL,
    jumlah_paket_zakat      INTEGER NOT NULL,
    id_amil_zakat           INTEGER NOT NULL,
    id_bentuk_zakat         INTEGER NOT NULL, 
    id_status_distribusi    INTEGER NOT NULL
);

ALTER TABLE distribusi_zakat ADD CONSTRAINT distribusi_zakat_pk PRIMARY KEY ( id_distribusi_zakat );

CREATE TABLE jenis_zakat (
    id_jenis_zakat   INTEGER NOT NULL,
    nama_jenis_zakat VARCHAR(50) NOT NULL
);

ALTER TABLE jenis_zakat ADD CONSTRAINT jenis_zakat_pk PRIMARY KEY ( id_jenis_zakat );

CREATE TABLE pembayaran_zakat (
    id_pembayaran           SERIAL NOT NULL,
    besar_pemberian         INTEGER NOT NULL,
    tanggal_pemberian       DATE NOT NULL,
    id_amil_zakat           INTEGER NOT NULL,
    id_pemberi_zakat        INTEGER NOT NULL,
    id_bentuk_zakat         INTEGER NOT NULL,
    id_jenis_zakat          INTEGER NOT NULL
);

ALTER TABLE pembayaran_zakat ADD CONSTRAINT pembayaran_zakat_pk PRIMARY KEY ( id_pembayaran );

CREATE TABLE pemberi_zakat (
    id_pemberi_zakat        SERIAL NOT NULL,
    nama_pemberi_zakat      VARCHAR(50) NOT NULL,
    nik                     VARCHAR(16) NOT NULL,
    alamat                  VARCHAR(50) NOT NULL,
    "RT/RW"                 VARCHAR(10) NOT NULL,
    nomor_telepon           VARCHAR(15) NOT NULL, 
    id_status_pembayaran_zakat INTEGER NOT NULL
);

ALTER TABLE pemberi_zakat ADD CONSTRAINT pemberi_zakat_pk PRIMARY KEY ( id_pemberi_zakat );

CREATE TABLE penerima_zakat (
    id_penerima_zakat       SERIAL NOT NULL,
    nama_kepala_keluarga    VARCHAR(50) NOT NULL,
    no__kk                  VARCHAR(16) NOT NULL,
    alamat                  VARCHAR(50) NOT NULL,
    "RT/RW"                 VARCHAR(10) NOT NULL,
    nomor_telepon           VARCHAR(15) NOT NULL, 
    id_distribusi_zakat     INTEGER NOT NULL
);

CREATE UNIQUE INDEX penerima_zakat__idx ON
    penerima_zakat (
        id_distribusi_zakat
    ASC );

ALTER TABLE penerima_zakat ADD CONSTRAINT penerima_zakat_pk PRIMARY KEY ( id_penerima_zakat );

CREATE TABLE status_distribusi (
    id_status_distribusi   INTEGER NOT NULL,
    nama_status_distribusi VARCHAR(50) NOT NULL
);

ALTER TABLE status_distribusi ADD CONSTRAINT status_distribusi_pk PRIMARY KEY ( id_status_distribusi );

CREATE TABLE status_pembayaran_zakat (
    id_status_pembayaran_zakat INTEGER NOT NULL,
    nama_pembayaran_zakat      VARCHAR(50) NOT NULL
);

ALTER TABLE status_pembayaran_zakat ADD CONSTRAINT status_pembayaran_zakat_pk PRIMARY KEY ( id_status_pembayaran_zakat );

ALTER TABLE distribusi_zakat
    ADD CONSTRAINT distribusi_zakat_amil_zakat_fk FOREIGN KEY ( id_amil_zakat )
        REFERENCES amil_zakat ( id_amil_zakat );

ALTER TABLE distribusi_zakat
    ADD CONSTRAINT distribusi_zakat_bentuk_zakat_fk FOREIGN KEY ( id_bentuk_zakat )
        REFERENCES bentuk_zakat ( id_bentuk_zakat );

ALTER TABLE distribusi_zakat
    ADD CONSTRAINT distribusi_zakat_status_distribusi_fk FOREIGN KEY ( id_status_distribusi )
        REFERENCES status_distribusi ( id_status_distribusi );

ALTER TABLE pembayaran_zakat
    ADD CONSTRAINT pembayaran_zakat_amil_zakat_fk FOREIGN KEY ( id_amil_zakat )
        REFERENCES amil_zakat ( id_amil_zakat );

ALTER TABLE pembayaran_zakat
    ADD CONSTRAINT pembayaran_zakat_bentuk_zakat_fk FOREIGN KEY ( id_bentuk_zakat )
        REFERENCES bentuk_zakat ( id_bentuk_zakat );

ALTER TABLE pembayaran_zakat
    ADD CONSTRAINT pembayaran_zakat_jenis_zakat_fk FOREIGN KEY ( id_jenis_zakat )
        REFERENCES jenis_zakat ( id_jenis_zakat );

ALTER TABLE pembayaran_zakat
    ADD CONSTRAINT pembayaran_zakat_pemberi_zakat_fk FOREIGN KEY ( id_pemberi_zakat )
        REFERENCES pemberi_zakat ( id_pemberi_zakat );

ALTER TABLE pemberi_zakat
    ADD CONSTRAINT pemberi_zakat_status_pembayaran_zakat_fk FOREIGN KEY ( id_status_pembayaran_zakat )
        REFERENCES status_pembayaran_zakat ( id_status_pembayaran_zakat );

ALTER TABLE penerima_zakat
    ADD CONSTRAINT penerima_zakat_distribusi_zakat_fk FOREIGN KEY ( id_distribusi_zakat )
        REFERENCES distribusi_zakat ( id_distribusi_zakat );