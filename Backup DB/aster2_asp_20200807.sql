PGDMP     "                    x         
   aster2_asp    10.0    12.2    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    26315 
   aster2_asp    DATABASE     h   CREATE DATABASE aster2_asp WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE aster2_asp;
                postgres    false                        2615    26316    1    SCHEMA        CREATE SCHEMA "1";
    DROP SCHEMA "1";
                postgres    false                        2615    50450    10    SCHEMA        CREATE SCHEMA "10";
    DROP SCHEMA "10";
                postgres    false                        2615    26317    2    SCHEMA        CREATE SCHEMA "2";
    DROP SCHEMA "2";
                postgres    false                        2615    26318    3    SCHEMA        CREATE SCHEMA "3";
    DROP SCHEMA "3";
                postgres    false                        2615    49302    4    SCHEMA        CREATE SCHEMA "4";
    DROP SCHEMA "4";
                postgres    false                        2615    49494    5    SCHEMA        CREATE SCHEMA "5";
    DROP SCHEMA "5";
                postgres    false            	            2615    49685    6    SCHEMA        CREATE SCHEMA "6";
    DROP SCHEMA "6";
                postgres    false                        2615    49876    7    SCHEMA        CREATE SCHEMA "7";
    DROP SCHEMA "7";
                postgres    false                        2615    50067    8    SCHEMA        CREATE SCHEMA "8";
    DROP SCHEMA "8";
                postgres    false                        2615    50259    9    SCHEMA        CREATE SCHEMA "9";
    DROP SCHEMA "9";
                postgres    false                        2615    26319    @base    SCHEMA        CREATE SCHEMA "@base";
    DROP SCHEMA "@base";
                postgres    false            �            1259    26320    areas    TABLE     �  CREATE TABLE "@base".areas (
    id integer NOT NULL,
    service_id integer,
    center_id integer,
    area_name text NOT NULL,
    area_name_kana text,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer,
    CONSTRAINT areas_area_name_check CHECK ((area_name <> ''::text))
);
    DROP TABLE "@base".areas;
       @base            postgres    false    14            �           0    0    COLUMN areas.center_id    COMMENT     J   COMMENT ON COLUMN "@base".areas.center_id IS 'select|ja:センター名';
          @base          postgres    false    207            �           0    0    COLUMN areas.area_name    COMMENT     B   COMMENT ON COLUMN "@base".areas.area_name IS 'text|ja:地区名';
          @base          postgres    false    207            �           0    0    COLUMN areas.area_name_kana    COMMENT     Y   COMMENT ON COLUMN "@base".areas.area_name_kana IS 'text|ja:地区名（ふりがな）';
          @base          postgres    false    207            �            1259    26329    areas    TABLE     5   CREATE TABLE "1".areas (
)
INHERITS ("@base".areas);
    DROP TABLE "1".areas;
       1            postgres    false    17    207            �            1259    26338    centers    TABLE     D  CREATE TABLE "@base".centers (
    id integer NOT NULL,
    service_id integer,
    facility_cat integer,
    center_name text NOT NULL,
    center_kana text,
    post_cd text,
    prefectures integer,
    municipality text,
    building_name text,
    phone text,
    manager_name text,
    manager_kana text,
    manager_email text,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer,
    CONSTRAINT centers_center_name_check CHECK ((center_name <> ''::text))
);
    DROP TABLE "@base".centers;
       @base            postgres    false    14            �           0    0    COLUMN centers.facility_cat    COMMENT     e   COMMENT ON COLUMN "@base".centers.facility_cat IS 'select:AR_facility_cat|ja:施設カテゴリー';
          @base          postgres    false    209            �           0    0    COLUMN centers.center_name    COMMENT     I   COMMENT ON COLUMN "@base".centers.center_name IS 'text|ja:施設名称';
          @base          postgres    false    209            �           0    0    COLUMN centers.center_kana    COMMENT     I   COMMENT ON COLUMN "@base".centers.center_kana IS 'text|ja:ふりがな';
          @base          postgres    false    209            �           0    0    COLUMN centers.post_cd    COMMENT     E   COMMENT ON COLUMN "@base".centers.post_cd IS 'text|ja:郵便番号';
          @base          postgres    false    209            �           0    0    COLUMN centers.prefectures    COMMENT     W   COMMENT ON COLUMN "@base".centers.prefectures IS 'select:AR_PrefCode|ja:都道府県';
          @base          postgres    false    209            �           0    0    COLUMN centers.municipality    COMMENT     J   COMMENT ON COLUMN "@base".centers.municipality IS 'text|ja:市区町村';
          @base          postgres    false    209            �           0    0    COLUMN centers.building_name    COMMENT     Z   COMMENT ON COLUMN "@base".centers.building_name IS 'text|ja:マンション・建物名';
          @base          postgres    false    209            �           0    0    COLUMN centers.phone    COMMENT     C   COMMENT ON COLUMN "@base".centers.phone IS 'text|ja:電話番号';
          @base          postgres    false    209            �           0    0    COLUMN centers.manager_name    COMMENT     J   COMMENT ON COLUMN "@base".centers.manager_name IS 'text|ja:管理者名';
          @base          postgres    false    209            �           0    0    COLUMN centers.manager_kana    COMMENT     T   COMMENT ON COLUMN "@base".centers.manager_kana IS 'text|ja:管理者 ふりがな';
          @base          postgres    false    209            �           0    0    COLUMN centers.manager_email    COMMENT     Q   COMMENT ON COLUMN "@base".centers.manager_email IS 'text|ja:管理者メール';
          @base          postgres    false    209            �            1259    26347    centers    TABLE     9   CREATE TABLE "1".centers (
)
INHERITS ("@base".centers);
    DROP TABLE "1".centers;
       1            postgres    false    209    17            �            1259    26356    patients    TABLE     �  CREATE TABLE "@base".patients (
    id integer NOT NULL,
    service_id integer,
    area_id integer,
    patient_cd text NOT NULL,
    patient_name text NOT NULL,
    patient_name_kana text,
    gender integer,
    birthday date,
    status integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer,
    post_cd text,
    prefectures integer,
    municipality text,
    address text,
    agree1 boolean,
    agree2 boolean,
    CONSTRAINT patients_patient_cd_check CHECK ((patient_cd <> ''::text)),
    CONSTRAINT patients_patient_name_check CHECK ((patient_name <> ''::text))
);
    DROP TABLE "@base".patients;
       @base            postgres    false    14            �           0    0    COLUMN patients.area_id    COMMENT     E   COMMENT ON COLUMN "@base".patients.area_id IS 'select|ja:地区名';
          @base          postgres    false    211            �           0    0    COLUMN patients.patient_cd    COMMENT     P   COMMENT ON COLUMN "@base".patients.patient_cd IS 'text|search|ja:検診者No.';
          @base          postgres    false    211            �           0    0    COLUMN patients.patient_name    COMMENT     L   COMMENT ON COLUMN "@base".patients.patient_name IS 'text|search|ja:名前';
          @base          postgres    false    211            �           0    0 !   COLUMN patients.patient_name_kana    COMMENT     W   COMMENT ON COLUMN "@base".patients.patient_name_kana IS 'text|search|ja:ふりがな';
          @base          postgres    false    211            �           0    0    COLUMN patients.gender    COMMENT     R   COMMENT ON COLUMN "@base".patients.gender IS 'select:AR_Gender|search|ja:性別';
          @base          postgres    false    211            �           0    0    COLUMN patients.birthday    COMMENT     N   COMMENT ON COLUMN "@base".patients.birthday IS 'date|search|ja:生年月日';
          @base          postgres    false    211            �            1259    26365    patients    TABLE     ;   CREATE TABLE "1".patients (
)
INHERITS ("@base".patients);
    DROP TABLE "1".patients;
       1            postgres    false    211    17            �            1259    26374    treating_patient_adl    TABLE     �  CREATE TABLE "@base".treating_patient_adl (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    faq08 integer,
    faq09 integer,
    faq10 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 )   DROP TABLE "@base".treating_patient_adl;
       @base            postgres    false    14            �           0    0 !   COLUMN treating_patient_adl.faq01    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_adl.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    213            �           0    0 !   COLUMN treating_patient_adl.faq02    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_adl.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    213            �           0    0 !   COLUMN treating_patient_adl.faq03    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_adl.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    213            �           0    0 !   COLUMN treating_patient_adl.faq04    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_adl.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    213            �           0    0 !   COLUMN treating_patient_adl.faq05    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_adl.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    213            �           0    0 !   COLUMN treating_patient_adl.faq06    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_adl.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    213            �           0    0 !   COLUMN treating_patient_adl.faq07    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_adl.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    213            �           0    0 !   COLUMN treating_patient_adl.faq08    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_adl.faq08 IS 'radio:AR_Bool|ja:faq08';
          @base          postgres    false    213            �           0    0 !   COLUMN treating_patient_adl.faq09    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_adl.faq09 IS 'radio:AR_Bool|ja:faq09';
          @base          postgres    false    213            �           0    0 !   COLUMN treating_patient_adl.faq10    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_adl.faq10 IS 'radio:AR_Bool|ja:faq10';
          @base          postgres    false    213            �            1259    26379    treating_patient_adl    TABLE     S   CREATE TABLE "1".treating_patient_adl (
)
INHERITS ("@base".treating_patient_adl);
 %   DROP TABLE "1".treating_patient_adl;
       1            postgres    false    213    17            �            1259    26384    treating_patient_basic_adl    TABLE     �  CREATE TABLE "@base".treating_patient_basic_adl (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    faq08 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 /   DROP TABLE "@base".treating_patient_basic_adl;
       @base            postgres    false    14            �           0    0 '   COLUMN treating_patient_basic_adl.faq01    COMMENT     X   COMMENT ON COLUMN "@base".treating_patient_basic_adl.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    215            �           0    0 '   COLUMN treating_patient_basic_adl.faq02    COMMENT     X   COMMENT ON COLUMN "@base".treating_patient_basic_adl.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    215            �           0    0 '   COLUMN treating_patient_basic_adl.faq03    COMMENT     X   COMMENT ON COLUMN "@base".treating_patient_basic_adl.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    215            �           0    0 '   COLUMN treating_patient_basic_adl.faq04    COMMENT     X   COMMENT ON COLUMN "@base".treating_patient_basic_adl.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    215            �           0    0 '   COLUMN treating_patient_basic_adl.faq05    COMMENT     X   COMMENT ON COLUMN "@base".treating_patient_basic_adl.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    215            �           0    0 '   COLUMN treating_patient_basic_adl.faq06    COMMENT     X   COMMENT ON COLUMN "@base".treating_patient_basic_adl.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    215            �           0    0 '   COLUMN treating_patient_basic_adl.faq07    COMMENT     X   COMMENT ON COLUMN "@base".treating_patient_basic_adl.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    215            �           0    0 '   COLUMN treating_patient_basic_adl.faq08    COMMENT     X   COMMENT ON COLUMN "@base".treating_patient_basic_adl.faq08 IS 'radio:AR_Bool|ja:faq08';
          @base          postgres    false    215            �            1259    26389    treating_patient_basic_adl    TABLE     _   CREATE TABLE "1".treating_patient_basic_adl (
)
INHERITS ("@base".treating_patient_basic_adl);
 +   DROP TABLE "1".treating_patient_basic_adl;
       1            postgres    false    215    17            �            1259    26394    treating_patient_blood_sugar    TABLE     �  CREATE TABLE "@base".treating_patient_blood_sugar (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 text,
    faq02 numeric(18,3),
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 1   DROP TABLE "@base".treating_patient_blood_sugar;
       @base            postgres    false    14            �           0    0 )   COLUMN treating_patient_blood_sugar.faq01    COMMENT     Q   COMMENT ON COLUMN "@base".treating_patient_blood_sugar.faq01 IS 'text|ja:faq01';
          @base          postgres    false    217            �           0    0 )   COLUMN treating_patient_blood_sugar.faq02    COMMENT     Q   COMMENT ON COLUMN "@base".treating_patient_blood_sugar.faq02 IS 'text|ja:faq02';
          @base          postgres    false    217            �           0    0 )   COLUMN treating_patient_blood_sugar.faq03    COMMENT     Z   COMMENT ON COLUMN "@base".treating_patient_blood_sugar.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    217            �           0    0 )   COLUMN treating_patient_blood_sugar.faq04    COMMENT     Z   COMMENT ON COLUMN "@base".treating_patient_blood_sugar.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    217            �           0    0 )   COLUMN treating_patient_blood_sugar.faq05    COMMENT     Z   COMMENT ON COLUMN "@base".treating_patient_blood_sugar.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    217            �           0    0 )   COLUMN treating_patient_blood_sugar.faq06    COMMENT     Z   COMMENT ON COLUMN "@base".treating_patient_blood_sugar.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    217            �           0    0 )   COLUMN treating_patient_blood_sugar.faq07    COMMENT     Z   COMMENT ON COLUMN "@base".treating_patient_blood_sugar.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    217            �            1259    26402    treating_patient_blood_sugar    TABLE     c   CREATE TABLE "1".treating_patient_blood_sugar (
)
INHERITS ("@base".treating_patient_blood_sugar);
 -   DROP TABLE "1".treating_patient_blood_sugar;
       1            postgres    false    217    17            �            1259    26410    treating_patient_cga7    TABLE     �  CREATE TABLE "@base".treating_patient_cga7 (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 *   DROP TABLE "@base".treating_patient_cga7;
       @base            postgres    false    14            �           0    0 "   COLUMN treating_patient_cga7.faq01    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_cga7.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    219            �           0    0 "   COLUMN treating_patient_cga7.faq02    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_cga7.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    219            �           0    0 "   COLUMN treating_patient_cga7.faq03    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_cga7.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    219            �           0    0 "   COLUMN treating_patient_cga7.faq04    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_cga7.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    219            �           0    0 "   COLUMN treating_patient_cga7.faq05    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_cga7.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    219            �           0    0 "   COLUMN treating_patient_cga7.faq06    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_cga7.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    219            �           0    0 "   COLUMN treating_patient_cga7.faq07    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_cga7.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    219            �            1259    26415    treating_patient_cga7    TABLE     U   CREATE TABLE "1".treating_patient_cga7 (
)
INHERITS ("@base".treating_patient_cga7);
 &   DROP TABLE "1".treating_patient_cga7;
       1            postgres    false    17    219            �            1259    26420     treating_patient_closure_sticker    TABLE     �  CREATE TABLE "@base".treating_patient_closure_sticker (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    faq08 integer,
    faq09 integer,
    faq10 integer,
    faq11 integer,
    faq12 integer,
    faq13 integer,
    faq14 integer,
    faq15 integer,
    faq16 integer,
    faq17 integer,
    faq18 integer,
    faq19 integer,
    faq20 integer,
    faq21 integer,
    faq22 integer,
    faq23 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 5   DROP TABLE "@base".treating_patient_closure_sticker;
       @base            postgres    false    14            �           0    0 -   COLUMN treating_patient_closure_sticker.faq01    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq02    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq03    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq04    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq05    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq06    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq07    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq08    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq08 IS 'radio:AR_Bool|ja:faq08';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq09    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq09 IS 'radio:AR_Bool|ja:faq09';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq10    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq10 IS 'radio:AR_Bool|ja:faq10';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq11    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq11 IS 'radio:AR_Bool|ja:faq11';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq12    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq12 IS 'radio:AR_Bool|ja:faq12';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq13    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq13 IS 'radio:AR_Bool|ja:faq13';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq14    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq14 IS 'radio:AR_Bool|ja:faq14';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq15    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq15 IS 'radio:AR_Bool|ja:faq15';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq16    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq16 IS 'radio:AR_Bool|ja:faq16';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq17    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq17 IS 'radio:AR_Bool|ja:faq17';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq18    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq18 IS 'radio:AR_Bool|ja:faq18';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq19    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq19 IS 'radio:AR_Bool|ja:faq19';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq20    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq20 IS 'radio:AR_Bool|ja:faq20';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq21    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq21 IS 'radio:AR_Bool|ja:faq21';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq22    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq22 IS 'radio:AR_Bool|ja:faq22';
          @base          postgres    false    221            �           0    0 -   COLUMN treating_patient_closure_sticker.faq23    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_closure_sticker.faq23 IS 'radio:AR_Bool|ja:faq23';
          @base          postgres    false    221            �            1259    26425     treating_patient_closure_sticker    TABLE     k   CREATE TABLE "1".treating_patient_closure_sticker (
)
INHERITS ("@base".treating_patient_closure_sticker);
 1   DROP TABLE "1".treating_patient_closure_sticker;
       1            postgres    false    17    221            �            1259    26430    treating_patient_comprehensive    TABLE     �  CREATE TABLE "@base".treating_patient_comprehensive (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 3   DROP TABLE "@base".treating_patient_comprehensive;
       @base            postgres    false    14            �           0    0 +   COLUMN treating_patient_comprehensive.faq01    COMMENT     \   COMMENT ON COLUMN "@base".treating_patient_comprehensive.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    223            �           0    0 +   COLUMN treating_patient_comprehensive.faq02    COMMENT     \   COMMENT ON COLUMN "@base".treating_patient_comprehensive.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    223            �           0    0 +   COLUMN treating_patient_comprehensive.faq03    COMMENT     \   COMMENT ON COLUMN "@base".treating_patient_comprehensive.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    223            �           0    0 +   COLUMN treating_patient_comprehensive.faq04    COMMENT     \   COMMENT ON COLUMN "@base".treating_patient_comprehensive.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    223            �           0    0 +   COLUMN treating_patient_comprehensive.faq05    COMMENT     \   COMMENT ON COLUMN "@base".treating_patient_comprehensive.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    223            �           0    0 +   COLUMN treating_patient_comprehensive.faq06    COMMENT     \   COMMENT ON COLUMN "@base".treating_patient_comprehensive.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    223            �           0    0 +   COLUMN treating_patient_comprehensive.faq07    COMMENT     \   COMMENT ON COLUMN "@base".treating_patient_comprehensive.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    223            �            1259    26435    treating_patient_comprehensive    TABLE     g   CREATE TABLE "1".treating_patient_comprehensive (
)
INHERITS ("@base".treating_patient_comprehensive);
 /   DROP TABLE "1".treating_patient_comprehensive;
       1            postgres    false    17    223            �            1259    26440    treating_patient_dbd    TABLE     ;  CREATE TABLE "@base".treating_patient_dbd (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    faq08 integer,
    faq09 integer,
    faq10 integer,
    faq11 integer,
    faq12 integer,
    faq13 integer,
    faq14 integer,
    faq15 integer,
    faq16 integer,
    faq17 integer,
    faq18 integer,
    faq19 integer,
    faq20 integer,
    faq21 integer,
    faq22 integer,
    faq23 integer,
    faq24 integer,
    faq25 integer,
    faq26 integer,
    faq27 integer,
    faq28 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 )   DROP TABLE "@base".treating_patient_dbd;
       @base            postgres    false    14            �           0    0 !   COLUMN treating_patient_dbd.faq01    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq02    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq03    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq04    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq05    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq06    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq07    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq08    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq08 IS 'radio:AR_Bool|ja:faq08';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq09    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq09 IS 'radio:AR_Bool|ja:faq09';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq10    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq10 IS 'radio:AR_Bool|ja:faq10';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq11    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq11 IS 'radio:AR_Bool|ja:faq11';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq12    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq12 IS 'radio:AR_Bool|ja:faq12';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq13    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq13 IS 'radio:AR_Bool|ja:faq13';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq14    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq14 IS 'radio:AR_Bool|ja:faq14';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq15    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq15 IS 'radio:AR_Bool|ja:faq15';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq16    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq16 IS 'radio:AR_Bool|ja:faq16';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq17    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq17 IS 'radio:AR_Bool|ja:faq17';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq18    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq18 IS 'radio:AR_Bool|ja:faq18';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq19    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq19 IS 'radio:AR_Bool|ja:faq19';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq20    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq20 IS 'radio:AR_Bool|ja:faq20';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq21    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq21 IS 'radio:AR_Bool|ja:faq21';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq22    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq22 IS 'radio:AR_Bool|ja:faq22';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq23    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq23 IS 'radio:AR_Bool|ja:faq23';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq24    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq24 IS 'radio:AR_Bool|ja:faq24';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq25    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq25 IS 'radio:AR_Bool|ja:faq25';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq26    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq26 IS 'radio:AR_Bool|ja:faq26';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq27    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq27 IS 'radio:AR_Bool|ja:faq27';
          @base          postgres    false    225            �           0    0 !   COLUMN treating_patient_dbd.faq28    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_dbd.faq28 IS 'radio:AR_Bool|ja:faq28';
          @base          postgres    false    225            �            1259    26445    treating_patient_dbd    TABLE     S   CREATE TABLE "1".treating_patient_dbd (
)
INHERITS ("@base".treating_patient_dbd);
 %   DROP TABLE "1".treating_patient_dbd;
       1            postgres    false    225    17            �            1259    26450    treating_patient_fra    TABLE     �  CREATE TABLE "@base".treating_patient_fra (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    faq08 integer,
    faq09 integer,
    faq10 integer,
    faq11 integer,
    faq12 integer,
    faq13 integer,
    faq14 integer,
    faq15 integer,
    faq16 integer,
    faq17 integer,
    faq18 integer,
    faq19 integer,
    faq20 integer,
    faq21 integer,
    faq22 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 )   DROP TABLE "@base".treating_patient_fra;
       @base            postgres    false    14                        0    0 !   COLUMN treating_patient_fra.faq01    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq02    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq03    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq04    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq05    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq06    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq07    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq08    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq08 IS 'radio:AR_Bool|ja:faq08';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq09    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq09 IS 'radio:AR_Bool|ja:faq09';
          @base          postgres    false    227            	           0    0 !   COLUMN treating_patient_fra.faq10    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq10 IS 'radio:AR_Bool|ja:faq10';
          @base          postgres    false    227            
           0    0 !   COLUMN treating_patient_fra.faq11    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq11 IS 'radio:AR_Bool|ja:faq11';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq12    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq12 IS 'radio:AR_Bool|ja:faq12';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq13    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq13 IS 'radio:AR_Bool|ja:faq13';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq14    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq14 IS 'radio:AR_Bool|ja:faq14';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq15    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq15 IS 'radio:AR_Bool|ja:faq15';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq16    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq16 IS 'radio:AR_Bool|ja:faq16';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq17    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq17 IS 'radio:AR_Bool|ja:faq17';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq18    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq18 IS 'radio:AR_Bool|ja:faq18';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq19    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq19 IS 'radio:AR_Bool|ja:faq19';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq20    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq20 IS 'radio:AR_Bool|ja:faq20';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq21    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq21 IS 'radio:AR_Bool|ja:faq21';
          @base          postgres    false    227                       0    0 !   COLUMN treating_patient_fra.faq22    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_fra.faq22 IS 'radio:AR_Bool|ja:faq22';
          @base          postgres    false    227            �            1259    26455    treating_patient_fra    TABLE     S   CREATE TABLE "1".treating_patient_fra (
)
INHERITS ("@base".treating_patient_fra);
 %   DROP TABLE "1".treating_patient_fra;
       1            postgres    false    227    17            �            1259    26460    treating_patient_fra_a    TABLE       CREATE TABLE "@base".treating_patient_fra_a (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    faq08 integer,
    faq09 integer,
    faq10 integer,
    faq11 integer,
    faq12 integer,
    faq13 integer,
    faq14 integer,
    faq15 integer,
    faq16 integer,
    faq17 integer,
    faq18 integer,
    faq19 integer,
    faq20 integer,
    faq21 integer,
    faq22 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer,
    faq23 integer,
    faq24 integer,
    faq25 integer
);
 +   DROP TABLE "@base".treating_patient_fra_a;
       @base            postgres    false    14                       0    0 #   COLUMN treating_patient_fra_a.faq01    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    229                       0    0 #   COLUMN treating_patient_fra_a.faq02    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    229                       0    0 #   COLUMN treating_patient_fra_a.faq03    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    229                       0    0 #   COLUMN treating_patient_fra_a.faq04    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    229                       0    0 #   COLUMN treating_patient_fra_a.faq05    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    229                       0    0 #   COLUMN treating_patient_fra_a.faq06    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    229                       0    0 #   COLUMN treating_patient_fra_a.faq07    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    229                       0    0 #   COLUMN treating_patient_fra_a.faq08    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq08 IS 'radio:AR_Bool|ja:faq08';
          @base          postgres    false    229                       0    0 #   COLUMN treating_patient_fra_a.faq09    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq09 IS 'radio:AR_Bool|ja:faq09';
          @base          postgres    false    229                       0    0 #   COLUMN treating_patient_fra_a.faq10    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq10 IS 'radio:AR_Bool|ja:faq10';
          @base          postgres    false    229                        0    0 #   COLUMN treating_patient_fra_a.faq11    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq11 IS 'radio:AR_Bool|ja:faq11';
          @base          postgres    false    229            !           0    0 #   COLUMN treating_patient_fra_a.faq12    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq12 IS 'radio:AR_Bool|ja:faq12';
          @base          postgres    false    229            "           0    0 #   COLUMN treating_patient_fra_a.faq13    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq13 IS 'radio:AR_Bool|ja:faq13';
          @base          postgres    false    229            #           0    0 #   COLUMN treating_patient_fra_a.faq14    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq14 IS 'radio:AR_Bool|ja:faq14';
          @base          postgres    false    229            $           0    0 #   COLUMN treating_patient_fra_a.faq15    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq15 IS 'radio:AR_Bool|ja:faq15';
          @base          postgres    false    229            %           0    0 #   COLUMN treating_patient_fra_a.faq16    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq16 IS 'radio:AR_Bool|ja:faq16';
          @base          postgres    false    229            &           0    0 #   COLUMN treating_patient_fra_a.faq17    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq17 IS 'radio:AR_Bool|ja:faq17';
          @base          postgres    false    229            '           0    0 #   COLUMN treating_patient_fra_a.faq18    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq18 IS 'radio:AR_Bool|ja:faq18';
          @base          postgres    false    229            (           0    0 #   COLUMN treating_patient_fra_a.faq19    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq19 IS 'radio:AR_Bool|ja:faq19';
          @base          postgres    false    229            )           0    0 #   COLUMN treating_patient_fra_a.faq20    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq20 IS 'radio:AR_Bool|ja:faq20';
          @base          postgres    false    229            *           0    0 #   COLUMN treating_patient_fra_a.faq21    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq21 IS 'radio:AR_Bool|ja:faq21';
          @base          postgres    false    229            +           0    0 #   COLUMN treating_patient_fra_a.faq22    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq22 IS 'radio:AR_Bool|ja:faq22';
          @base          postgres    false    229            ,           0    0 #   COLUMN treating_patient_fra_a.faq23    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq23 IS 'radio:AR_Bool|ja:faq23';
          @base          postgres    false    229            -           0    0 #   COLUMN treating_patient_fra_a.faq24    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq24 IS 'radio:AR_Bool|ja:faq24';
          @base          postgres    false    229            .           0    0 #   COLUMN treating_patient_fra_a.faq25    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_a.faq25 IS 'radio:AR_Bool|ja:faq25';
          @base          postgres    false    229            �            1259    26465    treating_patient_fra_a    TABLE     W   CREATE TABLE "1".treating_patient_fra_a (
)
INHERITS ("@base".treating_patient_fra_a);
 '   DROP TABLE "1".treating_patient_fra_a;
       1            postgres    false    17    229            �            1259    26470    treating_patient_fra_b    TABLE     �  CREATE TABLE "@base".treating_patient_fra_b (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 +   DROP TABLE "@base".treating_patient_fra_b;
       @base            postgres    false    14            /           0    0 #   COLUMN treating_patient_fra_b.faq01    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_b.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    231            0           0    0 #   COLUMN treating_patient_fra_b.faq02    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_b.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    231            1           0    0 #   COLUMN treating_patient_fra_b.faq03    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_b.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    231            2           0    0 #   COLUMN treating_patient_fra_b.faq04    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_b.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    231            3           0    0 #   COLUMN treating_patient_fra_b.faq05    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_fra_b.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    231            �            1259    26475    treating_patient_fra_b    TABLE     W   CREATE TABLE "1".treating_patient_fra_b (
)
INHERITS ("@base".treating_patient_fra_b);
 '   DROP TABLE "1".treating_patient_fra_b;
       1            postgres    false    17    231            �            1259    26480    treating_patient_gds15    TABLE     F  CREATE TABLE "@base".treating_patient_gds15 (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    faq08 integer,
    faq09 integer,
    faq10 integer,
    faq11 integer,
    faq12 integer,
    faq13 integer,
    faq14 integer,
    faq15 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 +   DROP TABLE "@base".treating_patient_gds15;
       @base            postgres    false    14            4           0    0 #   COLUMN treating_patient_gds15.faq01    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_gds15.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    233            5           0    0 #   COLUMN treating_patient_gds15.faq02    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_gds15.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    233            6           0    0 #   COLUMN treating_patient_gds15.faq03    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_gds15.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    233            7           0    0 #   COLUMN treating_patient_gds15.faq04    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_gds15.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    233            8           0    0 #   COLUMN treating_patient_gds15.faq05    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_gds15.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    233            9           0    0 #   COLUMN treating_patient_gds15.faq06    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_gds15.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    233            :           0    0 #   COLUMN treating_patient_gds15.faq07    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_gds15.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    233            ;           0    0 #   COLUMN treating_patient_gds15.faq08    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_gds15.faq08 IS 'radio:AR_Bool|ja:faq08';
          @base          postgres    false    233            <           0    0 #   COLUMN treating_patient_gds15.faq09    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_gds15.faq09 IS 'radio:AR_Bool|ja:faq09';
          @base          postgres    false    233            =           0    0 #   COLUMN treating_patient_gds15.faq10    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_gds15.faq10 IS 'radio:AR_Bool|ja:faq10';
          @base          postgres    false    233            >           0    0 #   COLUMN treating_patient_gds15.faq11    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_gds15.faq11 IS 'radio:AR_Bool|ja:faq11';
          @base          postgres    false    233            ?           0    0 #   COLUMN treating_patient_gds15.faq12    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_gds15.faq12 IS 'radio:AR_Bool|ja:faq12';
          @base          postgres    false    233            @           0    0 #   COLUMN treating_patient_gds15.faq13    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_gds15.faq13 IS 'radio:AR_Bool|ja:faq13';
          @base          postgres    false    233            A           0    0 #   COLUMN treating_patient_gds15.faq14    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_gds15.faq14 IS 'radio:AR_Bool|ja:faq14';
          @base          postgres    false    233            B           0    0 #   COLUMN treating_patient_gds15.faq15    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_gds15.faq15 IS 'radio:AR_Bool|ja:faq15';
          @base          postgres    false    233            �            1259    26485    treating_patient_gds15    TABLE     W   CREATE TABLE "1".treating_patient_gds15 (
)
INHERITS ("@base".treating_patient_gds15);
 '   DROP TABLE "1".treating_patient_gds15;
       1            postgres    false    17    233            �            1259    26490    treating_patient_hdsr    TABLE     A  CREATE TABLE "@base".treating_patient_hdsr (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    faq08 integer,
    faq09 integer,
    faq10 integer,
    faq11 integer,
    faq12 integer,
    faq13 integer,
    faq14 integer,
    memo text,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 *   DROP TABLE "@base".treating_patient_hdsr;
       @base            postgres    false    14            C           0    0 "   COLUMN treating_patient_hdsr.faq01    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_hdsr.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    235            D           0    0 "   COLUMN treating_patient_hdsr.faq02    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_hdsr.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    235            E           0    0 "   COLUMN treating_patient_hdsr.faq03    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_hdsr.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    235            F           0    0 "   COLUMN treating_patient_hdsr.faq04    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_hdsr.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    235            G           0    0 "   COLUMN treating_patient_hdsr.faq05    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_hdsr.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    235            H           0    0 "   COLUMN treating_patient_hdsr.faq06    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_hdsr.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    235            I           0    0 "   COLUMN treating_patient_hdsr.faq07    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_hdsr.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    235            J           0    0 "   COLUMN treating_patient_hdsr.faq08    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_hdsr.faq08 IS 'radio:AR_Bool|ja:faq08';
          @base          postgres    false    235            K           0    0 "   COLUMN treating_patient_hdsr.faq09    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_hdsr.faq09 IS 'radio:AR_Bool|ja:faq09';
          @base          postgres    false    235            L           0    0 "   COLUMN treating_patient_hdsr.faq10    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_hdsr.faq10 IS 'radio:AR_Bool|ja:faq10';
          @base          postgres    false    235            M           0    0 "   COLUMN treating_patient_hdsr.faq11    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_hdsr.faq11 IS 'radio:AR_Bool|ja:faq11';
          @base          postgres    false    235            N           0    0 "   COLUMN treating_patient_hdsr.faq12    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_hdsr.faq12 IS 'radio:AR_Bool|ja:faq12';
          @base          postgres    false    235            O           0    0 "   COLUMN treating_patient_hdsr.faq13    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_hdsr.faq13 IS 'radio:AR_Bool|ja:faq13';
          @base          postgres    false    235            P           0    0 "   COLUMN treating_patient_hdsr.faq14    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_hdsr.faq14 IS 'radio:AR_Bool|ja:faq14';
          @base          postgres    false    235            Q           0    0 !   COLUMN treating_patient_hdsr.memo    COMMENT     J   COMMENT ON COLUMN "@base".treating_patient_hdsr.memo IS 'text|ja:メモ';
          @base          postgres    false    235            �            1259    26498    treating_patient_hdsr    TABLE     U   CREATE TABLE "1".treating_patient_hdsr (
)
INHERITS ("@base".treating_patient_hdsr);
 &   DROP TABLE "1".treating_patient_hdsr;
       1            postgres    false    235    17            �            1259    26506    treating_patient_instrumental    TABLE     o  CREATE TABLE "@base".treating_patient_instrumental (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    faq08 integer,
    faq09 integer,
    faq10 integer,
    faq11 integer,
    faq12 integer,
    faq13 integer,
    faq14 integer,
    faq15 integer,
    faq16 integer,
    memo text,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 2   DROP TABLE "@base".treating_patient_instrumental;
       @base            postgres    false    14            R           0    0 *   COLUMN treating_patient_instrumental.faq01    COMMENT     [   COMMENT ON COLUMN "@base".treating_patient_instrumental.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    237            S           0    0 *   COLUMN treating_patient_instrumental.faq02    COMMENT     [   COMMENT ON COLUMN "@base".treating_patient_instrumental.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    237            T           0    0 *   COLUMN treating_patient_instrumental.faq03    COMMENT     [   COMMENT ON COLUMN "@base".treating_patient_instrumental.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    237            U           0    0 *   COLUMN treating_patient_instrumental.faq04    COMMENT     [   COMMENT ON COLUMN "@base".treating_patient_instrumental.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    237            V           0    0 *   COLUMN treating_patient_instrumental.faq05    COMMENT     [   COMMENT ON COLUMN "@base".treating_patient_instrumental.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    237            W           0    0 *   COLUMN treating_patient_instrumental.faq06    COMMENT     [   COMMENT ON COLUMN "@base".treating_patient_instrumental.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    237            X           0    0 *   COLUMN treating_patient_instrumental.faq07    COMMENT     [   COMMENT ON COLUMN "@base".treating_patient_instrumental.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    237            Y           0    0 *   COLUMN treating_patient_instrumental.faq08    COMMENT     [   COMMENT ON COLUMN "@base".treating_patient_instrumental.faq08 IS 'radio:AR_Bool|ja:faq08';
          @base          postgres    false    237            Z           0    0 *   COLUMN treating_patient_instrumental.faq09    COMMENT     [   COMMENT ON COLUMN "@base".treating_patient_instrumental.faq09 IS 'radio:AR_Bool|ja:faq09';
          @base          postgres    false    237            [           0    0 *   COLUMN treating_patient_instrumental.faq10    COMMENT     [   COMMENT ON COLUMN "@base".treating_patient_instrumental.faq10 IS 'radio:AR_Bool|ja:faq10';
          @base          postgres    false    237            \           0    0 *   COLUMN treating_patient_instrumental.faq11    COMMENT     [   COMMENT ON COLUMN "@base".treating_patient_instrumental.faq11 IS 'radio:AR_Bool|ja:faq11';
          @base          postgres    false    237            ]           0    0 *   COLUMN treating_patient_instrumental.faq12    COMMENT     [   COMMENT ON COLUMN "@base".treating_patient_instrumental.faq12 IS 'radio:AR_Bool|ja:faq12';
          @base          postgres    false    237            ^           0    0 *   COLUMN treating_patient_instrumental.faq13    COMMENT     [   COMMENT ON COLUMN "@base".treating_patient_instrumental.faq13 IS 'radio:AR_Bool|ja:faq13';
          @base          postgres    false    237            _           0    0 *   COLUMN treating_patient_instrumental.faq14    COMMENT     [   COMMENT ON COLUMN "@base".treating_patient_instrumental.faq14 IS 'radio:AR_Bool|ja:faq14';
          @base          postgres    false    237            `           0    0 *   COLUMN treating_patient_instrumental.faq15    COMMENT     [   COMMENT ON COLUMN "@base".treating_patient_instrumental.faq15 IS 'radio:AR_Bool|ja:faq15';
          @base          postgres    false    237            a           0    0 *   COLUMN treating_patient_instrumental.faq16    COMMENT     [   COMMENT ON COLUMN "@base".treating_patient_instrumental.faq16 IS 'radio:AR_Bool|ja:faq16';
          @base          postgres    false    237            b           0    0 )   COLUMN treating_patient_instrumental.memo    COMMENT     P   COMMENT ON COLUMN "@base".treating_patient_instrumental.memo IS 'text|ja:memo';
          @base          postgres    false    237            �            1259    26514    treating_patient_instrumental    TABLE     e   CREATE TABLE "1".treating_patient_instrumental (
)
INHERITS ("@base".treating_patient_instrumental);
 .   DROP TABLE "1".treating_patient_instrumental;
       1            postgres    false    17    237            �            1259    26522    treating_patient_mmse    TABLE     �  CREATE TABLE "@base".treating_patient_mmse (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    faq08 integer,
    faq09 integer,
    faq10 integer,
    faq11 integer,
    faq12 integer,
    faq13 integer,
    faq14 integer,
    faq15 integer,
    faq16 integer,
    faq17 integer,
    faq18 integer,
    faq19 integer,
    faq20 integer,
    faq21 integer,
    faq22 integer,
    memo text,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer,
    img12 text DEFAULT ''::text NOT NULL,
    img14 text DEFAULT ''::text NOT NULL,
    img12_out text DEFAULT ''::text NOT NULL,
    img14_out text DEFAULT ''::text NOT NULL
);
 *   DROP TABLE "@base".treating_patient_mmse;
       @base            postgres    false    14            c           0    0 "   COLUMN treating_patient_mmse.faq01    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    239            d           0    0 "   COLUMN treating_patient_mmse.faq02    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    239            e           0    0 "   COLUMN treating_patient_mmse.faq03    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    239            f           0    0 "   COLUMN treating_patient_mmse.faq04    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    239            g           0    0 "   COLUMN treating_patient_mmse.faq05    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    239            h           0    0 "   COLUMN treating_patient_mmse.faq06    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    239            i           0    0 "   COLUMN treating_patient_mmse.faq07    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    239            j           0    0 "   COLUMN treating_patient_mmse.faq08    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq08 IS 'radio:AR_Bool|ja:faq08';
          @base          postgres    false    239            k           0    0 "   COLUMN treating_patient_mmse.faq09    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq09 IS 'radio:AR_Bool|ja:faq09';
          @base          postgres    false    239            l           0    0 "   COLUMN treating_patient_mmse.faq10    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq10 IS 'radio:AR_Bool|ja:faq10';
          @base          postgres    false    239            m           0    0 "   COLUMN treating_patient_mmse.faq11    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq11 IS 'radio:AR_Bool|ja:faq11';
          @base          postgres    false    239            n           0    0 "   COLUMN treating_patient_mmse.faq12    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq12 IS 'radio:AR_Bool|ja:faq12';
          @base          postgres    false    239            o           0    0 "   COLUMN treating_patient_mmse.faq13    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq13 IS 'radio:AR_Bool|ja:faq13';
          @base          postgres    false    239            p           0    0 "   COLUMN treating_patient_mmse.faq14    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq14 IS 'radio:AR_Bool|ja:faq14';
          @base          postgres    false    239            q           0    0 "   COLUMN treating_patient_mmse.faq15    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq15 IS 'radio:AR_Bool|ja:faq15';
          @base          postgres    false    239            r           0    0 "   COLUMN treating_patient_mmse.faq16    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq16 IS 'radio:AR_Bool|ja:faq16';
          @base          postgres    false    239            s           0    0 "   COLUMN treating_patient_mmse.faq17    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq17 IS 'radio:AR_Bool|ja:faq17';
          @base          postgres    false    239            t           0    0 "   COLUMN treating_patient_mmse.faq18    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq18 IS 'radio:AR_Bool|ja:faq18';
          @base          postgres    false    239            u           0    0 "   COLUMN treating_patient_mmse.faq19    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq19 IS 'radio:AR_Bool|ja:faq19';
          @base          postgres    false    239            v           0    0 "   COLUMN treating_patient_mmse.faq20    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq20 IS 'radio:AR_Bool|ja:faq20';
          @base          postgres    false    239            w           0    0 "   COLUMN treating_patient_mmse.faq21    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq21 IS 'radio:AR_Bool|ja:faq21';
          @base          postgres    false    239            x           0    0 "   COLUMN treating_patient_mmse.faq22    COMMENT     S   COMMENT ON COLUMN "@base".treating_patient_mmse.faq22 IS 'radio:AR_Bool|ja:faq22';
          @base          postgres    false    239            y           0    0 !   COLUMN treating_patient_mmse.memo    COMMENT     J   COMMENT ON COLUMN "@base".treating_patient_mmse.memo IS 'text|ja:メモ';
          @base          postgres    false    239            �            1259    26530    treating_patient_mmse    TABLE     U   CREATE TABLE "1".treating_patient_mmse (
)
INHERITS ("@base".treating_patient_mmse);
 &   DROP TABLE "1".treating_patient_mmse;
       1            postgres    false    239    17            �            1259    26538    treating_patient_mna    TABLE     �  CREATE TABLE "@base".treating_patient_mna (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    faq08 integer,
    faq09 integer,
    faq10 integer,
    faq11 integer,
    faq12 integer,
    faq13 integer,
    faq14 integer,
    faq15 numeric(18,5),
    faq16 integer,
    faq17 integer,
    faq18 numeric(18,5),
    faq19 numeric(18,5),
    faq20 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 )   DROP TABLE "@base".treating_patient_mna;
       @base            postgres    false    14            z           0    0 !   COLUMN treating_patient_mna.faq01    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    241            {           0    0 !   COLUMN treating_patient_mna.faq02    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    241            |           0    0 !   COLUMN treating_patient_mna.faq03    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    241            }           0    0 !   COLUMN treating_patient_mna.faq04    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    241            ~           0    0 !   COLUMN treating_patient_mna.faq05    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    241                       0    0 !   COLUMN treating_patient_mna.faq06    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    241            �           0    0 !   COLUMN treating_patient_mna.faq07    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    241            �           0    0 !   COLUMN treating_patient_mna.faq08    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq08 IS 'radio:AR_Bool|ja:faq08';
          @base          postgres    false    241            �           0    0 !   COLUMN treating_patient_mna.faq09    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq09 IS 'radio:AR_Bool|ja:faq09';
          @base          postgres    false    241            �           0    0 !   COLUMN treating_patient_mna.faq10    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq10 IS 'radio:AR_Bool|ja:faq10';
          @base          postgres    false    241            �           0    0 !   COLUMN treating_patient_mna.faq11    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq11 IS 'radio:AR_Bool|ja:faq11';
          @base          postgres    false    241            �           0    0 !   COLUMN treating_patient_mna.faq12    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq12 IS 'radio:AR_Bool|ja:faq12';
          @base          postgres    false    241            �           0    0 !   COLUMN treating_patient_mna.faq13    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq13 IS 'radio:AR_Bool|ja:faq13';
          @base          postgres    false    241            �           0    0 !   COLUMN treating_patient_mna.faq14    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq14 IS 'radio:AR_Bool|ja:faq14';
          @base          postgres    false    241            �           0    0 !   COLUMN treating_patient_mna.faq15    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq15 IS 'radio:AR_Bool|ja:faq15';
          @base          postgres    false    241            �           0    0 !   COLUMN treating_patient_mna.faq16    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq16 IS 'radio:AR_Bool|ja:faq16';
          @base          postgres    false    241            �           0    0 !   COLUMN treating_patient_mna.faq17    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq17 IS 'radio:AR_Bool|ja:faq17';
          @base          postgres    false    241            �           0    0 !   COLUMN treating_patient_mna.faq18    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq18 IS 'radio:AR_Bool|ja:faq18';
          @base          postgres    false    241            �           0    0 !   COLUMN treating_patient_mna.faq19    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq19 IS 'radio:AR_Bool|ja:faq19';
          @base          postgres    false    241            �           0    0 !   COLUMN treating_patient_mna.faq20    COMMENT     R   COMMENT ON COLUMN "@base".treating_patient_mna.faq20 IS 'radio:AR_Bool|ja:faq20';
          @base          postgres    false    241            �            1259    26543    treating_patient_mna    TABLE     S   CREATE TABLE "1".treating_patient_mna (
)
INHERITS ("@base".treating_patient_mna);
 %   DROP TABLE "1".treating_patient_mna;
       1            postgres    false    241    17            �            1259    26548    treating_patient_qol_pgc    TABLE     n  CREATE TABLE "@base".treating_patient_qol_pgc (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    faq08 integer,
    faq09 integer,
    faq10 integer,
    faq11 integer,
    faq12 integer,
    faq13 integer,
    faq14 integer,
    faq15 integer,
    faq16 integer,
    faq17 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 -   DROP TABLE "@base".treating_patient_qol_pgc;
       @base            postgres    false    14            �           0    0 %   COLUMN treating_patient_qol_pgc.faq01    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    243            �           0    0 %   COLUMN treating_patient_qol_pgc.faq02    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    243            �           0    0 %   COLUMN treating_patient_qol_pgc.faq03    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    243            �           0    0 %   COLUMN treating_patient_qol_pgc.faq04    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    243            �           0    0 %   COLUMN treating_patient_qol_pgc.faq05    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    243            �           0    0 %   COLUMN treating_patient_qol_pgc.faq06    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    243            �           0    0 %   COLUMN treating_patient_qol_pgc.faq07    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    243            �           0    0 %   COLUMN treating_patient_qol_pgc.faq08    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq08 IS 'radio:AR_Bool|ja:faq08';
          @base          postgres    false    243            �           0    0 %   COLUMN treating_patient_qol_pgc.faq09    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq09 IS 'radio:AR_Bool|ja:faq09';
          @base          postgres    false    243            �           0    0 %   COLUMN treating_patient_qol_pgc.faq10    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq10 IS 'radio:AR_Bool|ja:faq10';
          @base          postgres    false    243            �           0    0 %   COLUMN treating_patient_qol_pgc.faq11    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq11 IS 'radio:AR_Bool|ja:faq11';
          @base          postgres    false    243            �           0    0 %   COLUMN treating_patient_qol_pgc.faq12    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq12 IS 'radio:AR_Bool|ja:faq12';
          @base          postgres    false    243            �           0    0 %   COLUMN treating_patient_qol_pgc.faq13    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq13 IS 'radio:AR_Bool|ja:faq13';
          @base          postgres    false    243            �           0    0 %   COLUMN treating_patient_qol_pgc.faq14    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq14 IS 'radio:AR_Bool|ja:faq14';
          @base          postgres    false    243            �           0    0 %   COLUMN treating_patient_qol_pgc.faq15    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq15 IS 'radio:AR_Bool|ja:faq15';
          @base          postgres    false    243            �           0    0 %   COLUMN treating_patient_qol_pgc.faq16    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq16 IS 'radio:AR_Bool|ja:faq16';
          @base          postgres    false    243            �           0    0 %   COLUMN treating_patient_qol_pgc.faq17    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_pgc.faq17 IS 'radio:AR_Bool|ja:faq17';
          @base          postgres    false    243            �            1259    26553    treating_patient_qol_pgc    TABLE     [   CREATE TABLE "1".treating_patient_qol_pgc (
)
INHERITS ("@base".treating_patient_qol_pgc);
 )   DROP TABLE "1".treating_patient_qol_pgc;
       1            postgres    false    243    17            �            1259    26558    treating_patient_qol_sf8    TABLE     �  CREATE TABLE "@base".treating_patient_qol_sf8 (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    faq08 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 -   DROP TABLE "@base".treating_patient_qol_sf8;
       @base            postgres    false    14            �           0    0 %   COLUMN treating_patient_qol_sf8.faq01    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_sf8.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    245            �           0    0 %   COLUMN treating_patient_qol_sf8.faq02    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_sf8.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    245            �           0    0 %   COLUMN treating_patient_qol_sf8.faq03    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_sf8.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    245            �           0    0 %   COLUMN treating_patient_qol_sf8.faq04    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_sf8.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    245            �           0    0 %   COLUMN treating_patient_qol_sf8.faq05    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_sf8.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    245            �           0    0 %   COLUMN treating_patient_qol_sf8.faq06    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_sf8.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    245            �           0    0 %   COLUMN treating_patient_qol_sf8.faq07    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_sf8.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    245            �           0    0 %   COLUMN treating_patient_qol_sf8.faq08    COMMENT     V   COMMENT ON COLUMN "@base".treating_patient_qol_sf8.faq08 IS 'radio:AR_Bool|ja:faq08';
          @base          postgres    false    245            �            1259    26563    treating_patient_qol_sf8    TABLE     [   CREATE TABLE "1".treating_patient_qol_sf8 (
)
INHERITS ("@base".treating_patient_qol_sf8);
 )   DROP TABLE "1".treating_patient_qol_sf8;
       1            postgres    false    17    245            �            1259    26568    treating_patient_sarcopenia    TABLE     �  CREATE TABLE "@base".treating_patient_sarcopenia (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 real,
    faq02 real,
    faq03 real,
    faq04 real,
    faq05 real,
    dxa real,
    bia real,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 0   DROP TABLE "@base".treating_patient_sarcopenia;
       @base            postgres    false    14            �           0    0 (   COLUMN treating_patient_sarcopenia.faq01    COMMENT     Y   COMMENT ON COLUMN "@base".treating_patient_sarcopenia.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    247            �           0    0 (   COLUMN treating_patient_sarcopenia.faq02    COMMENT     Y   COMMENT ON COLUMN "@base".treating_patient_sarcopenia.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    247            �           0    0 (   COLUMN treating_patient_sarcopenia.faq03    COMMENT     Y   COMMENT ON COLUMN "@base".treating_patient_sarcopenia.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    247            �           0    0 (   COLUMN treating_patient_sarcopenia.faq04    COMMENT     Y   COMMENT ON COLUMN "@base".treating_patient_sarcopenia.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    247            �           0    0 (   COLUMN treating_patient_sarcopenia.faq05    COMMENT     Y   COMMENT ON COLUMN "@base".treating_patient_sarcopenia.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    247            �           0    0 &   COLUMN treating_patient_sarcopenia.dxa    COMMENT     L   COMMENT ON COLUMN "@base".treating_patient_sarcopenia.dxa IS 'text|ja:dxa';
          @base          postgres    false    247            �           0    0 &   COLUMN treating_patient_sarcopenia.bia    COMMENT     L   COMMENT ON COLUMN "@base".treating_patient_sarcopenia.bia IS 'text|ja:bia';
          @base          postgres    false    247            �            1259    26573    treating_patient_sarcopenia    TABLE     a   CREATE TABLE "1".treating_patient_sarcopenia (
)
INHERITS ("@base".treating_patient_sarcopenia);
 ,   DROP TABLE "1".treating_patient_sarcopenia;
       1            postgres    false    247    17            �            1259    26578     treating_patient_sarcopenia_loco    TABLE     �  CREATE TABLE "@base".treating_patient_sarcopenia_loco (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 5   DROP TABLE "@base".treating_patient_sarcopenia_loco;
       @base            postgres    false    14            �           0    0 -   COLUMN treating_patient_sarcopenia_loco.faq01    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_sarcopenia_loco.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    249            �           0    0 -   COLUMN treating_patient_sarcopenia_loco.faq02    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_sarcopenia_loco.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    249            �           0    0 -   COLUMN treating_patient_sarcopenia_loco.faq03    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_sarcopenia_loco.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    249            �           0    0 -   COLUMN treating_patient_sarcopenia_loco.faq04    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_sarcopenia_loco.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    249            �           0    0 -   COLUMN treating_patient_sarcopenia_loco.faq05    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_sarcopenia_loco.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    249            �           0    0 -   COLUMN treating_patient_sarcopenia_loco.faq06    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_sarcopenia_loco.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    249            �           0    0 -   COLUMN treating_patient_sarcopenia_loco.faq07    COMMENT     ^   COMMENT ON COLUMN "@base".treating_patient_sarcopenia_loco.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    249            �            1259    26583     treating_patient_sarcopenia_loco    TABLE     k   CREATE TABLE "1".treating_patient_sarcopenia_loco (
)
INHERITS ("@base".treating_patient_sarcopenia_loco);
 1   DROP TABLE "1".treating_patient_sarcopenia_loco;
       1            postgres    false    17    249                       1259    72203    treating_patient_senior    TABLE     >  CREATE TABLE "@base".treating_patient_senior (
    id integer NOT NULL,
    service_id integer NOT NULL,
    treating_patient_id integer NOT NULL,
    healt_condition_01 integer NOT NULL,
    mental_help_01 integer NOT NULL,
    eating_habit_01 integer NOT NULL,
    oral_01 integer NOT NULL,
    oral_02 integer NOT NULL,
    weight_01 integer NOT NULL,
    execise_01 integer NOT NULL,
    execise_02 integer NOT NULL,
    execise_03 integer NOT NULL,
    cognitive_01 integer NOT NULL,
    cognitive_02 integer NOT NULL,
    smoking_01 integer NOT NULL,
    social_01 integer NOT NULL,
    social_02 integer NOT NULL,
    social_support_01 integer NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 ,   DROP TABLE "@base".treating_patient_senior;
       @base            postgres    false    14                       1259    72221    treating_patient_senion    TABLE     Y   CREATE TABLE "1".treating_patient_senion (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "1".treating_patient_senion;
       1            postgres    false    525    17            !           1259    72335    treating_patient_senior    TABLE     Y   CREATE TABLE "1".treating_patient_senior (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "1".treating_patient_senior;
       1            postgres    false    525    17            �            1259    26588    treating_patient_vitality    TABLE     �  CREATE TABLE "@base".treating_patient_vitality (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 .   DROP TABLE "@base".treating_patient_vitality;
       @base            postgres    false    14            �           0    0 &   COLUMN treating_patient_vitality.faq01    COMMENT     W   COMMENT ON COLUMN "@base".treating_patient_vitality.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    251            �           0    0 &   COLUMN treating_patient_vitality.faq02    COMMENT     W   COMMENT ON COLUMN "@base".treating_patient_vitality.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    251            �           0    0 &   COLUMN treating_patient_vitality.faq03    COMMENT     W   COMMENT ON COLUMN "@base".treating_patient_vitality.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    251            �           0    0 &   COLUMN treating_patient_vitality.faq04    COMMENT     W   COMMENT ON COLUMN "@base".treating_patient_vitality.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    251            �           0    0 &   COLUMN treating_patient_vitality.faq05    COMMENT     W   COMMENT ON COLUMN "@base".treating_patient_vitality.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    251            �            1259    26593    treating_patient_vitality    TABLE     ]   CREATE TABLE "1".treating_patient_vitality (
)
INHERITS ("@base".treating_patient_vitality);
 *   DROP TABLE "1".treating_patient_vitality;
       1            postgres    false    251    17            �            1259    26598    treating_patient_zarit    TABLE     �  CREATE TABLE "@base".treating_patient_zarit (
    id integer NOT NULL,
    service_id integer,
    treating_patient_id integer,
    faq01 integer,
    faq02 integer,
    faq03 integer,
    faq04 integer,
    faq05 integer,
    faq06 integer,
    faq07 integer,
    faq08 integer,
    faq09 integer,
    faq10 integer,
    faq11 integer,
    faq12 integer,
    faq13 integer,
    faq14 integer,
    faq15 integer,
    faq16 integer,
    faq17 integer,
    faq18 integer,
    faq19 integer,
    faq20 integer,
    faq21 integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 +   DROP TABLE "@base".treating_patient_zarit;
       @base            postgres    false    14            �           0    0 #   COLUMN treating_patient_zarit.faq01    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq01 IS 'radio:AR_Bool|ja:faq01';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq02    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq02 IS 'radio:AR_Bool|ja:faq02';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq03    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq03 IS 'radio:AR_Bool|ja:faq03';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq04    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq04 IS 'radio:AR_Bool|ja:faq04';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq05    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq05 IS 'radio:AR_Bool|ja:faq05';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq06    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq06 IS 'radio:AR_Bool|ja:faq06';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq07    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq07 IS 'radio:AR_Bool|ja:faq07';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq08    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq08 IS 'radio:AR_Bool|ja:faq08';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq09    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq09 IS 'radio:AR_Bool|ja:faq09';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq10    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq10 IS 'radio:AR_Bool|ja:faq10';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq11    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq11 IS 'radio:AR_Bool|ja:faq11';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq12    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq12 IS 'radio:AR_Bool|ja:faq12';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq13    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq13 IS 'radio:AR_Bool|ja:faq13';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq14    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq14 IS 'radio:AR_Bool|ja:faq14';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq15    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq15 IS 'radio:AR_Bool|ja:faq15';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq16    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq16 IS 'radio:AR_Bool|ja:faq16';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq17    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq17 IS 'radio:AR_Bool|ja:faq17';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq18    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq18 IS 'radio:AR_Bool|ja:faq18';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq19    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq19 IS 'radio:AR_Bool|ja:faq19';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq20    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq20 IS 'radio:AR_Bool|ja:faq20';
          @base          postgres    false    253            �           0    0 #   COLUMN treating_patient_zarit.faq21    COMMENT     T   COMMENT ON COLUMN "@base".treating_patient_zarit.faq21 IS 'radio:AR_Bool|ja:faq21';
          @base          postgres    false    253            �            1259    26603    treating_patient_zarit    TABLE     W   CREATE TABLE "1".treating_patient_zarit (
)
INHERITS ("@base".treating_patient_zarit);
 '   DROP TABLE "1".treating_patient_zarit;
       1            postgres    false    17    253            �            1259    26608    treating_patients    TABLE     �  CREATE TABLE "@base".treating_patients (
    id integer NOT NULL,
    service_id integer,
    area_id integer,
    patient_id integer,
    check_date date,
    cm real,
    kg real,
    support integer,
    bmi real,
    age integer,
    status integer,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer
);
 &   DROP TABLE "@base".treating_patients;
       @base            postgres    false    14            �           0    0 #   COLUMN treating_patients.check_date    COMMENT     O   COMMENT ON COLUMN "@base".treating_patients.check_date IS 'date|ja:登録日';
          @base          postgres    false    255            �           0    0    COLUMN treating_patients.cm    COMMENT     D   COMMENT ON COLUMN "@base".treating_patients.cm IS 'text|ja:身長';
          @base          postgres    false    255            �           0    0    COLUMN treating_patients.kg    COMMENT     D   COMMENT ON COLUMN "@base".treating_patients.kg IS 'text|ja:体重';
          @base          postgres    false    255            �           0    0     COLUMN treating_patients.support    COMMENT     p   COMMENT ON COLUMN "@base".treating_patients.support IS 'dropdown:AR_Support|ja:要支援・要介護・死亡';
          @base          postgres    false    255                        1259    26613    treating_patients    TABLE     M   CREATE TABLE "1".treating_patients (
)
INHERITS ("@base".treating_patients);
 "   DROP TABLE "1".treating_patients;
       1            postgres    false    255    17                       1259    26618    users    TABLE       CREATE TABLE "@base".users (
    id integer NOT NULL,
    service_id integer,
    center_id integer,
    user_name text,
    user_name_kana text,
    username text NOT NULL,
    password text NOT NULL,
    user_right integer,
    csv_use integer,
    login_uuid text,
    last_login_time timestamp without time zone,
    last_ng_time timestamp without time zone,
    ng_count integer,
    acc_lock boolean,
    is_super_admin boolean DEFAULT false,
    status boolean,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer,
    CONSTRAINT users_password_check CHECK ((password <> ''::text)),
    CONSTRAINT users_username_check CHECK ((username <> ''::text))
);
    DROP TABLE "@base".users;
       @base            postgres    false    14            �           0    0    COLUMN users.user_name    COMMENT     F   COMMENT ON COLUMN "@base".users.user_name IS 'text|search|ja:氏名';
          @base          postgres    false    257            �           0    0    COLUMN users.user_name_kana    COMMENT     V   COMMENT ON COLUMN "@base".users.user_name_kana IS 'text|ja:氏名（ふりがな）';
          @base          postgres    false    257            �           0    0    COLUMN users.username    COMMENT     S   COMMENT ON COLUMN "@base".users.username IS 'text|search|ja:利用者ＩＤ|sort';
          @base          postgres    false    257            �           0    0    COLUMN users.password    COMMENT     G   COMMENT ON COLUMN "@base".users.password IS 'text|ja:パスワード';
          @base          postgres    false    257            �           0    0    COLUMN users.user_right    COMMENT     P   COMMENT ON COLUMN "@base".users.user_right IS 'select:AR_User_Right|ja:区分';
          @base          postgres    false    257            �           0    0    COLUMN users.csv_use    COMMENT     T   COMMENT ON COLUMN "@base".users.csv_use IS 'select:AR_Csv_use|search|ja:CSV出力';
          @base          postgres    false    257                       1259    26629    users    TABLE     5   CREATE TABLE "1".users (
)
INHERITS ("@base".users);
    DROP TABLE "1".users;
       1            postgres    false    17    257            �           1259    50522    areas    TABLE     6   CREATE TABLE "10".areas (
)
INHERITS ("@base".areas);
    DROP TABLE "10".areas;
       10            postgres    false    12    207            �           1259    50512    centers    TABLE     :   CREATE TABLE "10".centers (
)
INHERITS ("@base".centers);
    DROP TABLE "10".centers;
       10            postgres    false    12    209            
           1259    50622    patients    TABLE     <   CREATE TABLE "10".patients (
)
INHERITS ("@base".patients);
    DROP TABLE "10".patients;
       10            postgres    false    12    211            	           1259    50616    treating_patient_adl    TABLE     T   CREATE TABLE "10".treating_patient_adl (
)
INHERITS ("@base".treating_patient_adl);
 &   DROP TABLE "10".treating_patient_adl;
       10            postgres    false    12    213                       1259    50610    treating_patient_basic_adl    TABLE     `   CREATE TABLE "10".treating_patient_basic_adl (
)
INHERITS ("@base".treating_patient_basic_adl);
 ,   DROP TABLE "10".treating_patient_basic_adl;
       10            postgres    false    12    215                       1259    50632    treating_patient_blood_sugar    TABLE     d   CREATE TABLE "10".treating_patient_blood_sugar (
)
INHERITS ("@base".treating_patient_blood_sugar);
 .   DROP TABLE "10".treating_patient_blood_sugar;
       10            postgres    false    12    217                       1259    50604    treating_patient_cga7    TABLE     V   CREATE TABLE "10".treating_patient_cga7 (
)
INHERITS ("@base".treating_patient_cga7);
 '   DROP TABLE "10".treating_patient_cga7;
       10            postgres    false    12    219                       1259    50598     treating_patient_closure_sticker    TABLE     l   CREATE TABLE "10".treating_patient_closure_sticker (
)
INHERITS ("@base".treating_patient_closure_sticker);
 2   DROP TABLE "10".treating_patient_closure_sticker;
       10            postgres    false    12    221                       1259    50592    treating_patient_comprehensive    TABLE     h   CREATE TABLE "10".treating_patient_comprehensive (
)
INHERITS ("@base".treating_patient_comprehensive);
 0   DROP TABLE "10".treating_patient_comprehensive;
       10            postgres    false    223    12                       1259    50586    treating_patient_dbd    TABLE     T   CREATE TABLE "10".treating_patient_dbd (
)
INHERITS ("@base".treating_patient_dbd);
 &   DROP TABLE "10".treating_patient_dbd;
       10            postgres    false    225    12                       1259    50580    treating_patient_fra    TABLE     T   CREATE TABLE "10".treating_patient_fra (
)
INHERITS ("@base".treating_patient_fra);
 &   DROP TABLE "10".treating_patient_fra;
       10            postgres    false    227    12                       1259    50574    treating_patient_fra_a    TABLE     X   CREATE TABLE "10".treating_patient_fra_a (
)
INHERITS ("@base".treating_patient_fra_a);
 (   DROP TABLE "10".treating_patient_fra_a;
       10            postgres    false    229    12                       1259    50568    treating_patient_fra_b    TABLE     X   CREATE TABLE "10".treating_patient_fra_b (
)
INHERITS ("@base".treating_patient_fra_b);
 (   DROP TABLE "10".treating_patient_fra_b;
       10            postgres    false    231    12            �           1259    50506    treating_patient_gds15    TABLE     X   CREATE TABLE "10".treating_patient_gds15 (
)
INHERITS ("@base".treating_patient_gds15);
 (   DROP TABLE "10".treating_patient_gds15;
       10            postgres    false    12    233            �           1259    50497    treating_patient_hdsr    TABLE     V   CREATE TABLE "10".treating_patient_hdsr (
)
INHERITS ("@base".treating_patient_hdsr);
 '   DROP TABLE "10".treating_patient_hdsr;
       10            postgres    false    12    235            �           1259    50488    treating_patient_instrumental    TABLE     f   CREATE TABLE "10".treating_patient_instrumental (
)
INHERITS ("@base".treating_patient_instrumental);
 /   DROP TABLE "10".treating_patient_instrumental;
       10            postgres    false    12    237            �           1259    50451    treating_patient_mmse    TABLE     V   CREATE TABLE "10".treating_patient_mmse (
)
INHERITS ("@base".treating_patient_mmse);
 '   DROP TABLE "10".treating_patient_mmse;
       10            postgres    false    12    239            �           1259    50476    treating_patient_mna    TABLE     T   CREATE TABLE "10".treating_patient_mna (
)
INHERITS ("@base".treating_patient_mna);
 &   DROP TABLE "10".treating_patient_mna;
       10            postgres    false    12    241                        1259    50562    treating_patient_qol_pgc    TABLE     \   CREATE TABLE "10".treating_patient_qol_pgc (
)
INHERITS ("@base".treating_patient_qol_pgc);
 *   DROP TABLE "10".treating_patient_qol_pgc;
       10            postgres    false    12    243            �           1259    50556    treating_patient_qol_sf8    TABLE     \   CREATE TABLE "10".treating_patient_qol_sf8 (
)
INHERITS ("@base".treating_patient_qol_sf8);
 *   DROP TABLE "10".treating_patient_qol_sf8;
       10            postgres    false    12    245            �           1259    50550    treating_patient_sarcopenia    TABLE     b   CREATE TABLE "10".treating_patient_sarcopenia (
)
INHERITS ("@base".treating_patient_sarcopenia);
 -   DROP TABLE "10".treating_patient_sarcopenia;
       10            postgres    false    247    12            �           1259    50544     treating_patient_sarcopenia_loco    TABLE     l   CREATE TABLE "10".treating_patient_sarcopenia_loco (
)
INHERITS ("@base".treating_patient_sarcopenia_loco);
 2   DROP TABLE "10".treating_patient_sarcopenia_loco;
       10            postgres    false    249    12                       1259    72275    treating_patient_senion    TABLE     Z   CREATE TABLE "10".treating_patient_senion (
)
INHERITS ("@base".treating_patient_senior);
 )   DROP TABLE "10".treating_patient_senion;
       10            postgres    false    525    12                       1259    72281    treating_patient_senior    TABLE     Z   CREATE TABLE "10".treating_patient_senior (
)
INHERITS ("@base".treating_patient_senior);
 )   DROP TABLE "10".treating_patient_senior;
       10            postgres    false    12    525            �           1259    50538    treating_patient_vitality    TABLE     ^   CREATE TABLE "10".treating_patient_vitality (
)
INHERITS ("@base".treating_patient_vitality);
 +   DROP TABLE "10".treating_patient_vitality;
       10            postgres    false    12    251            �           1259    50532    treating_patient_zarit    TABLE     X   CREATE TABLE "10".treating_patient_zarit (
)
INHERITS ("@base".treating_patient_zarit);
 (   DROP TABLE "10".treating_patient_zarit;
       10            postgres    false    12    253            �           1259    50482    treating_patients    TABLE     N   CREATE TABLE "10".treating_patients (
)
INHERITS ("@base".treating_patients);
 #   DROP TABLE "10".treating_patients;
       10            postgres    false    255    12            �           1259    50464    users    TABLE     6   CREATE TABLE "10".users (
)
INHERITS ("@base".users);
    DROP TABLE "10".users;
       10            postgres    false    257    12                       1259    26640    areas    TABLE     5   CREATE TABLE "2".areas (
)
INHERITS ("@base".areas);
    DROP TABLE "2".areas;
       2            postgres    false    207    15                       1259    26649    centers    TABLE     9   CREATE TABLE "2".centers (
)
INHERITS ("@base".centers);
    DROP TABLE "2".centers;
       2            postgres    false    209    15                       1259    26658    patients    TABLE     ;   CREATE TABLE "2".patients (
)
INHERITS ("@base".patients);
    DROP TABLE "2".patients;
       2            postgres    false    211    15                       1259    26667    treating_patient_adl    TABLE     S   CREATE TABLE "2".treating_patient_adl (
)
INHERITS ("@base".treating_patient_adl);
 %   DROP TABLE "2".treating_patient_adl;
       2            postgres    false    15    213                       1259    26672    treating_patient_basic_adl    TABLE     _   CREATE TABLE "2".treating_patient_basic_adl (
)
INHERITS ("@base".treating_patient_basic_adl);
 +   DROP TABLE "2".treating_patient_basic_adl;
       2            postgres    false    15    215                       1259    26677    treating_patient_blood_sugar    TABLE     c   CREATE TABLE "2".treating_patient_blood_sugar (
)
INHERITS ("@base".treating_patient_blood_sugar);
 -   DROP TABLE "2".treating_patient_blood_sugar;
       2            postgres    false    217    15            	           1259    26685    treating_patient_cga7    TABLE     U   CREATE TABLE "2".treating_patient_cga7 (
)
INHERITS ("@base".treating_patient_cga7);
 &   DROP TABLE "2".treating_patient_cga7;
       2            postgres    false    219    15            
           1259    26690     treating_patient_closure_sticker    TABLE     k   CREATE TABLE "2".treating_patient_closure_sticker (
)
INHERITS ("@base".treating_patient_closure_sticker);
 1   DROP TABLE "2".treating_patient_closure_sticker;
       2            postgres    false    221    15                       1259    26695    treating_patient_comprehensive    TABLE     g   CREATE TABLE "2".treating_patient_comprehensive (
)
INHERITS ("@base".treating_patient_comprehensive);
 /   DROP TABLE "2".treating_patient_comprehensive;
       2            postgres    false    15    223                       1259    26700    treating_patient_dbd    TABLE     S   CREATE TABLE "2".treating_patient_dbd (
)
INHERITS ("@base".treating_patient_dbd);
 %   DROP TABLE "2".treating_patient_dbd;
       2            postgres    false    15    225                       1259    26705    treating_patient_fra    TABLE     S   CREATE TABLE "2".treating_patient_fra (
)
INHERITS ("@base".treating_patient_fra);
 %   DROP TABLE "2".treating_patient_fra;
       2            postgres    false    15    227                       1259    26710    treating_patient_fra_a    TABLE     W   CREATE TABLE "2".treating_patient_fra_a (
)
INHERITS ("@base".treating_patient_fra_a);
 '   DROP TABLE "2".treating_patient_fra_a;
       2            postgres    false    15    229                       1259    26715    treating_patient_fra_b    TABLE     W   CREATE TABLE "2".treating_patient_fra_b (
)
INHERITS ("@base".treating_patient_fra_b);
 '   DROP TABLE "2".treating_patient_fra_b;
       2            postgres    false    231    15                       1259    26720    treating_patient_gds15    TABLE     W   CREATE TABLE "2".treating_patient_gds15 (
)
INHERITS ("@base".treating_patient_gds15);
 '   DROP TABLE "2".treating_patient_gds15;
       2            postgres    false    15    233                       1259    26725    treating_patient_hdsr    TABLE     U   CREATE TABLE "2".treating_patient_hdsr (
)
INHERITS ("@base".treating_patient_hdsr);
 &   DROP TABLE "2".treating_patient_hdsr;
       2            postgres    false    15    235                       1259    26733    treating_patient_instrumental    TABLE     e   CREATE TABLE "2".treating_patient_instrumental (
)
INHERITS ("@base".treating_patient_instrumental);
 .   DROP TABLE "2".treating_patient_instrumental;
       2            postgres    false    237    15                       1259    26741    treating_patient_mmse    TABLE     U   CREATE TABLE "2".treating_patient_mmse (
)
INHERITS ("@base".treating_patient_mmse);
 &   DROP TABLE "2".treating_patient_mmse;
       2            postgres    false    239    15                       1259    26749    treating_patient_mna    TABLE     S   CREATE TABLE "2".treating_patient_mna (
)
INHERITS ("@base".treating_patient_mna);
 %   DROP TABLE "2".treating_patient_mna;
       2            postgres    false    241    15                       1259    26754    treating_patient_qol_pgc    TABLE     [   CREATE TABLE "2".treating_patient_qol_pgc (
)
INHERITS ("@base".treating_patient_qol_pgc);
 )   DROP TABLE "2".treating_patient_qol_pgc;
       2            postgres    false    15    243                       1259    26759    treating_patient_qol_sf8    TABLE     [   CREATE TABLE "2".treating_patient_qol_sf8 (
)
INHERITS ("@base".treating_patient_qol_sf8);
 )   DROP TABLE "2".treating_patient_qol_sf8;
       2            postgres    false    15    245                       1259    26764    treating_patient_sarcopenia    TABLE     a   CREATE TABLE "2".treating_patient_sarcopenia (
)
INHERITS ("@base".treating_patient_sarcopenia);
 ,   DROP TABLE "2".treating_patient_sarcopenia;
       2            postgres    false    15    247                       1259    26769     treating_patient_sarcopenia_loco    TABLE     k   CREATE TABLE "2".treating_patient_sarcopenia_loco (
)
INHERITS ("@base".treating_patient_sarcopenia_loco);
 1   DROP TABLE "2".treating_patient_sarcopenia_loco;
       2            postgres    false    15    249                       1259    72227    treating_patient_senion    TABLE     Y   CREATE TABLE "2".treating_patient_senion (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "2".treating_patient_senion;
       2            postgres    false    15    525                        1259    72329    treating_patient_senior    TABLE     Y   CREATE TABLE "2".treating_patient_senior (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "2".treating_patient_senior;
       2            postgres    false    525    15                       1259    26774    treating_patient_vitality    TABLE     ]   CREATE TABLE "2".treating_patient_vitality (
)
INHERITS ("@base".treating_patient_vitality);
 *   DROP TABLE "2".treating_patient_vitality;
       2            postgres    false    251    15                       1259    26779    treating_patient_zarit    TABLE     W   CREATE TABLE "2".treating_patient_zarit (
)
INHERITS ("@base".treating_patient_zarit);
 '   DROP TABLE "2".treating_patient_zarit;
       2            postgres    false    15    253                       1259    26784    treating_patients    TABLE     M   CREATE TABLE "2".treating_patients (
)
INHERITS ("@base".treating_patients);
 "   DROP TABLE "2".treating_patients;
       2            postgres    false    255    15                       1259    26789    users    TABLE     5   CREATE TABLE "2".users (
)
INHERITS ("@base".users);
    DROP TABLE "2".users;
       2            postgres    false    15    257                       1259    26800    areas    TABLE     5   CREATE TABLE "3".areas (
)
INHERITS ("@base".areas);
    DROP TABLE "3".areas;
       3            postgres    false    5    207                       1259    26809    centers    TABLE     9   CREATE TABLE "3".centers (
)
INHERITS ("@base".centers);
    DROP TABLE "3".centers;
       3            postgres    false    5    209                       1259    26818    patients    TABLE     ;   CREATE TABLE "3".patients (
)
INHERITS ("@base".patients);
    DROP TABLE "3".patients;
       3            postgres    false    211    5                        1259    26827    treating_patient_adl    TABLE     S   CREATE TABLE "3".treating_patient_adl (
)
INHERITS ("@base".treating_patient_adl);
 %   DROP TABLE "3".treating_patient_adl;
       3            postgres    false    213    5            !           1259    26832    treating_patient_basic_adl    TABLE     _   CREATE TABLE "3".treating_patient_basic_adl (
)
INHERITS ("@base".treating_patient_basic_adl);
 +   DROP TABLE "3".treating_patient_basic_adl;
       3            postgres    false    5    215            "           1259    26837    treating_patient_blood_sugar    TABLE     c   CREATE TABLE "3".treating_patient_blood_sugar (
)
INHERITS ("@base".treating_patient_blood_sugar);
 -   DROP TABLE "3".treating_patient_blood_sugar;
       3            postgres    false    5    217            #           1259    26845    treating_patient_cga7    TABLE     U   CREATE TABLE "3".treating_patient_cga7 (
)
INHERITS ("@base".treating_patient_cga7);
 &   DROP TABLE "3".treating_patient_cga7;
       3            postgres    false    219    5            $           1259    26850     treating_patient_closure_sticker    TABLE     k   CREATE TABLE "3".treating_patient_closure_sticker (
)
INHERITS ("@base".treating_patient_closure_sticker);
 1   DROP TABLE "3".treating_patient_closure_sticker;
       3            postgres    false    5    221            %           1259    26855    treating_patient_comprehensive    TABLE     g   CREATE TABLE "3".treating_patient_comprehensive (
)
INHERITS ("@base".treating_patient_comprehensive);
 /   DROP TABLE "3".treating_patient_comprehensive;
       3            postgres    false    223    5            &           1259    26860    treating_patient_dbd    TABLE     S   CREATE TABLE "3".treating_patient_dbd (
)
INHERITS ("@base".treating_patient_dbd);
 %   DROP TABLE "3".treating_patient_dbd;
       3            postgres    false    5    225            '           1259    26865    treating_patient_fra    TABLE     S   CREATE TABLE "3".treating_patient_fra (
)
INHERITS ("@base".treating_patient_fra);
 %   DROP TABLE "3".treating_patient_fra;
       3            postgres    false    227    5            (           1259    26870    treating_patient_fra_a    TABLE     W   CREATE TABLE "3".treating_patient_fra_a (
)
INHERITS ("@base".treating_patient_fra_a);
 '   DROP TABLE "3".treating_patient_fra_a;
       3            postgres    false    5    229            )           1259    26875    treating_patient_fra_b    TABLE     W   CREATE TABLE "3".treating_patient_fra_b (
)
INHERITS ("@base".treating_patient_fra_b);
 '   DROP TABLE "3".treating_patient_fra_b;
       3            postgres    false    231    5            *           1259    26880    treating_patient_gds15    TABLE     W   CREATE TABLE "3".treating_patient_gds15 (
)
INHERITS ("@base".treating_patient_gds15);
 '   DROP TABLE "3".treating_patient_gds15;
       3            postgres    false    5    233            +           1259    26885    treating_patient_hdsr    TABLE     U   CREATE TABLE "3".treating_patient_hdsr (
)
INHERITS ("@base".treating_patient_hdsr);
 &   DROP TABLE "3".treating_patient_hdsr;
       3            postgres    false    5    235            ,           1259    26893    treating_patient_instrumental    TABLE     e   CREATE TABLE "3".treating_patient_instrumental (
)
INHERITS ("@base".treating_patient_instrumental);
 .   DROP TABLE "3".treating_patient_instrumental;
       3            postgres    false    237    5            -           1259    26901    treating_patient_mmse    TABLE     U   CREATE TABLE "3".treating_patient_mmse (
)
INHERITS ("@base".treating_patient_mmse);
 &   DROP TABLE "3".treating_patient_mmse;
       3            postgres    false    5    239            .           1259    26909    treating_patient_mna    TABLE     S   CREATE TABLE "3".treating_patient_mna (
)
INHERITS ("@base".treating_patient_mna);
 %   DROP TABLE "3".treating_patient_mna;
       3            postgres    false    241    5            /           1259    26914    treating_patient_qol_pgc    TABLE     [   CREATE TABLE "3".treating_patient_qol_pgc (
)
INHERITS ("@base".treating_patient_qol_pgc);
 )   DROP TABLE "3".treating_patient_qol_pgc;
       3            postgres    false    5    243            0           1259    26919    treating_patient_qol_sf8    TABLE     [   CREATE TABLE "3".treating_patient_qol_sf8 (
)
INHERITS ("@base".treating_patient_qol_sf8);
 )   DROP TABLE "3".treating_patient_qol_sf8;
       3            postgres    false    245    5            1           1259    26924    treating_patient_sarcopenia    TABLE     a   CREATE TABLE "3".treating_patient_sarcopenia (
)
INHERITS ("@base".treating_patient_sarcopenia);
 ,   DROP TABLE "3".treating_patient_sarcopenia;
       3            postgres    false    5    247            2           1259    26929     treating_patient_sarcopenia_loco    TABLE     k   CREATE TABLE "3".treating_patient_sarcopenia_loco (
)
INHERITS ("@base".treating_patient_sarcopenia_loco);
 1   DROP TABLE "3".treating_patient_sarcopenia_loco;
       3            postgres    false    249    5                       1259    72233    treating_patient_senion    TABLE     Y   CREATE TABLE "3".treating_patient_senion (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "3".treating_patient_senion;
       3            postgres    false    5    525                       1259    72323    treating_patient_senior    TABLE     Y   CREATE TABLE "3".treating_patient_senior (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "3".treating_patient_senior;
       3            postgres    false    5    525            3           1259    26934    treating_patient_vitality    TABLE     ]   CREATE TABLE "3".treating_patient_vitality (
)
INHERITS ("@base".treating_patient_vitality);
 *   DROP TABLE "3".treating_patient_vitality;
       3            postgres    false    5    251            4           1259    26939    treating_patient_zarit    TABLE     W   CREATE TABLE "3".treating_patient_zarit (
)
INHERITS ("@base".treating_patient_zarit);
 '   DROP TABLE "3".treating_patient_zarit;
       3            postgres    false    253    5            5           1259    26944    treating_patients    TABLE     M   CREATE TABLE "3".treating_patients (
)
INHERITS ("@base".treating_patients);
 "   DROP TABLE "3".treating_patients;
       3            postgres    false    5    255            6           1259    26949    users    TABLE     5   CREATE TABLE "3".users (
)
INHERITS ("@base".users);
    DROP TABLE "3".users;
       3            postgres    false    257    5            ^           1259    49374    areas    TABLE     5   CREATE TABLE "4".areas (
)
INHERITS ("@base".areas);
    DROP TABLE "4".areas;
       4            postgres    false    207    6            ]           1259    49364    centers    TABLE     9   CREATE TABLE "4".centers (
)
INHERITS ("@base".centers);
    DROP TABLE "4".centers;
       4            postgres    false    6    209            n           1259    49474    patients    TABLE     ;   CREATE TABLE "4".patients (
)
INHERITS ("@base".patients);
    DROP TABLE "4".patients;
       4            postgres    false    211    6            m           1259    49468    treating_patient_adl    TABLE     S   CREATE TABLE "4".treating_patient_adl (
)
INHERITS ("@base".treating_patient_adl);
 %   DROP TABLE "4".treating_patient_adl;
       4            postgres    false    6    213            l           1259    49462    treating_patient_basic_adl    TABLE     _   CREATE TABLE "4".treating_patient_basic_adl (
)
INHERITS ("@base".treating_patient_basic_adl);
 +   DROP TABLE "4".treating_patient_basic_adl;
       4            postgres    false    6    215            o           1259    49484    treating_patient_blood_sugar    TABLE     c   CREATE TABLE "4".treating_patient_blood_sugar (
)
INHERITS ("@base".treating_patient_blood_sugar);
 -   DROP TABLE "4".treating_patient_blood_sugar;
       4            postgres    false    6    217            k           1259    49456    treating_patient_cga7    TABLE     U   CREATE TABLE "4".treating_patient_cga7 (
)
INHERITS ("@base".treating_patient_cga7);
 &   DROP TABLE "4".treating_patient_cga7;
       4            postgres    false    6    219            j           1259    49450     treating_patient_closure_sticker    TABLE     k   CREATE TABLE "4".treating_patient_closure_sticker (
)
INHERITS ("@base".treating_patient_closure_sticker);
 1   DROP TABLE "4".treating_patient_closure_sticker;
       4            postgres    false    221    6            i           1259    49444    treating_patient_comprehensive    TABLE     g   CREATE TABLE "4".treating_patient_comprehensive (
)
INHERITS ("@base".treating_patient_comprehensive);
 /   DROP TABLE "4".treating_patient_comprehensive;
       4            postgres    false    223    6            h           1259    49438    treating_patient_dbd    TABLE     S   CREATE TABLE "4".treating_patient_dbd (
)
INHERITS ("@base".treating_patient_dbd);
 %   DROP TABLE "4".treating_patient_dbd;
       4            postgres    false    225    6            g           1259    49432    treating_patient_fra    TABLE     S   CREATE TABLE "4".treating_patient_fra (
)
INHERITS ("@base".treating_patient_fra);
 %   DROP TABLE "4".treating_patient_fra;
       4            postgres    false    227    6            f           1259    49426    treating_patient_fra_a    TABLE     W   CREATE TABLE "4".treating_patient_fra_a (
)
INHERITS ("@base".treating_patient_fra_a);
 '   DROP TABLE "4".treating_patient_fra_a;
       4            postgres    false    6    229            e           1259    49420    treating_patient_fra_b    TABLE     W   CREATE TABLE "4".treating_patient_fra_b (
)
INHERITS ("@base".treating_patient_fra_b);
 '   DROP TABLE "4".treating_patient_fra_b;
       4            postgres    false    231    6            \           1259    49358    treating_patient_gds15    TABLE     W   CREATE TABLE "4".treating_patient_gds15 (
)
INHERITS ("@base".treating_patient_gds15);
 '   DROP TABLE "4".treating_patient_gds15;
       4            postgres    false    6    233            [           1259    49349    treating_patient_hdsr    TABLE     U   CREATE TABLE "4".treating_patient_hdsr (
)
INHERITS ("@base".treating_patient_hdsr);
 &   DROP TABLE "4".treating_patient_hdsr;
       4            postgres    false    6    235            Z           1259    49340    treating_patient_instrumental    TABLE     e   CREATE TABLE "4".treating_patient_instrumental (
)
INHERITS ("@base".treating_patient_instrumental);
 .   DROP TABLE "4".treating_patient_instrumental;
       4            postgres    false    237    6            V           1259    49303    treating_patient_mmse    TABLE     U   CREATE TABLE "4".treating_patient_mmse (
)
INHERITS ("@base".treating_patient_mmse);
 &   DROP TABLE "4".treating_patient_mmse;
       4            postgres    false    6    239            X           1259    49328    treating_patient_mna    TABLE     S   CREATE TABLE "4".treating_patient_mna (
)
INHERITS ("@base".treating_patient_mna);
 %   DROP TABLE "4".treating_patient_mna;
       4            postgres    false    6    241            d           1259    49414    treating_patient_qol_pgc    TABLE     [   CREATE TABLE "4".treating_patient_qol_pgc (
)
INHERITS ("@base".treating_patient_qol_pgc);
 )   DROP TABLE "4".treating_patient_qol_pgc;
       4            postgres    false    6    243            c           1259    49408    treating_patient_qol_sf8    TABLE     [   CREATE TABLE "4".treating_patient_qol_sf8 (
)
INHERITS ("@base".treating_patient_qol_sf8);
 )   DROP TABLE "4".treating_patient_qol_sf8;
       4            postgres    false    245    6            b           1259    49402    treating_patient_sarcopenia    TABLE     a   CREATE TABLE "4".treating_patient_sarcopenia (
)
INHERITS ("@base".treating_patient_sarcopenia);
 ,   DROP TABLE "4".treating_patient_sarcopenia;
       4            postgres    false    247    6            a           1259    49396     treating_patient_sarcopenia_loco    TABLE     k   CREATE TABLE "4".treating_patient_sarcopenia_loco (
)
INHERITS ("@base".treating_patient_sarcopenia_loco);
 1   DROP TABLE "4".treating_patient_sarcopenia_loco;
       4            postgres    false    249    6                       1259    72239    treating_patient_senion    TABLE     Y   CREATE TABLE "4".treating_patient_senion (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "4".treating_patient_senion;
       4            postgres    false    525    6                       1259    72317    treating_patient_senior    TABLE     Y   CREATE TABLE "4".treating_patient_senior (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "4".treating_patient_senior;
       4            postgres    false    525    6            `           1259    49390    treating_patient_vitality    TABLE     ]   CREATE TABLE "4".treating_patient_vitality (
)
INHERITS ("@base".treating_patient_vitality);
 *   DROP TABLE "4".treating_patient_vitality;
       4            postgres    false    6    251            _           1259    49384    treating_patient_zarit    TABLE     W   CREATE TABLE "4".treating_patient_zarit (
)
INHERITS ("@base".treating_patient_zarit);
 '   DROP TABLE "4".treating_patient_zarit;
       4            postgres    false    6    253            Y           1259    49334    treating_patients    TABLE     M   CREATE TABLE "4".treating_patients (
)
INHERITS ("@base".treating_patients);
 "   DROP TABLE "4".treating_patients;
       4            postgres    false    6    255            W           1259    49316    users    TABLE     5   CREATE TABLE "4".users (
)
INHERITS ("@base".users);
    DROP TABLE "4".users;
       4            postgres    false    257    6            x           1259    49566    areas    TABLE     5   CREATE TABLE "5".areas (
)
INHERITS ("@base".areas);
    DROP TABLE "5".areas;
       5            postgres    false    4    207            w           1259    49556    centers    TABLE     9   CREATE TABLE "5".centers (
)
INHERITS ("@base".centers);
    DROP TABLE "5".centers;
       5            postgres    false    4    209            �           1259    49666    patients    TABLE     ;   CREATE TABLE "5".patients (
)
INHERITS ("@base".patients);
    DROP TABLE "5".patients;
       5            postgres    false    4    211            �           1259    49660    treating_patient_adl    TABLE     S   CREATE TABLE "5".treating_patient_adl (
)
INHERITS ("@base".treating_patient_adl);
 %   DROP TABLE "5".treating_patient_adl;
       5            postgres    false    213    4            �           1259    49654    treating_patient_basic_adl    TABLE     _   CREATE TABLE "5".treating_patient_basic_adl (
)
INHERITS ("@base".treating_patient_basic_adl);
 +   DROP TABLE "5".treating_patient_basic_adl;
       5            postgres    false    215    4            �           1259    49676    treating_patient_blood_sugar    TABLE     c   CREATE TABLE "5".treating_patient_blood_sugar (
)
INHERITS ("@base".treating_patient_blood_sugar);
 -   DROP TABLE "5".treating_patient_blood_sugar;
       5            postgres    false    217    4            �           1259    49648    treating_patient_cga7    TABLE     U   CREATE TABLE "5".treating_patient_cga7 (
)
INHERITS ("@base".treating_patient_cga7);
 &   DROP TABLE "5".treating_patient_cga7;
       5            postgres    false    219    4            �           1259    49642     treating_patient_closure_sticker    TABLE     k   CREATE TABLE "5".treating_patient_closure_sticker (
)
INHERITS ("@base".treating_patient_closure_sticker);
 1   DROP TABLE "5".treating_patient_closure_sticker;
       5            postgres    false    221    4            �           1259    49636    treating_patient_comprehensive    TABLE     g   CREATE TABLE "5".treating_patient_comprehensive (
)
INHERITS ("@base".treating_patient_comprehensive);
 /   DROP TABLE "5".treating_patient_comprehensive;
       5            postgres    false    4    223            �           1259    49630    treating_patient_dbd    TABLE     S   CREATE TABLE "5".treating_patient_dbd (
)
INHERITS ("@base".treating_patient_dbd);
 %   DROP TABLE "5".treating_patient_dbd;
       5            postgres    false    225    4            �           1259    49624    treating_patient_fra    TABLE     S   CREATE TABLE "5".treating_patient_fra (
)
INHERITS ("@base".treating_patient_fra);
 %   DROP TABLE "5".treating_patient_fra;
       5            postgres    false    227    4            �           1259    49618    treating_patient_fra_a    TABLE     W   CREATE TABLE "5".treating_patient_fra_a (
)
INHERITS ("@base".treating_patient_fra_a);
 '   DROP TABLE "5".treating_patient_fra_a;
       5            postgres    false    4    229                       1259    49612    treating_patient_fra_b    TABLE     W   CREATE TABLE "5".treating_patient_fra_b (
)
INHERITS ("@base".treating_patient_fra_b);
 '   DROP TABLE "5".treating_patient_fra_b;
       5            postgres    false    231    4            v           1259    49550    treating_patient_gds15    TABLE     W   CREATE TABLE "5".treating_patient_gds15 (
)
INHERITS ("@base".treating_patient_gds15);
 '   DROP TABLE "5".treating_patient_gds15;
       5            postgres    false    233    4            u           1259    49541    treating_patient_hdsr    TABLE     U   CREATE TABLE "5".treating_patient_hdsr (
)
INHERITS ("@base".treating_patient_hdsr);
 &   DROP TABLE "5".treating_patient_hdsr;
       5            postgres    false    235    4            t           1259    49532    treating_patient_instrumental    TABLE     e   CREATE TABLE "5".treating_patient_instrumental (
)
INHERITS ("@base".treating_patient_instrumental);
 .   DROP TABLE "5".treating_patient_instrumental;
       5            postgres    false    4    237            p           1259    49495    treating_patient_mmse    TABLE     U   CREATE TABLE "5".treating_patient_mmse (
)
INHERITS ("@base".treating_patient_mmse);
 &   DROP TABLE "5".treating_patient_mmse;
       5            postgres    false    239    4            r           1259    49520    treating_patient_mna    TABLE     S   CREATE TABLE "5".treating_patient_mna (
)
INHERITS ("@base".treating_patient_mna);
 %   DROP TABLE "5".treating_patient_mna;
       5            postgres    false    4    241            ~           1259    49606    treating_patient_qol_pgc    TABLE     [   CREATE TABLE "5".treating_patient_qol_pgc (
)
INHERITS ("@base".treating_patient_qol_pgc);
 )   DROP TABLE "5".treating_patient_qol_pgc;
       5            postgres    false    4    243            }           1259    49600    treating_patient_qol_sf8    TABLE     [   CREATE TABLE "5".treating_patient_qol_sf8 (
)
INHERITS ("@base".treating_patient_qol_sf8);
 )   DROP TABLE "5".treating_patient_qol_sf8;
       5            postgres    false    4    245            |           1259    49594    treating_patient_sarcopenia    TABLE     a   CREATE TABLE "5".treating_patient_sarcopenia (
)
INHERITS ("@base".treating_patient_sarcopenia);
 ,   DROP TABLE "5".treating_patient_sarcopenia;
       5            postgres    false    4    247            {           1259    49588     treating_patient_sarcopenia_loco    TABLE     k   CREATE TABLE "5".treating_patient_sarcopenia_loco (
)
INHERITS ("@base".treating_patient_sarcopenia_loco);
 1   DROP TABLE "5".treating_patient_sarcopenia_loco;
       5            postgres    false    249    4                       1259    72245    treating_patient_senion    TABLE     Y   CREATE TABLE "5".treating_patient_senion (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "5".treating_patient_senion;
       5            postgres    false    525    4                       1259    72311    treating_patient_senior    TABLE     Y   CREATE TABLE "5".treating_patient_senior (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "5".treating_patient_senior;
       5            postgres    false    4    525            z           1259    49582    treating_patient_vitality    TABLE     ]   CREATE TABLE "5".treating_patient_vitality (
)
INHERITS ("@base".treating_patient_vitality);
 *   DROP TABLE "5".treating_patient_vitality;
       5            postgres    false    4    251            y           1259    49576    treating_patient_zarit    TABLE     W   CREATE TABLE "5".treating_patient_zarit (
)
INHERITS ("@base".treating_patient_zarit);
 '   DROP TABLE "5".treating_patient_zarit;
       5            postgres    false    253    4            s           1259    49526    treating_patients    TABLE     M   CREATE TABLE "5".treating_patients (
)
INHERITS ("@base".treating_patients);
 "   DROP TABLE "5".treating_patients;
       5            postgres    false    255    4            q           1259    49508    users    TABLE     5   CREATE TABLE "5".users (
)
INHERITS ("@base".users);
    DROP TABLE "5".users;
       5            postgres    false    257    4            �           1259    49757    areas    TABLE     5   CREATE TABLE "6".areas (
)
INHERITS ("@base".areas);
    DROP TABLE "6".areas;
       6            postgres    false    9    207            �           1259    49747    centers    TABLE     9   CREATE TABLE "6".centers (
)
INHERITS ("@base".centers);
    DROP TABLE "6".centers;
       6            postgres    false    209    9            �           1259    49857    patients    TABLE     ;   CREATE TABLE "6".patients (
)
INHERITS ("@base".patients);
    DROP TABLE "6".patients;
       6            postgres    false    9    211            �           1259    49851    treating_patient_adl    TABLE     S   CREATE TABLE "6".treating_patient_adl (
)
INHERITS ("@base".treating_patient_adl);
 %   DROP TABLE "6".treating_patient_adl;
       6            postgres    false    9    213            �           1259    49845    treating_patient_basic_adl    TABLE     _   CREATE TABLE "6".treating_patient_basic_adl (
)
INHERITS ("@base".treating_patient_basic_adl);
 +   DROP TABLE "6".treating_patient_basic_adl;
       6            postgres    false    9    215            �           1259    49867    treating_patient_blood_sugar    TABLE     c   CREATE TABLE "6".treating_patient_blood_sugar (
)
INHERITS ("@base".treating_patient_blood_sugar);
 -   DROP TABLE "6".treating_patient_blood_sugar;
       6            postgres    false    9    217            �           1259    49839    treating_patient_cga7    TABLE     U   CREATE TABLE "6".treating_patient_cga7 (
)
INHERITS ("@base".treating_patient_cga7);
 &   DROP TABLE "6".treating_patient_cga7;
       6            postgres    false    9    219            �           1259    49833     treating_patient_closure_sticker    TABLE     k   CREATE TABLE "6".treating_patient_closure_sticker (
)
INHERITS ("@base".treating_patient_closure_sticker);
 1   DROP TABLE "6".treating_patient_closure_sticker;
       6            postgres    false    9    221            �           1259    49827    treating_patient_comprehensive    TABLE     g   CREATE TABLE "6".treating_patient_comprehensive (
)
INHERITS ("@base".treating_patient_comprehensive);
 /   DROP TABLE "6".treating_patient_comprehensive;
       6            postgres    false    223    9            �           1259    49821    treating_patient_dbd    TABLE     S   CREATE TABLE "6".treating_patient_dbd (
)
INHERITS ("@base".treating_patient_dbd);
 %   DROP TABLE "6".treating_patient_dbd;
       6            postgres    false    9    225            �           1259    49815    treating_patient_fra    TABLE     S   CREATE TABLE "6".treating_patient_fra (
)
INHERITS ("@base".treating_patient_fra);
 %   DROP TABLE "6".treating_patient_fra;
       6            postgres    false    9    227            �           1259    49809    treating_patient_fra_a    TABLE     W   CREATE TABLE "6".treating_patient_fra_a (
)
INHERITS ("@base".treating_patient_fra_a);
 '   DROP TABLE "6".treating_patient_fra_a;
       6            postgres    false    229    9            �           1259    49803    treating_patient_fra_b    TABLE     W   CREATE TABLE "6".treating_patient_fra_b (
)
INHERITS ("@base".treating_patient_fra_b);
 '   DROP TABLE "6".treating_patient_fra_b;
       6            postgres    false    9    231            �           1259    49741    treating_patient_gds15    TABLE     W   CREATE TABLE "6".treating_patient_gds15 (
)
INHERITS ("@base".treating_patient_gds15);
 '   DROP TABLE "6".treating_patient_gds15;
       6            postgres    false    9    233            �           1259    49732    treating_patient_hdsr    TABLE     U   CREATE TABLE "6".treating_patient_hdsr (
)
INHERITS ("@base".treating_patient_hdsr);
 &   DROP TABLE "6".treating_patient_hdsr;
       6            postgres    false    235    9            �           1259    49723    treating_patient_instrumental    TABLE     e   CREATE TABLE "6".treating_patient_instrumental (
)
INHERITS ("@base".treating_patient_instrumental);
 .   DROP TABLE "6".treating_patient_instrumental;
       6            postgres    false    9    237            �           1259    49686    treating_patient_mmse    TABLE     U   CREATE TABLE "6".treating_patient_mmse (
)
INHERITS ("@base".treating_patient_mmse);
 &   DROP TABLE "6".treating_patient_mmse;
       6            postgres    false    9    239            �           1259    49711    treating_patient_mna    TABLE     S   CREATE TABLE "6".treating_patient_mna (
)
INHERITS ("@base".treating_patient_mna);
 %   DROP TABLE "6".treating_patient_mna;
       6            postgres    false    9    241            �           1259    49797    treating_patient_qol_pgc    TABLE     [   CREATE TABLE "6".treating_patient_qol_pgc (
)
INHERITS ("@base".treating_patient_qol_pgc);
 )   DROP TABLE "6".treating_patient_qol_pgc;
       6            postgres    false    9    243            �           1259    49791    treating_patient_qol_sf8    TABLE     [   CREATE TABLE "6".treating_patient_qol_sf8 (
)
INHERITS ("@base".treating_patient_qol_sf8);
 )   DROP TABLE "6".treating_patient_qol_sf8;
       6            postgres    false    9    245            �           1259    49785    treating_patient_sarcopenia    TABLE     a   CREATE TABLE "6".treating_patient_sarcopenia (
)
INHERITS ("@base".treating_patient_sarcopenia);
 ,   DROP TABLE "6".treating_patient_sarcopenia;
       6            postgres    false    9    247            �           1259    49779     treating_patient_sarcopenia_loco    TABLE     k   CREATE TABLE "6".treating_patient_sarcopenia_loco (
)
INHERITS ("@base".treating_patient_sarcopenia_loco);
 1   DROP TABLE "6".treating_patient_sarcopenia_loco;
       6            postgres    false    9    249                       1259    72251    treating_patient_senion    TABLE     Y   CREATE TABLE "6".treating_patient_senion (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "6".treating_patient_senion;
       6            postgres    false    525    9                       1259    72305    treating_patient_senior    TABLE     Y   CREATE TABLE "6".treating_patient_senior (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "6".treating_patient_senior;
       6            postgres    false    9    525            �           1259    49773    treating_patient_vitality    TABLE     ]   CREATE TABLE "6".treating_patient_vitality (
)
INHERITS ("@base".treating_patient_vitality);
 *   DROP TABLE "6".treating_patient_vitality;
       6            postgres    false    9    251            �           1259    49767    treating_patient_zarit    TABLE     W   CREATE TABLE "6".treating_patient_zarit (
)
INHERITS ("@base".treating_patient_zarit);
 '   DROP TABLE "6".treating_patient_zarit;
       6            postgres    false    9    253            �           1259    49717    treating_patients    TABLE     M   CREATE TABLE "6".treating_patients (
)
INHERITS ("@base".treating_patients);
 "   DROP TABLE "6".treating_patients;
       6            postgres    false    9    255            �           1259    49699    users    TABLE     5   CREATE TABLE "6".users (
)
INHERITS ("@base".users);
    DROP TABLE "6".users;
       6            postgres    false    9    257            �           1259    49948    areas    TABLE     5   CREATE TABLE "7".areas (
)
INHERITS ("@base".areas);
    DROP TABLE "7".areas;
       7            postgres    false    18    207            �           1259    49938    centers    TABLE     9   CREATE TABLE "7".centers (
)
INHERITS ("@base".centers);
    DROP TABLE "7".centers;
       7            postgres    false    18    209            �           1259    50048    patients    TABLE     ;   CREATE TABLE "7".patients (
)
INHERITS ("@base".patients);
    DROP TABLE "7".patients;
       7            postgres    false    18    211            �           1259    50042    treating_patient_adl    TABLE     S   CREATE TABLE "7".treating_patient_adl (
)
INHERITS ("@base".treating_patient_adl);
 %   DROP TABLE "7".treating_patient_adl;
       7            postgres    false    18    213            �           1259    50036    treating_patient_basic_adl    TABLE     _   CREATE TABLE "7".treating_patient_basic_adl (
)
INHERITS ("@base".treating_patient_basic_adl);
 +   DROP TABLE "7".treating_patient_basic_adl;
       7            postgres    false    18    215            �           1259    50058    treating_patient_blood_sugar    TABLE     c   CREATE TABLE "7".treating_patient_blood_sugar (
)
INHERITS ("@base".treating_patient_blood_sugar);
 -   DROP TABLE "7".treating_patient_blood_sugar;
       7            postgres    false    217    18            �           1259    50030    treating_patient_cga7    TABLE     U   CREATE TABLE "7".treating_patient_cga7 (
)
INHERITS ("@base".treating_patient_cga7);
 &   DROP TABLE "7".treating_patient_cga7;
       7            postgres    false    18    219            �           1259    50024     treating_patient_closure_sticker    TABLE     k   CREATE TABLE "7".treating_patient_closure_sticker (
)
INHERITS ("@base".treating_patient_closure_sticker);
 1   DROP TABLE "7".treating_patient_closure_sticker;
       7            postgres    false    18    221            �           1259    50018    treating_patient_comprehensive    TABLE     g   CREATE TABLE "7".treating_patient_comprehensive (
)
INHERITS ("@base".treating_patient_comprehensive);
 /   DROP TABLE "7".treating_patient_comprehensive;
       7            postgres    false    18    223            �           1259    50012    treating_patient_dbd    TABLE     S   CREATE TABLE "7".treating_patient_dbd (
)
INHERITS ("@base".treating_patient_dbd);
 %   DROP TABLE "7".treating_patient_dbd;
       7            postgres    false    18    225            �           1259    50006    treating_patient_fra    TABLE     S   CREATE TABLE "7".treating_patient_fra (
)
INHERITS ("@base".treating_patient_fra);
 %   DROP TABLE "7".treating_patient_fra;
       7            postgres    false    18    227            �           1259    50000    treating_patient_fra_a    TABLE     W   CREATE TABLE "7".treating_patient_fra_a (
)
INHERITS ("@base".treating_patient_fra_a);
 '   DROP TABLE "7".treating_patient_fra_a;
       7            postgres    false    18    229            �           1259    49994    treating_patient_fra_b    TABLE     W   CREATE TABLE "7".treating_patient_fra_b (
)
INHERITS ("@base".treating_patient_fra_b);
 '   DROP TABLE "7".treating_patient_fra_b;
       7            postgres    false    18    231            �           1259    49932    treating_patient_gds15    TABLE     W   CREATE TABLE "7".treating_patient_gds15 (
)
INHERITS ("@base".treating_patient_gds15);
 '   DROP TABLE "7".treating_patient_gds15;
       7            postgres    false    18    233            �           1259    49923    treating_patient_hdsr    TABLE     U   CREATE TABLE "7".treating_patient_hdsr (
)
INHERITS ("@base".treating_patient_hdsr);
 &   DROP TABLE "7".treating_patient_hdsr;
       7            postgres    false    18    235            �           1259    49914    treating_patient_instrumental    TABLE     e   CREATE TABLE "7".treating_patient_instrumental (
)
INHERITS ("@base".treating_patient_instrumental);
 .   DROP TABLE "7".treating_patient_instrumental;
       7            postgres    false    237    18            �           1259    49877    treating_patient_mmse    TABLE     U   CREATE TABLE "7".treating_patient_mmse (
)
INHERITS ("@base".treating_patient_mmse);
 &   DROP TABLE "7".treating_patient_mmse;
       7            postgres    false    18    239            �           1259    49902    treating_patient_mna    TABLE     S   CREATE TABLE "7".treating_patient_mna (
)
INHERITS ("@base".treating_patient_mna);
 %   DROP TABLE "7".treating_patient_mna;
       7            postgres    false    18    241            �           1259    49988    treating_patient_qol_pgc    TABLE     [   CREATE TABLE "7".treating_patient_qol_pgc (
)
INHERITS ("@base".treating_patient_qol_pgc);
 )   DROP TABLE "7".treating_patient_qol_pgc;
       7            postgres    false    243    18            �           1259    49982    treating_patient_qol_sf8    TABLE     [   CREATE TABLE "7".treating_patient_qol_sf8 (
)
INHERITS ("@base".treating_patient_qol_sf8);
 )   DROP TABLE "7".treating_patient_qol_sf8;
       7            postgres    false    18    245            �           1259    49976    treating_patient_sarcopenia    TABLE     a   CREATE TABLE "7".treating_patient_sarcopenia (
)
INHERITS ("@base".treating_patient_sarcopenia);
 ,   DROP TABLE "7".treating_patient_sarcopenia;
       7            postgres    false    18    247            �           1259    49970     treating_patient_sarcopenia_loco    TABLE     k   CREATE TABLE "7".treating_patient_sarcopenia_loco (
)
INHERITS ("@base".treating_patient_sarcopenia_loco);
 1   DROP TABLE "7".treating_patient_sarcopenia_loco;
       7            postgres    false    249    18                       1259    72257    treating_patient_senion    TABLE     Y   CREATE TABLE "7".treating_patient_senion (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "7".treating_patient_senion;
       7            postgres    false    525    18                       1259    72299    treating_patient_senior    TABLE     Y   CREATE TABLE "7".treating_patient_senior (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "7".treating_patient_senior;
       7            postgres    false    525    18            �           1259    49964    treating_patient_vitality    TABLE     ]   CREATE TABLE "7".treating_patient_vitality (
)
INHERITS ("@base".treating_patient_vitality);
 *   DROP TABLE "7".treating_patient_vitality;
       7            postgres    false    18    251            �           1259    49958    treating_patient_zarit    TABLE     W   CREATE TABLE "7".treating_patient_zarit (
)
INHERITS ("@base".treating_patient_zarit);
 '   DROP TABLE "7".treating_patient_zarit;
       7            postgres    false    18    253            �           1259    49908    treating_patients    TABLE     M   CREATE TABLE "7".treating_patients (
)
INHERITS ("@base".treating_patients);
 "   DROP TABLE "7".treating_patients;
       7            postgres    false    18    255            �           1259    49890    users    TABLE     5   CREATE TABLE "7".users (
)
INHERITS ("@base".users);
    DROP TABLE "7".users;
       7            postgres    false    257    18            �           1259    50139    areas    TABLE     5   CREATE TABLE "8".areas (
)
INHERITS ("@base".areas);
    DROP TABLE "8".areas;
       8            postgres    false    8    207            �           1259    50129    centers    TABLE     9   CREATE TABLE "8".centers (
)
INHERITS ("@base".centers);
    DROP TABLE "8".centers;
       8            postgres    false    8    209            �           1259    50239    patients    TABLE     ;   CREATE TABLE "8".patients (
)
INHERITS ("@base".patients);
    DROP TABLE "8".patients;
       8            postgres    false    8    211            �           1259    50233    treating_patient_adl    TABLE     S   CREATE TABLE "8".treating_patient_adl (
)
INHERITS ("@base".treating_patient_adl);
 %   DROP TABLE "8".treating_patient_adl;
       8            postgres    false    213    8            �           1259    50227    treating_patient_basic_adl    TABLE     _   CREATE TABLE "8".treating_patient_basic_adl (
)
INHERITS ("@base".treating_patient_basic_adl);
 +   DROP TABLE "8".treating_patient_basic_adl;
       8            postgres    false    215    8            �           1259    50249    treating_patient_blood_sugar    TABLE     c   CREATE TABLE "8".treating_patient_blood_sugar (
)
INHERITS ("@base".treating_patient_blood_sugar);
 -   DROP TABLE "8".treating_patient_blood_sugar;
       8            postgres    false    8    217            �           1259    50221    treating_patient_cga7    TABLE     U   CREATE TABLE "8".treating_patient_cga7 (
)
INHERITS ("@base".treating_patient_cga7);
 &   DROP TABLE "8".treating_patient_cga7;
       8            postgres    false    219    8            �           1259    50215     treating_patient_closure_sticker    TABLE     k   CREATE TABLE "8".treating_patient_closure_sticker (
)
INHERITS ("@base".treating_patient_closure_sticker);
 1   DROP TABLE "8".treating_patient_closure_sticker;
       8            postgres    false    8    221            �           1259    50209    treating_patient_comprehensive    TABLE     g   CREATE TABLE "8".treating_patient_comprehensive (
)
INHERITS ("@base".treating_patient_comprehensive);
 /   DROP TABLE "8".treating_patient_comprehensive;
       8            postgres    false    8    223            �           1259    50203    treating_patient_dbd    TABLE     S   CREATE TABLE "8".treating_patient_dbd (
)
INHERITS ("@base".treating_patient_dbd);
 %   DROP TABLE "8".treating_patient_dbd;
       8            postgres    false    8    225            �           1259    50197    treating_patient_fra    TABLE     S   CREATE TABLE "8".treating_patient_fra (
)
INHERITS ("@base".treating_patient_fra);
 %   DROP TABLE "8".treating_patient_fra;
       8            postgres    false    8    227            �           1259    50191    treating_patient_fra_a    TABLE     W   CREATE TABLE "8".treating_patient_fra_a (
)
INHERITS ("@base".treating_patient_fra_a);
 '   DROP TABLE "8".treating_patient_fra_a;
       8            postgres    false    229    8            �           1259    50185    treating_patient_fra_b    TABLE     W   CREATE TABLE "8".treating_patient_fra_b (
)
INHERITS ("@base".treating_patient_fra_b);
 '   DROP TABLE "8".treating_patient_fra_b;
       8            postgres    false    8    231            �           1259    50123    treating_patient_gds15    TABLE     W   CREATE TABLE "8".treating_patient_gds15 (
)
INHERITS ("@base".treating_patient_gds15);
 '   DROP TABLE "8".treating_patient_gds15;
       8            postgres    false    8    233            �           1259    50114    treating_patient_hdsr    TABLE     U   CREATE TABLE "8".treating_patient_hdsr (
)
INHERITS ("@base".treating_patient_hdsr);
 &   DROP TABLE "8".treating_patient_hdsr;
       8            postgres    false    8    235            �           1259    50105    treating_patient_instrumental    TABLE     e   CREATE TABLE "8".treating_patient_instrumental (
)
INHERITS ("@base".treating_patient_instrumental);
 .   DROP TABLE "8".treating_patient_instrumental;
       8            postgres    false    8    237            �           1259    50068    treating_patient_mmse    TABLE     U   CREATE TABLE "8".treating_patient_mmse (
)
INHERITS ("@base".treating_patient_mmse);
 &   DROP TABLE "8".treating_patient_mmse;
       8            postgres    false    8    239            �           1259    50093    treating_patient_mna    TABLE     S   CREATE TABLE "8".treating_patient_mna (
)
INHERITS ("@base".treating_patient_mna);
 %   DROP TABLE "8".treating_patient_mna;
       8            postgres    false    8    241            �           1259    50179    treating_patient_qol_pgc    TABLE     [   CREATE TABLE "8".treating_patient_qol_pgc (
)
INHERITS ("@base".treating_patient_qol_pgc);
 )   DROP TABLE "8".treating_patient_qol_pgc;
       8            postgres    false    8    243            �           1259    50173    treating_patient_qol_sf8    TABLE     [   CREATE TABLE "8".treating_patient_qol_sf8 (
)
INHERITS ("@base".treating_patient_qol_sf8);
 )   DROP TABLE "8".treating_patient_qol_sf8;
       8            postgres    false    8    245            �           1259    50167    treating_patient_sarcopenia    TABLE     a   CREATE TABLE "8".treating_patient_sarcopenia (
)
INHERITS ("@base".treating_patient_sarcopenia);
 ,   DROP TABLE "8".treating_patient_sarcopenia;
       8            postgres    false    8    247            �           1259    50161     treating_patient_sarcopenia_loco    TABLE     k   CREATE TABLE "8".treating_patient_sarcopenia_loco (
)
INHERITS ("@base".treating_patient_sarcopenia_loco);
 1   DROP TABLE "8".treating_patient_sarcopenia_loco;
       8            postgres    false    8    249                       1259    72263    treating_patient_senion    TABLE     Y   CREATE TABLE "8".treating_patient_senion (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "8".treating_patient_senion;
       8            postgres    false    525    8                       1259    72293    treating_patient_senior    TABLE     Y   CREATE TABLE "8".treating_patient_senior (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "8".treating_patient_senior;
       8            postgres    false    525    8            �           1259    50155    treating_patient_vitality    TABLE     ]   CREATE TABLE "8".treating_patient_vitality (
)
INHERITS ("@base".treating_patient_vitality);
 *   DROP TABLE "8".treating_patient_vitality;
       8            postgres    false    8    251            �           1259    50149    treating_patient_zarit    TABLE     W   CREATE TABLE "8".treating_patient_zarit (
)
INHERITS ("@base".treating_patient_zarit);
 '   DROP TABLE "8".treating_patient_zarit;
       8            postgres    false    8    253            �           1259    50099    treating_patients    TABLE     M   CREATE TABLE "8".treating_patients (
)
INHERITS ("@base".treating_patients);
 "   DROP TABLE "8".treating_patients;
       8            postgres    false    8    255            �           1259    50081    users    TABLE     5   CREATE TABLE "8".users (
)
INHERITS ("@base".users);
    DROP TABLE "8".users;
       8            postgres    false    257    8            �           1259    50331    areas    TABLE     5   CREATE TABLE "9".areas (
)
INHERITS ("@base".areas);
    DROP TABLE "9".areas;
       9            postgres    false    7    207            �           1259    50321    centers    TABLE     9   CREATE TABLE "9".centers (
)
INHERITS ("@base".centers);
    DROP TABLE "9".centers;
       9            postgres    false    209    7            �           1259    50431    patients    TABLE     ;   CREATE TABLE "9".patients (
)
INHERITS ("@base".patients);
    DROP TABLE "9".patients;
       9            postgres    false    7    211            �           1259    50425    treating_patient_adl    TABLE     S   CREATE TABLE "9".treating_patient_adl (
)
INHERITS ("@base".treating_patient_adl);
 %   DROP TABLE "9".treating_patient_adl;
       9            postgres    false    7    213            �           1259    50419    treating_patient_basic_adl    TABLE     _   CREATE TABLE "9".treating_patient_basic_adl (
)
INHERITS ("@base".treating_patient_basic_adl);
 +   DROP TABLE "9".treating_patient_basic_adl;
       9            postgres    false    7    215            �           1259    50441    treating_patient_blood_sugar    TABLE     c   CREATE TABLE "9".treating_patient_blood_sugar (
)
INHERITS ("@base".treating_patient_blood_sugar);
 -   DROP TABLE "9".treating_patient_blood_sugar;
       9            postgres    false    7    217            �           1259    50413    treating_patient_cga7    TABLE     U   CREATE TABLE "9".treating_patient_cga7 (
)
INHERITS ("@base".treating_patient_cga7);
 &   DROP TABLE "9".treating_patient_cga7;
       9            postgres    false    7    219            �           1259    50407     treating_patient_closure_sticker    TABLE     k   CREATE TABLE "9".treating_patient_closure_sticker (
)
INHERITS ("@base".treating_patient_closure_sticker);
 1   DROP TABLE "9".treating_patient_closure_sticker;
       9            postgres    false    221    7            �           1259    50401    treating_patient_comprehensive    TABLE     g   CREATE TABLE "9".treating_patient_comprehensive (
)
INHERITS ("@base".treating_patient_comprehensive);
 /   DROP TABLE "9".treating_patient_comprehensive;
       9            postgres    false    7    223            �           1259    50395    treating_patient_dbd    TABLE     S   CREATE TABLE "9".treating_patient_dbd (
)
INHERITS ("@base".treating_patient_dbd);
 %   DROP TABLE "9".treating_patient_dbd;
       9            postgres    false    7    225            �           1259    50389    treating_patient_fra    TABLE     S   CREATE TABLE "9".treating_patient_fra (
)
INHERITS ("@base".treating_patient_fra);
 %   DROP TABLE "9".treating_patient_fra;
       9            postgres    false    227    7            �           1259    50383    treating_patient_fra_a    TABLE     W   CREATE TABLE "9".treating_patient_fra_a (
)
INHERITS ("@base".treating_patient_fra_a);
 '   DROP TABLE "9".treating_patient_fra_a;
       9            postgres    false    7    229            �           1259    50377    treating_patient_fra_b    TABLE     W   CREATE TABLE "9".treating_patient_fra_b (
)
INHERITS ("@base".treating_patient_fra_b);
 '   DROP TABLE "9".treating_patient_fra_b;
       9            postgres    false    7    231            �           1259    50315    treating_patient_gds15    TABLE     W   CREATE TABLE "9".treating_patient_gds15 (
)
INHERITS ("@base".treating_patient_gds15);
 '   DROP TABLE "9".treating_patient_gds15;
       9            postgres    false    233    7            �           1259    50306    treating_patient_hdsr    TABLE     U   CREATE TABLE "9".treating_patient_hdsr (
)
INHERITS ("@base".treating_patient_hdsr);
 &   DROP TABLE "9".treating_patient_hdsr;
       9            postgres    false    7    235            �           1259    50297    treating_patient_instrumental    TABLE     e   CREATE TABLE "9".treating_patient_instrumental (
)
INHERITS ("@base".treating_patient_instrumental);
 .   DROP TABLE "9".treating_patient_instrumental;
       9            postgres    false    7    237            �           1259    50260    treating_patient_mmse    TABLE     U   CREATE TABLE "9".treating_patient_mmse (
)
INHERITS ("@base".treating_patient_mmse);
 &   DROP TABLE "9".treating_patient_mmse;
       9            postgres    false    239    7            �           1259    50285    treating_patient_mna    TABLE     S   CREATE TABLE "9".treating_patient_mna (
)
INHERITS ("@base".treating_patient_mna);
 %   DROP TABLE "9".treating_patient_mna;
       9            postgres    false    7    241            �           1259    50371    treating_patient_qol_pgc    TABLE     [   CREATE TABLE "9".treating_patient_qol_pgc (
)
INHERITS ("@base".treating_patient_qol_pgc);
 )   DROP TABLE "9".treating_patient_qol_pgc;
       9            postgres    false    243    7            �           1259    50365    treating_patient_qol_sf8    TABLE     [   CREATE TABLE "9".treating_patient_qol_sf8 (
)
INHERITS ("@base".treating_patient_qol_sf8);
 )   DROP TABLE "9".treating_patient_qol_sf8;
       9            postgres    false    7    245            �           1259    50359    treating_patient_sarcopenia    TABLE     a   CREATE TABLE "9".treating_patient_sarcopenia (
)
INHERITS ("@base".treating_patient_sarcopenia);
 ,   DROP TABLE "9".treating_patient_sarcopenia;
       9            postgres    false    247    7            �           1259    50353     treating_patient_sarcopenia_loco    TABLE     k   CREATE TABLE "9".treating_patient_sarcopenia_loco (
)
INHERITS ("@base".treating_patient_sarcopenia_loco);
 1   DROP TABLE "9".treating_patient_sarcopenia_loco;
       9            postgres    false    249    7                       1259    72269    treating_patient_senion    TABLE     Y   CREATE TABLE "9".treating_patient_senion (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "9".treating_patient_senion;
       9            postgres    false    7    525                       1259    72287    treating_patient_senior    TABLE     Y   CREATE TABLE "9".treating_patient_senior (
)
INHERITS ("@base".treating_patient_senior);
 (   DROP TABLE "9".treating_patient_senior;
       9            postgres    false    7    525            �           1259    50347    treating_patient_vitality    TABLE     ]   CREATE TABLE "9".treating_patient_vitality (
)
INHERITS ("@base".treating_patient_vitality);
 *   DROP TABLE "9".treating_patient_vitality;
       9            postgres    false    251    7            �           1259    50341    treating_patient_zarit    TABLE     W   CREATE TABLE "9".treating_patient_zarit (
)
INHERITS ("@base".treating_patient_zarit);
 '   DROP TABLE "9".treating_patient_zarit;
       9            postgres    false    253    7            �           1259    50291    treating_patients    TABLE     M   CREATE TABLE "9".treating_patients (
)
INHERITS ("@base".treating_patients);
 "   DROP TABLE "9".treating_patients;
       9            postgres    false    255    7            �           1259    50273    users    TABLE     5   CREATE TABLE "9".users (
)
INHERITS ("@base".users);
    DROP TABLE "9".users;
       9            postgres    false    257    7            7           1259    26960    areas_id_seq    SEQUENCE     v   CREATE SEQUENCE "@base".areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE "@base".areas_id_seq;
       @base          postgres    false    14    207            �           0    0    areas_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE "@base".areas_id_seq OWNED BY "@base".areas.id;
          @base          postgres    false    311            8           1259    26962    centers_id_seq    SEQUENCE     x   CREATE SEQUENCE "@base".centers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE "@base".centers_id_seq;
       @base          postgres    false    209    14            �           0    0    centers_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE "@base".centers_id_seq OWNED BY "@base".centers.id;
          @base          postgres    false    312            9           1259    26964    patients_id_seq    SEQUENCE     y   CREATE SEQUENCE "@base".patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE "@base".patients_id_seq;
       @base          postgres    false    211    14            �           0    0    patients_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE "@base".patients_id_seq OWNED BY "@base".patients.id;
          @base          postgres    false    313            :           1259    26966    treating_patient_adl_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_adl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE "@base".treating_patient_adl_id_seq;
       @base          postgres    false    213    14            �           0    0    treating_patient_adl_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE "@base".treating_patient_adl_id_seq OWNED BY "@base".treating_patient_adl.id;
          @base          postgres    false    314            ;           1259    26968 !   treating_patient_basic_adl_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_basic_adl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE "@base".treating_patient_basic_adl_id_seq;
       @base          postgres    false    14    215            �           0    0 !   treating_patient_basic_adl_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE "@base".treating_patient_basic_adl_id_seq OWNED BY "@base".treating_patient_basic_adl.id;
          @base          postgres    false    315            <           1259    26970 #   treating_patient_blood_sugar_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_blood_sugar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE "@base".treating_patient_blood_sugar_id_seq;
       @base          postgres    false    217    14            �           0    0 #   treating_patient_blood_sugar_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE "@base".treating_patient_blood_sugar_id_seq OWNED BY "@base".treating_patient_blood_sugar.id;
          @base          postgres    false    316            =           1259    26972    treating_patient_cga7_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_cga7_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE "@base".treating_patient_cga7_id_seq;
       @base          postgres    false    14    219            �           0    0    treating_patient_cga7_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE "@base".treating_patient_cga7_id_seq OWNED BY "@base".treating_patient_cga7.id;
          @base          postgres    false    317            >           1259    26974 '   treating_patient_closure_sticker_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_closure_sticker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE "@base".treating_patient_closure_sticker_id_seq;
       @base          postgres    false    14    221            �           0    0 '   treating_patient_closure_sticker_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE "@base".treating_patient_closure_sticker_id_seq OWNED BY "@base".treating_patient_closure_sticker.id;
          @base          postgres    false    318            ?           1259    26976 %   treating_patient_comprehensive_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_comprehensive_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE "@base".treating_patient_comprehensive_id_seq;
       @base          postgres    false    223    14            �           0    0 %   treating_patient_comprehensive_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE "@base".treating_patient_comprehensive_id_seq OWNED BY "@base".treating_patient_comprehensive.id;
          @base          postgres    false    319            @           1259    26978    treating_patient_dbd_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_dbd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE "@base".treating_patient_dbd_id_seq;
       @base          postgres    false    14    225            �           0    0    treating_patient_dbd_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE "@base".treating_patient_dbd_id_seq OWNED BY "@base".treating_patient_dbd.id;
          @base          postgres    false    320            A           1259    26980    treating_patient_fra_a_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_fra_a_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE "@base".treating_patient_fra_a_id_seq;
       @base          postgres    false    14    229            �           0    0    treating_patient_fra_a_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE "@base".treating_patient_fra_a_id_seq OWNED BY "@base".treating_patient_fra_a.id;
          @base          postgres    false    321            B           1259    26982    treating_patient_fra_b_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_fra_b_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE "@base".treating_patient_fra_b_id_seq;
       @base          postgres    false    14    231            �           0    0    treating_patient_fra_b_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE "@base".treating_patient_fra_b_id_seq OWNED BY "@base".treating_patient_fra_b.id;
          @base          postgres    false    322            C           1259    26984    treating_patient_fra_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_fra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE "@base".treating_patient_fra_id_seq;
       @base          postgres    false    227    14            �           0    0    treating_patient_fra_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE "@base".treating_patient_fra_id_seq OWNED BY "@base".treating_patient_fra.id;
          @base          postgres    false    323            D           1259    26986    treating_patient_gds15_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_gds15_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE "@base".treating_patient_gds15_id_seq;
       @base          postgres    false    14    233            �           0    0    treating_patient_gds15_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE "@base".treating_patient_gds15_id_seq OWNED BY "@base".treating_patient_gds15.id;
          @base          postgres    false    324            E           1259    26988    treating_patient_hdsr_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_hdsr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE "@base".treating_patient_hdsr_id_seq;
       @base          postgres    false    235    14            �           0    0    treating_patient_hdsr_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE "@base".treating_patient_hdsr_id_seq OWNED BY "@base".treating_patient_hdsr.id;
          @base          postgres    false    325            F           1259    26990 $   treating_patient_instrumental_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_instrumental_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE "@base".treating_patient_instrumental_id_seq;
       @base          postgres    false    14    237            �           0    0 $   treating_patient_instrumental_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE "@base".treating_patient_instrumental_id_seq OWNED BY "@base".treating_patient_instrumental.id;
          @base          postgres    false    326            G           1259    26992    treating_patient_mmse_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_mmse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE "@base".treating_patient_mmse_id_seq;
       @base          postgres    false    14    239            �           0    0    treating_patient_mmse_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE "@base".treating_patient_mmse_id_seq OWNED BY "@base".treating_patient_mmse.id;
          @base          postgres    false    327            H           1259    26994    treating_patient_mna_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_mna_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE "@base".treating_patient_mna_id_seq;
       @base          postgres    false    14    241            �           0    0    treating_patient_mna_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE "@base".treating_patient_mna_id_seq OWNED BY "@base".treating_patient_mna.id;
          @base          postgres    false    328            I           1259    26996    treating_patient_qol_pgc_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_qol_pgc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE "@base".treating_patient_qol_pgc_id_seq;
       @base          postgres    false    243    14            �           0    0    treating_patient_qol_pgc_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE "@base".treating_patient_qol_pgc_id_seq OWNED BY "@base".treating_patient_qol_pgc.id;
          @base          postgres    false    329            J           1259    26998    treating_patient_qol_sf8_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_qol_sf8_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE "@base".treating_patient_qol_sf8_id_seq;
       @base          postgres    false    14    245            �           0    0    treating_patient_qol_sf8_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE "@base".treating_patient_qol_sf8_id_seq OWNED BY "@base".treating_patient_qol_sf8.id;
          @base          postgres    false    330            K           1259    27000 "   treating_patient_sarcopenia_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_sarcopenia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE "@base".treating_patient_sarcopenia_id_seq;
       @base          postgres    false    14    247            �           0    0 "   treating_patient_sarcopenia_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE "@base".treating_patient_sarcopenia_id_seq OWNED BY "@base".treating_patient_sarcopenia.id;
          @base          postgres    false    331            L           1259    27002 '   treating_patient_sarcopenia_loco_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_sarcopenia_loco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE "@base".treating_patient_sarcopenia_loco_id_seq;
       @base          postgres    false    249    14            �           0    0 '   treating_patient_sarcopenia_loco_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE "@base".treating_patient_sarcopenia_loco_id_seq OWNED BY "@base".treating_patient_sarcopenia_loco.id;
          @base          postgres    false    332                       1259    72201    treating_patient_senior_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_senior_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE "@base".treating_patient_senior_id_seq;
       @base          postgres    false    525    14            �           0    0    treating_patient_senior_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE "@base".treating_patient_senior_id_seq OWNED BY "@base".treating_patient_senior.id;
          @base          postgres    false    524            M           1259    27004     treating_patient_vitality_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_vitality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE "@base".treating_patient_vitality_id_seq;
       @base          postgres    false    14    251            �           0    0     treating_patient_vitality_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE "@base".treating_patient_vitality_id_seq OWNED BY "@base".treating_patient_vitality.id;
          @base          postgres    false    333            N           1259    27006    treating_patient_zarit_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patient_zarit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE "@base".treating_patient_zarit_id_seq;
       @base          postgres    false    14    253            �           0    0    treating_patient_zarit_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE "@base".treating_patient_zarit_id_seq OWNED BY "@base".treating_patient_zarit.id;
          @base          postgres    false    334            O           1259    27008    treating_patients_id_seq    SEQUENCE     �   CREATE SEQUENCE "@base".treating_patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE "@base".treating_patients_id_seq;
       @base          postgres    false    255    14            �           0    0    treating_patients_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE "@base".treating_patients_id_seq OWNED BY "@base".treating_patients.id;
          @base          postgres    false    335            P           1259    27010    users_id_seq    SEQUENCE     v   CREATE SEQUENCE "@base".users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE "@base".users_id_seq;
       @base          postgres    false    257    14            �           0    0    users_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE "@base".users_id_seq OWNED BY "@base".users.id;
          @base          postgres    false    336            Q           1259    27012    phinxlog    TABLE     �   CREATE TABLE public.phinxlog (
    version bigint NOT NULL,
    migration_name character varying(100),
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    breakpoint boolean DEFAULT false NOT NULL
);
    DROP TABLE public.phinxlog;
       public            postgres    false            R           1259    27016    service    TABLE       CREATE TABLE public.service (
    id integer NOT NULL,
    service_name text NOT NULL,
    service text NOT NULL,
    date_start date,
    date_end date,
    digest_login text NOT NULL,
    digest_password text NOT NULL,
    status boolean,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer,
    fra_older_flag character varying(1) DEFAULT 'N'::character varying,
    CONSTRAINT service_digest_login_check CHECK ((digest_login <> ''::text)),
    CONSTRAINT service_digest_password_check CHECK ((digest_password <> ''::text)),
    CONSTRAINT service_service_check CHECK ((service <> ''::text)),
    CONSTRAINT service_service_name_check CHECK ((service_name <> ''::text))
);
    DROP TABLE public.service;
       public            postgres    false            �           0    0    COLUMN service.service_name    COMMENT     L   COMMENT ON COLUMN public.service.service_name IS 'text|ja:サービス名';
          public          postgres    false    338            �           0    0    COLUMN service.service    COMMENT     D   COMMENT ON COLUMN public.service.service IS 'text|ja:サービス';
          public          postgres    false    338            �           0    0    COLUMN service.date_start    COMMENT     J   COMMENT ON COLUMN public.service.date_start IS 'date|ja:利用開始日';
          public          postgres    false    338            �           0    0    COLUMN service.date_end    COMMENT     H   COMMENT ON COLUMN public.service.date_end IS 'text|ja:利用終了日';
          public          postgres    false    338            �           0    0    COLUMN service.digest_login    COMMENT     H   COMMENT ON COLUMN public.service.digest_login IS 'text|ja:管理者ID';
          public          postgres    false    338            �           0    0    COLUMN service.digest_password    COMMENT     X   COMMENT ON COLUMN public.service.digest_password IS 'text|ja:管理者パスワード';
          public          postgres    false    338            S           1259    27028    service_id_seq    SEQUENCE     w   CREATE SEQUENCE public.service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.service_id_seq;
       public          postgres    false    338            �           0    0    service_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.service_id_seq OWNED BY public.service.id;
          public          postgres    false    339            T           1259    27030    users    TABLE     $  CREATE TABLE public.users (
    id integer NOT NULL,
    user_name text NOT NULL,
    user_name_kana text NOT NULL,
    user_login text NOT NULL,
    password text,
    login_uuid text,
    last_login_time timestamp without time zone,
    last_ng_time timestamp without time zone,
    ng_count integer DEFAULT 0 NOT NULL,
    account_lock boolean DEFAULT false NOT NULL,
    status boolean DEFAULT true NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    createdid integer,
    modified timestamp without time zone DEFAULT now(),
    modifiedid integer,
    CONSTRAINT users_user_login_check CHECK ((user_login <> ''::text)),
    CONSTRAINT users_user_name_check CHECK ((user_name <> ''::text)),
    CONSTRAINT users_user_name_kana_check CHECK ((user_name_kana <> ''::text))
);
    DROP TABLE public.users;
       public            postgres    false            �           0    0    COLUMN users.user_name    COMMENT     H   COMMENT ON COLUMN public.users.user_name IS 'text|search|ja:職員名';
          public          postgres    false    340            �           0    0    COLUMN users.user_name_kana    COMMENT     S   COMMENT ON COLUMN public.users.user_name_kana IS 'text|search|ja:職員名カナ';
          public          postgres    false    340            �           0    0    COLUMN users.user_login    COMMENT     G   COMMENT ON COLUMN public.users.user_login IS 'text|ja:ログインID';
          public          postgres    false    340            �           0    0    COLUMN users.password    COMMENT     Q   COMMENT ON COLUMN public.users.password IS 'パスワード|ja:パスワード';
          public          postgres    false    340            �           0    0    COLUMN users.login_uuid    COMMENT     8   COMMENT ON COLUMN public.users.login_uuid IS 'ja:UUID';
          public          postgres    false    340                        0    0    COLUMN users.last_login_time    COMMENT     Q   COMMENT ON COLUMN public.users.last_login_time IS 'ja:最終ログイン時間';
          public          postgres    false    340                       0    0    COLUMN users.last_ng_time    COMMENT     N   COMMENT ON COLUMN public.users.last_ng_time IS 'ja:ログイン失敗時間';
          public          postgres    false    340                       0    0    COLUMN users.ng_count    COMMENT     J   COMMENT ON COLUMN public.users.ng_count IS 'ja:ログイン失敗回数';
          public          postgres    false    340                       0    0    COLUMN users.account_lock    COMMENT     _   COMMENT ON COLUMN public.users.account_lock IS 'checkbox:AR_bool|ja:アカウントロック';
          public          postgres    false    340            U           1259    27044    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    340                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    341                        2604    27046    areas id    DEFAULT     b   ALTER TABLE ONLY "1".areas ALTER COLUMN id SET DEFAULT nextval('"@base".areas_id_seq'::regclass);
 4   ALTER TABLE "1".areas ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    311    208            !           2604    27047    areas created    DEFAULT     C   ALTER TABLE ONLY "1".areas ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "1".areas ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    208            "           2604    27048    areas modified    DEFAULT     D   ALTER TABLE ONLY "1".areas ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "1".areas ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    208            (           2604    27049 
   centers id    DEFAULT     f   ALTER TABLE ONLY "1".centers ALTER COLUMN id SET DEFAULT nextval('"@base".centers_id_seq'::regclass);
 6   ALTER TABLE "1".centers ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    210    312            )           2604    27050    centers created    DEFAULT     E   ALTER TABLE ONLY "1".centers ALTER COLUMN created SET DEFAULT now();
 ;   ALTER TABLE "1".centers ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    210            *           2604    27051    centers modified    DEFAULT     F   ALTER TABLE ONLY "1".centers ALTER COLUMN modified SET DEFAULT now();
 <   ALTER TABLE "1".centers ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    210            1           2604    27052    patients id    DEFAULT     h   ALTER TABLE ONLY "1".patients ALTER COLUMN id SET DEFAULT nextval('"@base".patients_id_seq'::regclass);
 7   ALTER TABLE "1".patients ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    212    313            2           2604    27053    patients created    DEFAULT     F   ALTER TABLE ONLY "1".patients ALTER COLUMN created SET DEFAULT now();
 <   ALTER TABLE "1".patients ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    212            3           2604    27054    patients modified    DEFAULT     G   ALTER TABLE ONLY "1".patients ALTER COLUMN modified SET DEFAULT now();
 =   ALTER TABLE "1".patients ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    212            9           2604    27055    treating_patient_adl id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_adl_id_seq'::regclass);
 C   ALTER TABLE "1".treating_patient_adl ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    214    314            :           2604    27056    treating_patient_adl created    DEFAULT     R   ALTER TABLE ONLY "1".treating_patient_adl ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "1".treating_patient_adl ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    214            ;           2604    27057    treating_patient_adl modified    DEFAULT     S   ALTER TABLE ONLY "1".treating_patient_adl ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "1".treating_patient_adl ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    214            ?           2604    27058    treating_patient_basic_adl id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_basic_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_basic_adl_id_seq'::regclass);
 I   ALTER TABLE "1".treating_patient_basic_adl ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    216    315            @           2604    27059 "   treating_patient_basic_adl created    DEFAULT     X   ALTER TABLE ONLY "1".treating_patient_basic_adl ALTER COLUMN created SET DEFAULT now();
 N   ALTER TABLE "1".treating_patient_basic_adl ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    216            A           2604    27060 #   treating_patient_basic_adl modified    DEFAULT     Y   ALTER TABLE ONLY "1".treating_patient_basic_adl ALTER COLUMN modified SET DEFAULT now();
 O   ALTER TABLE "1".treating_patient_basic_adl ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    216            E           2604    27061    treating_patient_blood_sugar id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_blood_sugar ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_blood_sugar_id_seq'::regclass);
 K   ALTER TABLE "1".treating_patient_blood_sugar ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    316    218            F           2604    27062 $   treating_patient_blood_sugar created    DEFAULT     Z   ALTER TABLE ONLY "1".treating_patient_blood_sugar ALTER COLUMN created SET DEFAULT now();
 P   ALTER TABLE "1".treating_patient_blood_sugar ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    218            G           2604    27063 %   treating_patient_blood_sugar modified    DEFAULT     [   ALTER TABLE ONLY "1".treating_patient_blood_sugar ALTER COLUMN modified SET DEFAULT now();
 Q   ALTER TABLE "1".treating_patient_blood_sugar ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    218            K           2604    27064    treating_patient_cga7 id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_cga7 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_cga7_id_seq'::regclass);
 D   ALTER TABLE "1".treating_patient_cga7 ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    220    317            L           2604    27065    treating_patient_cga7 created    DEFAULT     S   ALTER TABLE ONLY "1".treating_patient_cga7 ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "1".treating_patient_cga7 ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    220            M           2604    27066    treating_patient_cga7 modified    DEFAULT     T   ALTER TABLE ONLY "1".treating_patient_cga7 ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "1".treating_patient_cga7 ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    220            Q           2604    27067 #   treating_patient_closure_sticker id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_closure_sticker ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_closure_sticker_id_seq'::regclass);
 O   ALTER TABLE "1".treating_patient_closure_sticker ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    318    222            R           2604    27068 (   treating_patient_closure_sticker created    DEFAULT     ^   ALTER TABLE ONLY "1".treating_patient_closure_sticker ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "1".treating_patient_closure_sticker ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    222            S           2604    27069 )   treating_patient_closure_sticker modified    DEFAULT     _   ALTER TABLE ONLY "1".treating_patient_closure_sticker ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "1".treating_patient_closure_sticker ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    222            W           2604    27070 !   treating_patient_comprehensive id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_comprehensive ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_comprehensive_id_seq'::regclass);
 M   ALTER TABLE "1".treating_patient_comprehensive ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    224    319            X           2604    27071 &   treating_patient_comprehensive created    DEFAULT     \   ALTER TABLE ONLY "1".treating_patient_comprehensive ALTER COLUMN created SET DEFAULT now();
 R   ALTER TABLE "1".treating_patient_comprehensive ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    224            Y           2604    27072 '   treating_patient_comprehensive modified    DEFAULT     ]   ALTER TABLE ONLY "1".treating_patient_comprehensive ALTER COLUMN modified SET DEFAULT now();
 S   ALTER TABLE "1".treating_patient_comprehensive ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    224            ]           2604    27073    treating_patient_dbd id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_dbd ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_dbd_id_seq'::regclass);
 C   ALTER TABLE "1".treating_patient_dbd ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    226    320            ^           2604    27074    treating_patient_dbd created    DEFAULT     R   ALTER TABLE ONLY "1".treating_patient_dbd ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "1".treating_patient_dbd ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    226            _           2604    27075    treating_patient_dbd modified    DEFAULT     S   ALTER TABLE ONLY "1".treating_patient_dbd ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "1".treating_patient_dbd ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    226            c           2604    27076    treating_patient_fra id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_fra ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_id_seq'::regclass);
 C   ALTER TABLE "1".treating_patient_fra ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    228    323            d           2604    27077    treating_patient_fra created    DEFAULT     R   ALTER TABLE ONLY "1".treating_patient_fra ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "1".treating_patient_fra ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    228            e           2604    27078    treating_patient_fra modified    DEFAULT     S   ALTER TABLE ONLY "1".treating_patient_fra ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "1".treating_patient_fra ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    228            i           2604    27079    treating_patient_fra_a id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_fra_a ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_a_id_seq'::regclass);
 E   ALTER TABLE "1".treating_patient_fra_a ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    230    321            j           2604    27080    treating_patient_fra_a created    DEFAULT     T   ALTER TABLE ONLY "1".treating_patient_fra_a ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "1".treating_patient_fra_a ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    230            k           2604    27081    treating_patient_fra_a modified    DEFAULT     U   ALTER TABLE ONLY "1".treating_patient_fra_a ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "1".treating_patient_fra_a ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    230            o           2604    27082    treating_patient_fra_b id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_fra_b ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_b_id_seq'::regclass);
 E   ALTER TABLE "1".treating_patient_fra_b ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    232    322            p           2604    27083    treating_patient_fra_b created    DEFAULT     T   ALTER TABLE ONLY "1".treating_patient_fra_b ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "1".treating_patient_fra_b ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    232            q           2604    27084    treating_patient_fra_b modified    DEFAULT     U   ALTER TABLE ONLY "1".treating_patient_fra_b ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "1".treating_patient_fra_b ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    232            u           2604    27085    treating_patient_gds15 id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_gds15 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_gds15_id_seq'::regclass);
 E   ALTER TABLE "1".treating_patient_gds15 ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    234    324            v           2604    27086    treating_patient_gds15 created    DEFAULT     T   ALTER TABLE ONLY "1".treating_patient_gds15 ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "1".treating_patient_gds15 ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    234            w           2604    27087    treating_patient_gds15 modified    DEFAULT     U   ALTER TABLE ONLY "1".treating_patient_gds15 ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "1".treating_patient_gds15 ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    234            {           2604    27088    treating_patient_hdsr id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_hdsr ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_hdsr_id_seq'::regclass);
 D   ALTER TABLE "1".treating_patient_hdsr ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    236    325            |           2604    27089    treating_patient_hdsr created    DEFAULT     S   ALTER TABLE ONLY "1".treating_patient_hdsr ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "1".treating_patient_hdsr ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    236            }           2604    27090    treating_patient_hdsr modified    DEFAULT     T   ALTER TABLE ONLY "1".treating_patient_hdsr ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "1".treating_patient_hdsr ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    236            �           2604    27091     treating_patient_instrumental id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_instrumental ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_instrumental_id_seq'::regclass);
 L   ALTER TABLE "1".treating_patient_instrumental ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    238    326            �           2604    27092 %   treating_patient_instrumental created    DEFAULT     [   ALTER TABLE ONLY "1".treating_patient_instrumental ALTER COLUMN created SET DEFAULT now();
 Q   ALTER TABLE "1".treating_patient_instrumental ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    238            �           2604    27093 &   treating_patient_instrumental modified    DEFAULT     \   ALTER TABLE ONLY "1".treating_patient_instrumental ALTER COLUMN modified SET DEFAULT now();
 R   ALTER TABLE "1".treating_patient_instrumental ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    238            �           2604    27094    treating_patient_mmse id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_mmse ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mmse_id_seq'::regclass);
 D   ALTER TABLE "1".treating_patient_mmse ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    240    327            �           2604    27095    treating_patient_mmse created    DEFAULT     S   ALTER TABLE ONLY "1".treating_patient_mmse ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "1".treating_patient_mmse ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    240            �           2604    27096    treating_patient_mmse modified    DEFAULT     T   ALTER TABLE ONLY "1".treating_patient_mmse ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "1".treating_patient_mmse ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    240            �           2604    27676    treating_patient_mmse img12    DEFAULT     T   ALTER TABLE ONLY "1".treating_patient_mmse ALTER COLUMN img12 SET DEFAULT ''::text;
 G   ALTER TABLE "1".treating_patient_mmse ALTER COLUMN img12 DROP DEFAULT;
       1          postgres    false    240            �           2604    27705    treating_patient_mmse img14    DEFAULT     T   ALTER TABLE ONLY "1".treating_patient_mmse ALTER COLUMN img14 SET DEFAULT ''::text;
 G   ALTER TABLE "1".treating_patient_mmse ALTER COLUMN img14 DROP DEFAULT;
       1          postgres    false    240            �           2604    27734    treating_patient_mmse img12_out    DEFAULT     X   ALTER TABLE ONLY "1".treating_patient_mmse ALTER COLUMN img12_out SET DEFAULT ''::text;
 K   ALTER TABLE "1".treating_patient_mmse ALTER COLUMN img12_out DROP DEFAULT;
       1          postgres    false    240            �           2604    27763    treating_patient_mmse img14_out    DEFAULT     X   ALTER TABLE ONLY "1".treating_patient_mmse ALTER COLUMN img14_out SET DEFAULT ''::text;
 K   ALTER TABLE "1".treating_patient_mmse ALTER COLUMN img14_out DROP DEFAULT;
       1          postgres    false    240            �           2604    27097    treating_patient_mna id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_mna ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mna_id_seq'::regclass);
 C   ALTER TABLE "1".treating_patient_mna ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    328    242            �           2604    27098    treating_patient_mna created    DEFAULT     R   ALTER TABLE ONLY "1".treating_patient_mna ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "1".treating_patient_mna ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    242            �           2604    27099    treating_patient_mna modified    DEFAULT     S   ALTER TABLE ONLY "1".treating_patient_mna ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "1".treating_patient_mna ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    242            �           2604    27100    treating_patient_qol_pgc id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_qol_pgc ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_pgc_id_seq'::regclass);
 G   ALTER TABLE "1".treating_patient_qol_pgc ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    329    244            �           2604    27101     treating_patient_qol_pgc created    DEFAULT     V   ALTER TABLE ONLY "1".treating_patient_qol_pgc ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "1".treating_patient_qol_pgc ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    244            �           2604    27102 !   treating_patient_qol_pgc modified    DEFAULT     W   ALTER TABLE ONLY "1".treating_patient_qol_pgc ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "1".treating_patient_qol_pgc ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    244            �           2604    27103    treating_patient_qol_sf8 id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_qol_sf8 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_sf8_id_seq'::regclass);
 G   ALTER TABLE "1".treating_patient_qol_sf8 ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    246    330            �           2604    27104     treating_patient_qol_sf8 created    DEFAULT     V   ALTER TABLE ONLY "1".treating_patient_qol_sf8 ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "1".treating_patient_qol_sf8 ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    246            �           2604    27105 !   treating_patient_qol_sf8 modified    DEFAULT     W   ALTER TABLE ONLY "1".treating_patient_qol_sf8 ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "1".treating_patient_qol_sf8 ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    246            �           2604    27106    treating_patient_sarcopenia id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_sarcopenia ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_id_seq'::regclass);
 J   ALTER TABLE "1".treating_patient_sarcopenia ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    331    248            �           2604    27107 #   treating_patient_sarcopenia created    DEFAULT     Y   ALTER TABLE ONLY "1".treating_patient_sarcopenia ALTER COLUMN created SET DEFAULT now();
 O   ALTER TABLE "1".treating_patient_sarcopenia ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    248            �           2604    27108 $   treating_patient_sarcopenia modified    DEFAULT     Z   ALTER TABLE ONLY "1".treating_patient_sarcopenia ALTER COLUMN modified SET DEFAULT now();
 P   ALTER TABLE "1".treating_patient_sarcopenia ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    248            �           2604    27109 #   treating_patient_sarcopenia_loco id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_sarcopenia_loco ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_loco_id_seq'::regclass);
 O   ALTER TABLE "1".treating_patient_sarcopenia_loco ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    250    332            �           2604    27110 (   treating_patient_sarcopenia_loco created    DEFAULT     ^   ALTER TABLE ONLY "1".treating_patient_sarcopenia_loco ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "1".treating_patient_sarcopenia_loco ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    250            �           2604    27111 )   treating_patient_sarcopenia_loco modified    DEFAULT     _   ALTER TABLE ONLY "1".treating_patient_sarcopenia_loco ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "1".treating_patient_sarcopenia_loco ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    250                       2604    72224    treating_patient_senion id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_senion ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "1".treating_patient_senion ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    526    524                       2604    72225    treating_patient_senion created    DEFAULT     U   ALTER TABLE ONLY "1".treating_patient_senion ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "1".treating_patient_senion ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    526                       2604    72226     treating_patient_senion modified    DEFAULT     V   ALTER TABLE ONLY "1".treating_patient_senion ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "1".treating_patient_senion ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    526            =           2604    72338    treating_patient_senior id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_senior ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "1".treating_patient_senior ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    524    545            >           2604    72339    treating_patient_senior created    DEFAULT     U   ALTER TABLE ONLY "1".treating_patient_senior ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "1".treating_patient_senior ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    545            ?           2604    72340     treating_patient_senior modified    DEFAULT     V   ALTER TABLE ONLY "1".treating_patient_senior ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "1".treating_patient_senior ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    545            �           2604    27112    treating_patient_vitality id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_vitality ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_vitality_id_seq'::regclass);
 H   ALTER TABLE "1".treating_patient_vitality ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    252    333            �           2604    27113 !   treating_patient_vitality created    DEFAULT     W   ALTER TABLE ONLY "1".treating_patient_vitality ALTER COLUMN created SET DEFAULT now();
 M   ALTER TABLE "1".treating_patient_vitality ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    252            �           2604    27114 "   treating_patient_vitality modified    DEFAULT     X   ALTER TABLE ONLY "1".treating_patient_vitality ALTER COLUMN modified SET DEFAULT now();
 N   ALTER TABLE "1".treating_patient_vitality ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    252            �           2604    27115    treating_patient_zarit id    DEFAULT     �   ALTER TABLE ONLY "1".treating_patient_zarit ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_zarit_id_seq'::regclass);
 E   ALTER TABLE "1".treating_patient_zarit ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    254    334            �           2604    27116    treating_patient_zarit created    DEFAULT     T   ALTER TABLE ONLY "1".treating_patient_zarit ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "1".treating_patient_zarit ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    254            �           2604    27117    treating_patient_zarit modified    DEFAULT     U   ALTER TABLE ONLY "1".treating_patient_zarit ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "1".treating_patient_zarit ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    254            �           2604    27118    treating_patients id    DEFAULT     z   ALTER TABLE ONLY "1".treating_patients ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patients_id_seq'::regclass);
 @   ALTER TABLE "1".treating_patients ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    335    256            �           2604    27119    treating_patients created    DEFAULT     O   ALTER TABLE ONLY "1".treating_patients ALTER COLUMN created SET DEFAULT now();
 E   ALTER TABLE "1".treating_patients ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    256            �           2604    27120    treating_patients modified    DEFAULT     P   ALTER TABLE ONLY "1".treating_patients ALTER COLUMN modified SET DEFAULT now();
 F   ALTER TABLE "1".treating_patients ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    256            �           2604    27121    users id    DEFAULT     b   ALTER TABLE ONLY "1".users ALTER COLUMN id SET DEFAULT nextval('"@base".users_id_seq'::regclass);
 4   ALTER TABLE "1".users ALTER COLUMN id DROP DEFAULT;
       1          postgres    false    336    258            �           2604    27122    users is_super_admin    DEFAULT     J   ALTER TABLE ONLY "1".users ALTER COLUMN is_super_admin SET DEFAULT false;
 @   ALTER TABLE "1".users ALTER COLUMN is_super_admin DROP DEFAULT;
       1          postgres    false    258            �           2604    27123    users created    DEFAULT     C   ALTER TABLE ONLY "1".users ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "1".users ALTER COLUMN created DROP DEFAULT;
       1          postgres    false    258            �           2604    27124    users modified    DEFAULT     D   ALTER TABLE ONLY "1".users ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "1".users ALTER COLUMN modified DROP DEFAULT;
       1          postgres    false    258            �           2604    50525    areas id    DEFAULT     c   ALTER TABLE ONLY "10".areas ALTER COLUMN id SET DEFAULT nextval('"@base".areas_id_seq'::regclass);
 5   ALTER TABLE "10".areas ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    506    311            �           2604    50526    areas created    DEFAULT     D   ALTER TABLE ONLY "10".areas ALTER COLUMN created SET DEFAULT now();
 :   ALTER TABLE "10".areas ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    506            �           2604    50527    areas modified    DEFAULT     E   ALTER TABLE ONLY "10".areas ALTER COLUMN modified SET DEFAULT now();
 ;   ALTER TABLE "10".areas ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    506            �           2604    50515 
   centers id    DEFAULT     g   ALTER TABLE ONLY "10".centers ALTER COLUMN id SET DEFAULT nextval('"@base".centers_id_seq'::regclass);
 7   ALTER TABLE "10".centers ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    505    312            �           2604    50516    centers created    DEFAULT     F   ALTER TABLE ONLY "10".centers ALTER COLUMN created SET DEFAULT now();
 <   ALTER TABLE "10".centers ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    505            �           2604    50517    centers modified    DEFAULT     G   ALTER TABLE ONLY "10".centers ALTER COLUMN modified SET DEFAULT now();
 =   ALTER TABLE "10".centers ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    505            �           2604    50625    patients id    DEFAULT     i   ALTER TABLE ONLY "10".patients ALTER COLUMN id SET DEFAULT nextval('"@base".patients_id_seq'::regclass);
 8   ALTER TABLE "10".patients ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    522    313            �           2604    50626    patients created    DEFAULT     G   ALTER TABLE ONLY "10".patients ALTER COLUMN created SET DEFAULT now();
 =   ALTER TABLE "10".patients ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    522            �           2604    50627    patients modified    DEFAULT     H   ALTER TABLE ONLY "10".patients ALTER COLUMN modified SET DEFAULT now();
 >   ALTER TABLE "10".patients ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    522            �           2604    50619    treating_patient_adl id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_adl_id_seq'::regclass);
 D   ALTER TABLE "10".treating_patient_adl ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    521    314            �           2604    50620    treating_patient_adl created    DEFAULT     S   ALTER TABLE ONLY "10".treating_patient_adl ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "10".treating_patient_adl ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    521            �           2604    50621    treating_patient_adl modified    DEFAULT     T   ALTER TABLE ONLY "10".treating_patient_adl ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "10".treating_patient_adl ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    521            �           2604    50613    treating_patient_basic_adl id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_basic_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_basic_adl_id_seq'::regclass);
 J   ALTER TABLE "10".treating_patient_basic_adl ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    315    520            �           2604    50614 "   treating_patient_basic_adl created    DEFAULT     Y   ALTER TABLE ONLY "10".treating_patient_basic_adl ALTER COLUMN created SET DEFAULT now();
 O   ALTER TABLE "10".treating_patient_basic_adl ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    520            �           2604    50615 #   treating_patient_basic_adl modified    DEFAULT     Z   ALTER TABLE ONLY "10".treating_patient_basic_adl ALTER COLUMN modified SET DEFAULT now();
 P   ALTER TABLE "10".treating_patient_basic_adl ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    520            �           2604    50635    treating_patient_blood_sugar id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_blood_sugar ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_blood_sugar_id_seq'::regclass);
 L   ALTER TABLE "10".treating_patient_blood_sugar ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    523    316            �           2604    50636 $   treating_patient_blood_sugar created    DEFAULT     [   ALTER TABLE ONLY "10".treating_patient_blood_sugar ALTER COLUMN created SET DEFAULT now();
 Q   ALTER TABLE "10".treating_patient_blood_sugar ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    523                        2604    50637 %   treating_patient_blood_sugar modified    DEFAULT     \   ALTER TABLE ONLY "10".treating_patient_blood_sugar ALTER COLUMN modified SET DEFAULT now();
 R   ALTER TABLE "10".treating_patient_blood_sugar ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    523            �           2604    50607    treating_patient_cga7 id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_cga7 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_cga7_id_seq'::regclass);
 E   ALTER TABLE "10".treating_patient_cga7 ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    519    317            �           2604    50608    treating_patient_cga7 created    DEFAULT     T   ALTER TABLE ONLY "10".treating_patient_cga7 ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "10".treating_patient_cga7 ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    519            �           2604    50609    treating_patient_cga7 modified    DEFAULT     U   ALTER TABLE ONLY "10".treating_patient_cga7 ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "10".treating_patient_cga7 ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    519            �           2604    50601 #   treating_patient_closure_sticker id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_closure_sticker ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_closure_sticker_id_seq'::regclass);
 P   ALTER TABLE "10".treating_patient_closure_sticker ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    518    318            �           2604    50602 (   treating_patient_closure_sticker created    DEFAULT     _   ALTER TABLE ONLY "10".treating_patient_closure_sticker ALTER COLUMN created SET DEFAULT now();
 U   ALTER TABLE "10".treating_patient_closure_sticker ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    518            �           2604    50603 )   treating_patient_closure_sticker modified    DEFAULT     `   ALTER TABLE ONLY "10".treating_patient_closure_sticker ALTER COLUMN modified SET DEFAULT now();
 V   ALTER TABLE "10".treating_patient_closure_sticker ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    518            �           2604    50595 !   treating_patient_comprehensive id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_comprehensive ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_comprehensive_id_seq'::regclass);
 N   ALTER TABLE "10".treating_patient_comprehensive ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    517    319            �           2604    50596 &   treating_patient_comprehensive created    DEFAULT     ]   ALTER TABLE ONLY "10".treating_patient_comprehensive ALTER COLUMN created SET DEFAULT now();
 S   ALTER TABLE "10".treating_patient_comprehensive ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    517            �           2604    50597 '   treating_patient_comprehensive modified    DEFAULT     ^   ALTER TABLE ONLY "10".treating_patient_comprehensive ALTER COLUMN modified SET DEFAULT now();
 T   ALTER TABLE "10".treating_patient_comprehensive ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    517            �           2604    50589    treating_patient_dbd id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_dbd ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_dbd_id_seq'::regclass);
 D   ALTER TABLE "10".treating_patient_dbd ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    516    320            �           2604    50590    treating_patient_dbd created    DEFAULT     S   ALTER TABLE ONLY "10".treating_patient_dbd ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "10".treating_patient_dbd ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    516            �           2604    50591    treating_patient_dbd modified    DEFAULT     T   ALTER TABLE ONLY "10".treating_patient_dbd ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "10".treating_patient_dbd ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    516            �           2604    50583    treating_patient_fra id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_fra ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_id_seq'::regclass);
 D   ALTER TABLE "10".treating_patient_fra ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    515    323            �           2604    50584    treating_patient_fra created    DEFAULT     S   ALTER TABLE ONLY "10".treating_patient_fra ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "10".treating_patient_fra ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    515            �           2604    50585    treating_patient_fra modified    DEFAULT     T   ALTER TABLE ONLY "10".treating_patient_fra ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "10".treating_patient_fra ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    515            �           2604    50577    treating_patient_fra_a id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_fra_a ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_a_id_seq'::regclass);
 F   ALTER TABLE "10".treating_patient_fra_a ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    514    321            �           2604    50578    treating_patient_fra_a created    DEFAULT     U   ALTER TABLE ONLY "10".treating_patient_fra_a ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "10".treating_patient_fra_a ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    514            �           2604    50579    treating_patient_fra_a modified    DEFAULT     V   ALTER TABLE ONLY "10".treating_patient_fra_a ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "10".treating_patient_fra_a ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    514            �           2604    50571    treating_patient_fra_b id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_fra_b ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_b_id_seq'::regclass);
 F   ALTER TABLE "10".treating_patient_fra_b ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    322    513            �           2604    50572    treating_patient_fra_b created    DEFAULT     U   ALTER TABLE ONLY "10".treating_patient_fra_b ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "10".treating_patient_fra_b ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    513            �           2604    50573    treating_patient_fra_b modified    DEFAULT     V   ALTER TABLE ONLY "10".treating_patient_fra_b ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "10".treating_patient_fra_b ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    513            �           2604    50509    treating_patient_gds15 id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_gds15 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_gds15_id_seq'::regclass);
 F   ALTER TABLE "10".treating_patient_gds15 ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    324    504            �           2604    50510    treating_patient_gds15 created    DEFAULT     U   ALTER TABLE ONLY "10".treating_patient_gds15 ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "10".treating_patient_gds15 ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    504            �           2604    50511    treating_patient_gds15 modified    DEFAULT     V   ALTER TABLE ONLY "10".treating_patient_gds15 ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "10".treating_patient_gds15 ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    504            �           2604    50500    treating_patient_hdsr id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_hdsr ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_hdsr_id_seq'::regclass);
 E   ALTER TABLE "10".treating_patient_hdsr ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    503    325            �           2604    50501    treating_patient_hdsr created    DEFAULT     T   ALTER TABLE ONLY "10".treating_patient_hdsr ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "10".treating_patient_hdsr ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    503            �           2604    50502    treating_patient_hdsr modified    DEFAULT     U   ALTER TABLE ONLY "10".treating_patient_hdsr ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "10".treating_patient_hdsr ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    503            �           2604    50491     treating_patient_instrumental id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_instrumental ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_instrumental_id_seq'::regclass);
 M   ALTER TABLE "10".treating_patient_instrumental ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    326    502            �           2604    50492 %   treating_patient_instrumental created    DEFAULT     \   ALTER TABLE ONLY "10".treating_patient_instrumental ALTER COLUMN created SET DEFAULT now();
 R   ALTER TABLE "10".treating_patient_instrumental ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    502            �           2604    50493 &   treating_patient_instrumental modified    DEFAULT     ]   ALTER TABLE ONLY "10".treating_patient_instrumental ALTER COLUMN modified SET DEFAULT now();
 S   ALTER TABLE "10".treating_patient_instrumental ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    502            �           2604    50454    treating_patient_mmse id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_mmse ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mmse_id_seq'::regclass);
 E   ALTER TABLE "10".treating_patient_mmse ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    498    327            �           2604    50455    treating_patient_mmse created    DEFAULT     T   ALTER TABLE ONLY "10".treating_patient_mmse ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "10".treating_patient_mmse ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    498            �           2604    50456    treating_patient_mmse modified    DEFAULT     U   ALTER TABLE ONLY "10".treating_patient_mmse ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "10".treating_patient_mmse ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    498            �           2604    50457    treating_patient_mmse img12    DEFAULT     U   ALTER TABLE ONLY "10".treating_patient_mmse ALTER COLUMN img12 SET DEFAULT ''::text;
 H   ALTER TABLE "10".treating_patient_mmse ALTER COLUMN img12 DROP DEFAULT;
       10          postgres    false    498            �           2604    50458    treating_patient_mmse img14    DEFAULT     U   ALTER TABLE ONLY "10".treating_patient_mmse ALTER COLUMN img14 SET DEFAULT ''::text;
 H   ALTER TABLE "10".treating_patient_mmse ALTER COLUMN img14 DROP DEFAULT;
       10          postgres    false    498            �           2604    50459    treating_patient_mmse img12_out    DEFAULT     Y   ALTER TABLE ONLY "10".treating_patient_mmse ALTER COLUMN img12_out SET DEFAULT ''::text;
 L   ALTER TABLE "10".treating_patient_mmse ALTER COLUMN img12_out DROP DEFAULT;
       10          postgres    false    498            �           2604    50460    treating_patient_mmse img14_out    DEFAULT     Y   ALTER TABLE ONLY "10".treating_patient_mmse ALTER COLUMN img14_out SET DEFAULT ''::text;
 L   ALTER TABLE "10".treating_patient_mmse ALTER COLUMN img14_out DROP DEFAULT;
       10          postgres    false    498            �           2604    50479    treating_patient_mna id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_mna ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mna_id_seq'::regclass);
 D   ALTER TABLE "10".treating_patient_mna ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    500    328            �           2604    50480    treating_patient_mna created    DEFAULT     S   ALTER TABLE ONLY "10".treating_patient_mna ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "10".treating_patient_mna ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    500            �           2604    50481    treating_patient_mna modified    DEFAULT     T   ALTER TABLE ONLY "10".treating_patient_mna ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "10".treating_patient_mna ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    500            �           2604    50565    treating_patient_qol_pgc id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_qol_pgc ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_pgc_id_seq'::regclass);
 H   ALTER TABLE "10".treating_patient_qol_pgc ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    512    329            �           2604    50566     treating_patient_qol_pgc created    DEFAULT     W   ALTER TABLE ONLY "10".treating_patient_qol_pgc ALTER COLUMN created SET DEFAULT now();
 M   ALTER TABLE "10".treating_patient_qol_pgc ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    512            �           2604    50567 !   treating_patient_qol_pgc modified    DEFAULT     X   ALTER TABLE ONLY "10".treating_patient_qol_pgc ALTER COLUMN modified SET DEFAULT now();
 N   ALTER TABLE "10".treating_patient_qol_pgc ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    512            �           2604    50559    treating_patient_qol_sf8 id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_qol_sf8 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_sf8_id_seq'::regclass);
 H   ALTER TABLE "10".treating_patient_qol_sf8 ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    511    330            �           2604    50560     treating_patient_qol_sf8 created    DEFAULT     W   ALTER TABLE ONLY "10".treating_patient_qol_sf8 ALTER COLUMN created SET DEFAULT now();
 M   ALTER TABLE "10".treating_patient_qol_sf8 ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    511            �           2604    50561 !   treating_patient_qol_sf8 modified    DEFAULT     X   ALTER TABLE ONLY "10".treating_patient_qol_sf8 ALTER COLUMN modified SET DEFAULT now();
 N   ALTER TABLE "10".treating_patient_qol_sf8 ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    511            �           2604    50553    treating_patient_sarcopenia id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_sarcopenia ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_id_seq'::regclass);
 K   ALTER TABLE "10".treating_patient_sarcopenia ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    331    510            �           2604    50554 #   treating_patient_sarcopenia created    DEFAULT     Z   ALTER TABLE ONLY "10".treating_patient_sarcopenia ALTER COLUMN created SET DEFAULT now();
 P   ALTER TABLE "10".treating_patient_sarcopenia ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    510            �           2604    50555 $   treating_patient_sarcopenia modified    DEFAULT     [   ALTER TABLE ONLY "10".treating_patient_sarcopenia ALTER COLUMN modified SET DEFAULT now();
 Q   ALTER TABLE "10".treating_patient_sarcopenia ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    510            �           2604    50547 #   treating_patient_sarcopenia_loco id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_sarcopenia_loco ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_loco_id_seq'::regclass);
 P   ALTER TABLE "10".treating_patient_sarcopenia_loco ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    332    509            �           2604    50548 (   treating_patient_sarcopenia_loco created    DEFAULT     _   ALTER TABLE ONLY "10".treating_patient_sarcopenia_loco ALTER COLUMN created SET DEFAULT now();
 U   ALTER TABLE "10".treating_patient_sarcopenia_loco ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    509            �           2604    50549 )   treating_patient_sarcopenia_loco modified    DEFAULT     `   ALTER TABLE ONLY "10".treating_patient_sarcopenia_loco ALTER COLUMN modified SET DEFAULT now();
 V   ALTER TABLE "10".treating_patient_sarcopenia_loco ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    509                       2604    72278    treating_patient_senion id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_senion ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 G   ALTER TABLE "10".treating_patient_senion ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    535    524                        2604    72279    treating_patient_senion created    DEFAULT     V   ALTER TABLE ONLY "10".treating_patient_senion ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "10".treating_patient_senion ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    535            !           2604    72280     treating_patient_senion modified    DEFAULT     W   ALTER TABLE ONLY "10".treating_patient_senion ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "10".treating_patient_senion ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    535            "           2604    72284    treating_patient_senior id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_senior ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 G   ALTER TABLE "10".treating_patient_senior ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    536    524            #           2604    72285    treating_patient_senior created    DEFAULT     V   ALTER TABLE ONLY "10".treating_patient_senior ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "10".treating_patient_senior ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    536            $           2604    72286     treating_patient_senior modified    DEFAULT     W   ALTER TABLE ONLY "10".treating_patient_senior ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "10".treating_patient_senior ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    536            �           2604    50541    treating_patient_vitality id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_vitality ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_vitality_id_seq'::regclass);
 I   ALTER TABLE "10".treating_patient_vitality ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    333    508            �           2604    50542 !   treating_patient_vitality created    DEFAULT     X   ALTER TABLE ONLY "10".treating_patient_vitality ALTER COLUMN created SET DEFAULT now();
 N   ALTER TABLE "10".treating_patient_vitality ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    508            �           2604    50543 "   treating_patient_vitality modified    DEFAULT     Y   ALTER TABLE ONLY "10".treating_patient_vitality ALTER COLUMN modified SET DEFAULT now();
 O   ALTER TABLE "10".treating_patient_vitality ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    508            �           2604    50535    treating_patient_zarit id    DEFAULT     �   ALTER TABLE ONLY "10".treating_patient_zarit ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_zarit_id_seq'::regclass);
 F   ALTER TABLE "10".treating_patient_zarit ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    334    507            �           2604    50536    treating_patient_zarit created    DEFAULT     U   ALTER TABLE ONLY "10".treating_patient_zarit ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "10".treating_patient_zarit ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    507            �           2604    50537    treating_patient_zarit modified    DEFAULT     V   ALTER TABLE ONLY "10".treating_patient_zarit ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "10".treating_patient_zarit ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    507            �           2604    50485    treating_patients id    DEFAULT     {   ALTER TABLE ONLY "10".treating_patients ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patients_id_seq'::regclass);
 A   ALTER TABLE "10".treating_patients ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    501    335            �           2604    50486    treating_patients created    DEFAULT     P   ALTER TABLE ONLY "10".treating_patients ALTER COLUMN created SET DEFAULT now();
 F   ALTER TABLE "10".treating_patients ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    501            �           2604    50487    treating_patients modified    DEFAULT     Q   ALTER TABLE ONLY "10".treating_patients ALTER COLUMN modified SET DEFAULT now();
 G   ALTER TABLE "10".treating_patients ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    501            �           2604    50467    users id    DEFAULT     c   ALTER TABLE ONLY "10".users ALTER COLUMN id SET DEFAULT nextval('"@base".users_id_seq'::regclass);
 5   ALTER TABLE "10".users ALTER COLUMN id DROP DEFAULT;
       10          postgres    false    499    336            �           2604    50468    users is_super_admin    DEFAULT     K   ALTER TABLE ONLY "10".users ALTER COLUMN is_super_admin SET DEFAULT false;
 A   ALTER TABLE "10".users ALTER COLUMN is_super_admin DROP DEFAULT;
       10          postgres    false    499            �           2604    50469    users created    DEFAULT     D   ALTER TABLE ONLY "10".users ALTER COLUMN created SET DEFAULT now();
 :   ALTER TABLE "10".users ALTER COLUMN created DROP DEFAULT;
       10          postgres    false    499            �           2604    50470    users modified    DEFAULT     E   ALTER TABLE ONLY "10".users ALTER COLUMN modified SET DEFAULT now();
 ;   ALTER TABLE "10".users ALTER COLUMN modified DROP DEFAULT;
       10          postgres    false    499            �           2604    27125    areas id    DEFAULT     b   ALTER TABLE ONLY "2".areas ALTER COLUMN id SET DEFAULT nextval('"@base".areas_id_seq'::regclass);
 4   ALTER TABLE "2".areas ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    259    311            �           2604    27126    areas created    DEFAULT     C   ALTER TABLE ONLY "2".areas ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "2".areas ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    259            �           2604    27127    areas modified    DEFAULT     D   ALTER TABLE ONLY "2".areas ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "2".areas ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    259            �           2604    27128 
   centers id    DEFAULT     f   ALTER TABLE ONLY "2".centers ALTER COLUMN id SET DEFAULT nextval('"@base".centers_id_seq'::regclass);
 6   ALTER TABLE "2".centers ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    260    312            �           2604    27129    centers created    DEFAULT     E   ALTER TABLE ONLY "2".centers ALTER COLUMN created SET DEFAULT now();
 ;   ALTER TABLE "2".centers ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    260            �           2604    27130    centers modified    DEFAULT     F   ALTER TABLE ONLY "2".centers ALTER COLUMN modified SET DEFAULT now();
 <   ALTER TABLE "2".centers ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    260            �           2604    27131    patients id    DEFAULT     h   ALTER TABLE ONLY "2".patients ALTER COLUMN id SET DEFAULT nextval('"@base".patients_id_seq'::regclass);
 7   ALTER TABLE "2".patients ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    261    313            �           2604    27132    patients created    DEFAULT     F   ALTER TABLE ONLY "2".patients ALTER COLUMN created SET DEFAULT now();
 <   ALTER TABLE "2".patients ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    261            �           2604    27133    patients modified    DEFAULT     G   ALTER TABLE ONLY "2".patients ALTER COLUMN modified SET DEFAULT now();
 =   ALTER TABLE "2".patients ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    261            �           2604    27134    treating_patient_adl id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_adl_id_seq'::regclass);
 C   ALTER TABLE "2".treating_patient_adl ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    262    314            �           2604    27135    treating_patient_adl created    DEFAULT     R   ALTER TABLE ONLY "2".treating_patient_adl ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "2".treating_patient_adl ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    262            �           2604    27136    treating_patient_adl modified    DEFAULT     S   ALTER TABLE ONLY "2".treating_patient_adl ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "2".treating_patient_adl ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    262            �           2604    27137    treating_patient_basic_adl id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_basic_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_basic_adl_id_seq'::regclass);
 I   ALTER TABLE "2".treating_patient_basic_adl ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    263    315            �           2604    27138 "   treating_patient_basic_adl created    DEFAULT     X   ALTER TABLE ONLY "2".treating_patient_basic_adl ALTER COLUMN created SET DEFAULT now();
 N   ALTER TABLE "2".treating_patient_basic_adl ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    263            �           2604    27139 #   treating_patient_basic_adl modified    DEFAULT     Y   ALTER TABLE ONLY "2".treating_patient_basic_adl ALTER COLUMN modified SET DEFAULT now();
 O   ALTER TABLE "2".treating_patient_basic_adl ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    263            �           2604    27140    treating_patient_blood_sugar id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_blood_sugar ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_blood_sugar_id_seq'::regclass);
 K   ALTER TABLE "2".treating_patient_blood_sugar ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    316    264            �           2604    27141 $   treating_patient_blood_sugar created    DEFAULT     Z   ALTER TABLE ONLY "2".treating_patient_blood_sugar ALTER COLUMN created SET DEFAULT now();
 P   ALTER TABLE "2".treating_patient_blood_sugar ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    264            �           2604    27142 %   treating_patient_blood_sugar modified    DEFAULT     [   ALTER TABLE ONLY "2".treating_patient_blood_sugar ALTER COLUMN modified SET DEFAULT now();
 Q   ALTER TABLE "2".treating_patient_blood_sugar ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    264            �           2604    27143    treating_patient_cga7 id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_cga7 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_cga7_id_seq'::regclass);
 D   ALTER TABLE "2".treating_patient_cga7 ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    317    265            �           2604    27144    treating_patient_cga7 created    DEFAULT     S   ALTER TABLE ONLY "2".treating_patient_cga7 ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "2".treating_patient_cga7 ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    265            �           2604    27145    treating_patient_cga7 modified    DEFAULT     T   ALTER TABLE ONLY "2".treating_patient_cga7 ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "2".treating_patient_cga7 ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    265            �           2604    27146 #   treating_patient_closure_sticker id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_closure_sticker ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_closure_sticker_id_seq'::regclass);
 O   ALTER TABLE "2".treating_patient_closure_sticker ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    266    318            �           2604    27147 (   treating_patient_closure_sticker created    DEFAULT     ^   ALTER TABLE ONLY "2".treating_patient_closure_sticker ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "2".treating_patient_closure_sticker ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    266            �           2604    27148 )   treating_patient_closure_sticker modified    DEFAULT     _   ALTER TABLE ONLY "2".treating_patient_closure_sticker ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "2".treating_patient_closure_sticker ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    266            �           2604    27149 !   treating_patient_comprehensive id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_comprehensive ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_comprehensive_id_seq'::regclass);
 M   ALTER TABLE "2".treating_patient_comprehensive ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    267    319            �           2604    27150 &   treating_patient_comprehensive created    DEFAULT     \   ALTER TABLE ONLY "2".treating_patient_comprehensive ALTER COLUMN created SET DEFAULT now();
 R   ALTER TABLE "2".treating_patient_comprehensive ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    267            �           2604    27151 '   treating_patient_comprehensive modified    DEFAULT     ]   ALTER TABLE ONLY "2".treating_patient_comprehensive ALTER COLUMN modified SET DEFAULT now();
 S   ALTER TABLE "2".treating_patient_comprehensive ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    267            �           2604    27152    treating_patient_dbd id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_dbd ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_dbd_id_seq'::regclass);
 C   ALTER TABLE "2".treating_patient_dbd ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    320    268            �           2604    27153    treating_patient_dbd created    DEFAULT     R   ALTER TABLE ONLY "2".treating_patient_dbd ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "2".treating_patient_dbd ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    268            �           2604    27154    treating_patient_dbd modified    DEFAULT     S   ALTER TABLE ONLY "2".treating_patient_dbd ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "2".treating_patient_dbd ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    268            �           2604    27155    treating_patient_fra id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_fra ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_id_seq'::regclass);
 C   ALTER TABLE "2".treating_patient_fra ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    269    323            �           2604    27156    treating_patient_fra created    DEFAULT     R   ALTER TABLE ONLY "2".treating_patient_fra ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "2".treating_patient_fra ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    269            �           2604    27157    treating_patient_fra modified    DEFAULT     S   ALTER TABLE ONLY "2".treating_patient_fra ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "2".treating_patient_fra ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    269            �           2604    27158    treating_patient_fra_a id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_fra_a ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_a_id_seq'::regclass);
 E   ALTER TABLE "2".treating_patient_fra_a ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    270    321            �           2604    27159    treating_patient_fra_a created    DEFAULT     T   ALTER TABLE ONLY "2".treating_patient_fra_a ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "2".treating_patient_fra_a ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    270            �           2604    27160    treating_patient_fra_a modified    DEFAULT     U   ALTER TABLE ONLY "2".treating_patient_fra_a ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "2".treating_patient_fra_a ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    270            �           2604    27161    treating_patient_fra_b id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_fra_b ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_b_id_seq'::regclass);
 E   ALTER TABLE "2".treating_patient_fra_b ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    271    322            �           2604    27162    treating_patient_fra_b created    DEFAULT     T   ALTER TABLE ONLY "2".treating_patient_fra_b ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "2".treating_patient_fra_b ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    271            �           2604    27163    treating_patient_fra_b modified    DEFAULT     U   ALTER TABLE ONLY "2".treating_patient_fra_b ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "2".treating_patient_fra_b ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    271            �           2604    27164    treating_patient_gds15 id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_gds15 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_gds15_id_seq'::regclass);
 E   ALTER TABLE "2".treating_patient_gds15 ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    272    324            �           2604    27165    treating_patient_gds15 created    DEFAULT     T   ALTER TABLE ONLY "2".treating_patient_gds15 ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "2".treating_patient_gds15 ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    272            �           2604    27166    treating_patient_gds15 modified    DEFAULT     U   ALTER TABLE ONLY "2".treating_patient_gds15 ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "2".treating_patient_gds15 ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    272            �           2604    27167    treating_patient_hdsr id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_hdsr ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_hdsr_id_seq'::regclass);
 D   ALTER TABLE "2".treating_patient_hdsr ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    325    273            �           2604    27168    treating_patient_hdsr created    DEFAULT     S   ALTER TABLE ONLY "2".treating_patient_hdsr ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "2".treating_patient_hdsr ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    273            �           2604    27169    treating_patient_hdsr modified    DEFAULT     T   ALTER TABLE ONLY "2".treating_patient_hdsr ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "2".treating_patient_hdsr ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    273            �           2604    27170     treating_patient_instrumental id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_instrumental ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_instrumental_id_seq'::regclass);
 L   ALTER TABLE "2".treating_patient_instrumental ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    274    326                        2604    27171 %   treating_patient_instrumental created    DEFAULT     [   ALTER TABLE ONLY "2".treating_patient_instrumental ALTER COLUMN created SET DEFAULT now();
 Q   ALTER TABLE "2".treating_patient_instrumental ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    274                       2604    27172 &   treating_patient_instrumental modified    DEFAULT     \   ALTER TABLE ONLY "2".treating_patient_instrumental ALTER COLUMN modified SET DEFAULT now();
 R   ALTER TABLE "2".treating_patient_instrumental ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    274                       2604    27173    treating_patient_mmse id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_mmse ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mmse_id_seq'::regclass);
 D   ALTER TABLE "2".treating_patient_mmse ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    327    275                       2604    27174    treating_patient_mmse created    DEFAULT     S   ALTER TABLE ONLY "2".treating_patient_mmse ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "2".treating_patient_mmse ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    275                       2604    27175    treating_patient_mmse modified    DEFAULT     T   ALTER TABLE ONLY "2".treating_patient_mmse ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "2".treating_patient_mmse ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    275                       2604    27677    treating_patient_mmse img12    DEFAULT     T   ALTER TABLE ONLY "2".treating_patient_mmse ALTER COLUMN img12 SET DEFAULT ''::text;
 G   ALTER TABLE "2".treating_patient_mmse ALTER COLUMN img12 DROP DEFAULT;
       2          postgres    false    275                       2604    27706    treating_patient_mmse img14    DEFAULT     T   ALTER TABLE ONLY "2".treating_patient_mmse ALTER COLUMN img14 SET DEFAULT ''::text;
 G   ALTER TABLE "2".treating_patient_mmse ALTER COLUMN img14 DROP DEFAULT;
       2          postgres    false    275                       2604    27735    treating_patient_mmse img12_out    DEFAULT     X   ALTER TABLE ONLY "2".treating_patient_mmse ALTER COLUMN img12_out SET DEFAULT ''::text;
 K   ALTER TABLE "2".treating_patient_mmse ALTER COLUMN img12_out DROP DEFAULT;
       2          postgres    false    275                       2604    27764    treating_patient_mmse img14_out    DEFAULT     X   ALTER TABLE ONLY "2".treating_patient_mmse ALTER COLUMN img14_out SET DEFAULT ''::text;
 K   ALTER TABLE "2".treating_patient_mmse ALTER COLUMN img14_out DROP DEFAULT;
       2          postgres    false    275            	           2604    27176    treating_patient_mna id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_mna ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mna_id_seq'::regclass);
 C   ALTER TABLE "2".treating_patient_mna ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    328    276            
           2604    27177    treating_patient_mna created    DEFAULT     R   ALTER TABLE ONLY "2".treating_patient_mna ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "2".treating_patient_mna ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    276                       2604    27178    treating_patient_mna modified    DEFAULT     S   ALTER TABLE ONLY "2".treating_patient_mna ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "2".treating_patient_mna ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    276                       2604    27179    treating_patient_qol_pgc id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_qol_pgc ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_pgc_id_seq'::regclass);
 G   ALTER TABLE "2".treating_patient_qol_pgc ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    329    277                       2604    27180     treating_patient_qol_pgc created    DEFAULT     V   ALTER TABLE ONLY "2".treating_patient_qol_pgc ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "2".treating_patient_qol_pgc ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    277                       2604    27181 !   treating_patient_qol_pgc modified    DEFAULT     W   ALTER TABLE ONLY "2".treating_patient_qol_pgc ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "2".treating_patient_qol_pgc ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    277                       2604    27182    treating_patient_qol_sf8 id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_qol_sf8 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_sf8_id_seq'::regclass);
 G   ALTER TABLE "2".treating_patient_qol_sf8 ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    278    330                       2604    27183     treating_patient_qol_sf8 created    DEFAULT     V   ALTER TABLE ONLY "2".treating_patient_qol_sf8 ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "2".treating_patient_qol_sf8 ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    278                       2604    27184 !   treating_patient_qol_sf8 modified    DEFAULT     W   ALTER TABLE ONLY "2".treating_patient_qol_sf8 ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "2".treating_patient_qol_sf8 ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    278                       2604    27185    treating_patient_sarcopenia id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_sarcopenia ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_id_seq'::regclass);
 J   ALTER TABLE "2".treating_patient_sarcopenia ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    279    331                       2604    27186 #   treating_patient_sarcopenia created    DEFAULT     Y   ALTER TABLE ONLY "2".treating_patient_sarcopenia ALTER COLUMN created SET DEFAULT now();
 O   ALTER TABLE "2".treating_patient_sarcopenia ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    279                       2604    27187 $   treating_patient_sarcopenia modified    DEFAULT     Z   ALTER TABLE ONLY "2".treating_patient_sarcopenia ALTER COLUMN modified SET DEFAULT now();
 P   ALTER TABLE "2".treating_patient_sarcopenia ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    279                       2604    27188 #   treating_patient_sarcopenia_loco id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_sarcopenia_loco ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_loco_id_seq'::regclass);
 O   ALTER TABLE "2".treating_patient_sarcopenia_loco ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    332    280                       2604    27189 (   treating_patient_sarcopenia_loco created    DEFAULT     ^   ALTER TABLE ONLY "2".treating_patient_sarcopenia_loco ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "2".treating_patient_sarcopenia_loco ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    280                       2604    27190 )   treating_patient_sarcopenia_loco modified    DEFAULT     _   ALTER TABLE ONLY "2".treating_patient_sarcopenia_loco ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "2".treating_patient_sarcopenia_loco ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    280                       2604    72230    treating_patient_senion id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_senion ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "2".treating_patient_senion ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    527    524                       2604    72231    treating_patient_senion created    DEFAULT     U   ALTER TABLE ONLY "2".treating_patient_senion ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "2".treating_patient_senion ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    527            	           2604    72232     treating_patient_senion modified    DEFAULT     V   ALTER TABLE ONLY "2".treating_patient_senion ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "2".treating_patient_senion ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    527            :           2604    72332    treating_patient_senior id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_senior ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "2".treating_patient_senior ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    524    544            ;           2604    72333    treating_patient_senior created    DEFAULT     U   ALTER TABLE ONLY "2".treating_patient_senior ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "2".treating_patient_senior ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    544            <           2604    72334     treating_patient_senior modified    DEFAULT     V   ALTER TABLE ONLY "2".treating_patient_senior ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "2".treating_patient_senior ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    544                       2604    27191    treating_patient_vitality id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_vitality ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_vitality_id_seq'::regclass);
 H   ALTER TABLE "2".treating_patient_vitality ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    281    333                       2604    27192 !   treating_patient_vitality created    DEFAULT     W   ALTER TABLE ONLY "2".treating_patient_vitality ALTER COLUMN created SET DEFAULT now();
 M   ALTER TABLE "2".treating_patient_vitality ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    281                       2604    27193 "   treating_patient_vitality modified    DEFAULT     X   ALTER TABLE ONLY "2".treating_patient_vitality ALTER COLUMN modified SET DEFAULT now();
 N   ALTER TABLE "2".treating_patient_vitality ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    281                       2604    27194    treating_patient_zarit id    DEFAULT     �   ALTER TABLE ONLY "2".treating_patient_zarit ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_zarit_id_seq'::regclass);
 E   ALTER TABLE "2".treating_patient_zarit ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    282    334                       2604    27195    treating_patient_zarit created    DEFAULT     T   ALTER TABLE ONLY "2".treating_patient_zarit ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "2".treating_patient_zarit ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    282                       2604    27196    treating_patient_zarit modified    DEFAULT     U   ALTER TABLE ONLY "2".treating_patient_zarit ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "2".treating_patient_zarit ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    282                       2604    27197    treating_patients id    DEFAULT     z   ALTER TABLE ONLY "2".treating_patients ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patients_id_seq'::regclass);
 @   ALTER TABLE "2".treating_patients ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    335    283                       2604    27198    treating_patients created    DEFAULT     O   ALTER TABLE ONLY "2".treating_patients ALTER COLUMN created SET DEFAULT now();
 E   ALTER TABLE "2".treating_patients ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    283                        2604    27199    treating_patients modified    DEFAULT     P   ALTER TABLE ONLY "2".treating_patients ALTER COLUMN modified SET DEFAULT now();
 F   ALTER TABLE "2".treating_patients ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    283            !           2604    27200    users id    DEFAULT     b   ALTER TABLE ONLY "2".users ALTER COLUMN id SET DEFAULT nextval('"@base".users_id_seq'::regclass);
 4   ALTER TABLE "2".users ALTER COLUMN id DROP DEFAULT;
       2          postgres    false    284    336            "           2604    27201    users is_super_admin    DEFAULT     J   ALTER TABLE ONLY "2".users ALTER COLUMN is_super_admin SET DEFAULT false;
 @   ALTER TABLE "2".users ALTER COLUMN is_super_admin DROP DEFAULT;
       2          postgres    false    284            #           2604    27202    users created    DEFAULT     C   ALTER TABLE ONLY "2".users ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "2".users ALTER COLUMN created DROP DEFAULT;
       2          postgres    false    284            $           2604    27203    users modified    DEFAULT     D   ALTER TABLE ONLY "2".users ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "2".users ALTER COLUMN modified DROP DEFAULT;
       2          postgres    false    284            '           2604    27204    areas id    DEFAULT     b   ALTER TABLE ONLY "3".areas ALTER COLUMN id SET DEFAULT nextval('"@base".areas_id_seq'::regclass);
 4   ALTER TABLE "3".areas ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    285    311            (           2604    27205    areas created    DEFAULT     C   ALTER TABLE ONLY "3".areas ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "3".areas ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    285            )           2604    27206    areas modified    DEFAULT     D   ALTER TABLE ONLY "3".areas ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "3".areas ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    285            +           2604    27207 
   centers id    DEFAULT     f   ALTER TABLE ONLY "3".centers ALTER COLUMN id SET DEFAULT nextval('"@base".centers_id_seq'::regclass);
 6   ALTER TABLE "3".centers ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    312    286            ,           2604    27208    centers created    DEFAULT     E   ALTER TABLE ONLY "3".centers ALTER COLUMN created SET DEFAULT now();
 ;   ALTER TABLE "3".centers ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    286            -           2604    27209    centers modified    DEFAULT     F   ALTER TABLE ONLY "3".centers ALTER COLUMN modified SET DEFAULT now();
 <   ALTER TABLE "3".centers ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    286            /           2604    27210    patients id    DEFAULT     h   ALTER TABLE ONLY "3".patients ALTER COLUMN id SET DEFAULT nextval('"@base".patients_id_seq'::regclass);
 7   ALTER TABLE "3".patients ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    313    287            0           2604    27211    patients created    DEFAULT     F   ALTER TABLE ONLY "3".patients ALTER COLUMN created SET DEFAULT now();
 <   ALTER TABLE "3".patients ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    287            1           2604    27212    patients modified    DEFAULT     G   ALTER TABLE ONLY "3".patients ALTER COLUMN modified SET DEFAULT now();
 =   ALTER TABLE "3".patients ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    287            4           2604    27213    treating_patient_adl id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_adl_id_seq'::regclass);
 C   ALTER TABLE "3".treating_patient_adl ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    314    288            5           2604    27214    treating_patient_adl created    DEFAULT     R   ALTER TABLE ONLY "3".treating_patient_adl ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "3".treating_patient_adl ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    288            6           2604    27215    treating_patient_adl modified    DEFAULT     S   ALTER TABLE ONLY "3".treating_patient_adl ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "3".treating_patient_adl ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    288            7           2604    27216    treating_patient_basic_adl id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_basic_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_basic_adl_id_seq'::regclass);
 I   ALTER TABLE "3".treating_patient_basic_adl ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    289    315            8           2604    27217 "   treating_patient_basic_adl created    DEFAULT     X   ALTER TABLE ONLY "3".treating_patient_basic_adl ALTER COLUMN created SET DEFAULT now();
 N   ALTER TABLE "3".treating_patient_basic_adl ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    289            9           2604    27218 #   treating_patient_basic_adl modified    DEFAULT     Y   ALTER TABLE ONLY "3".treating_patient_basic_adl ALTER COLUMN modified SET DEFAULT now();
 O   ALTER TABLE "3".treating_patient_basic_adl ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    289            :           2604    27219    treating_patient_blood_sugar id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_blood_sugar ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_blood_sugar_id_seq'::regclass);
 K   ALTER TABLE "3".treating_patient_blood_sugar ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    290    316            ;           2604    27220 $   treating_patient_blood_sugar created    DEFAULT     Z   ALTER TABLE ONLY "3".treating_patient_blood_sugar ALTER COLUMN created SET DEFAULT now();
 P   ALTER TABLE "3".treating_patient_blood_sugar ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    290            <           2604    27221 %   treating_patient_blood_sugar modified    DEFAULT     [   ALTER TABLE ONLY "3".treating_patient_blood_sugar ALTER COLUMN modified SET DEFAULT now();
 Q   ALTER TABLE "3".treating_patient_blood_sugar ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    290            =           2604    27222    treating_patient_cga7 id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_cga7 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_cga7_id_seq'::regclass);
 D   ALTER TABLE "3".treating_patient_cga7 ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    291    317            >           2604    27223    treating_patient_cga7 created    DEFAULT     S   ALTER TABLE ONLY "3".treating_patient_cga7 ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "3".treating_patient_cga7 ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    291            ?           2604    27224    treating_patient_cga7 modified    DEFAULT     T   ALTER TABLE ONLY "3".treating_patient_cga7 ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "3".treating_patient_cga7 ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    291            @           2604    27225 #   treating_patient_closure_sticker id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_closure_sticker ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_closure_sticker_id_seq'::regclass);
 O   ALTER TABLE "3".treating_patient_closure_sticker ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    318    292            A           2604    27226 (   treating_patient_closure_sticker created    DEFAULT     ^   ALTER TABLE ONLY "3".treating_patient_closure_sticker ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "3".treating_patient_closure_sticker ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    292            B           2604    27227 )   treating_patient_closure_sticker modified    DEFAULT     _   ALTER TABLE ONLY "3".treating_patient_closure_sticker ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "3".treating_patient_closure_sticker ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    292            C           2604    27228 !   treating_patient_comprehensive id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_comprehensive ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_comprehensive_id_seq'::regclass);
 M   ALTER TABLE "3".treating_patient_comprehensive ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    319    293            D           2604    27229 &   treating_patient_comprehensive created    DEFAULT     \   ALTER TABLE ONLY "3".treating_patient_comprehensive ALTER COLUMN created SET DEFAULT now();
 R   ALTER TABLE "3".treating_patient_comprehensive ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    293            E           2604    27230 '   treating_patient_comprehensive modified    DEFAULT     ]   ALTER TABLE ONLY "3".treating_patient_comprehensive ALTER COLUMN modified SET DEFAULT now();
 S   ALTER TABLE "3".treating_patient_comprehensive ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    293            F           2604    27231    treating_patient_dbd id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_dbd ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_dbd_id_seq'::regclass);
 C   ALTER TABLE "3".treating_patient_dbd ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    320    294            G           2604    27232    treating_patient_dbd created    DEFAULT     R   ALTER TABLE ONLY "3".treating_patient_dbd ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "3".treating_patient_dbd ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    294            H           2604    27233    treating_patient_dbd modified    DEFAULT     S   ALTER TABLE ONLY "3".treating_patient_dbd ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "3".treating_patient_dbd ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    294            I           2604    27234    treating_patient_fra id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_fra ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_id_seq'::regclass);
 C   ALTER TABLE "3".treating_patient_fra ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    295    323            J           2604    27235    treating_patient_fra created    DEFAULT     R   ALTER TABLE ONLY "3".treating_patient_fra ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "3".treating_patient_fra ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    295            K           2604    27236    treating_patient_fra modified    DEFAULT     S   ALTER TABLE ONLY "3".treating_patient_fra ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "3".treating_patient_fra ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    295            L           2604    27237    treating_patient_fra_a id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_fra_a ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_a_id_seq'::regclass);
 E   ALTER TABLE "3".treating_patient_fra_a ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    321    296            M           2604    27238    treating_patient_fra_a created    DEFAULT     T   ALTER TABLE ONLY "3".treating_patient_fra_a ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "3".treating_patient_fra_a ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    296            N           2604    27239    treating_patient_fra_a modified    DEFAULT     U   ALTER TABLE ONLY "3".treating_patient_fra_a ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "3".treating_patient_fra_a ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    296            O           2604    27240    treating_patient_fra_b id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_fra_b ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_b_id_seq'::regclass);
 E   ALTER TABLE "3".treating_patient_fra_b ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    322    297            P           2604    27241    treating_patient_fra_b created    DEFAULT     T   ALTER TABLE ONLY "3".treating_patient_fra_b ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "3".treating_patient_fra_b ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    297            Q           2604    27242    treating_patient_fra_b modified    DEFAULT     U   ALTER TABLE ONLY "3".treating_patient_fra_b ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "3".treating_patient_fra_b ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    297            R           2604    27243    treating_patient_gds15 id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_gds15 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_gds15_id_seq'::regclass);
 E   ALTER TABLE "3".treating_patient_gds15 ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    298    324            S           2604    27244    treating_patient_gds15 created    DEFAULT     T   ALTER TABLE ONLY "3".treating_patient_gds15 ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "3".treating_patient_gds15 ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    298            T           2604    27245    treating_patient_gds15 modified    DEFAULT     U   ALTER TABLE ONLY "3".treating_patient_gds15 ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "3".treating_patient_gds15 ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    298            U           2604    27246    treating_patient_hdsr id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_hdsr ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_hdsr_id_seq'::regclass);
 D   ALTER TABLE "3".treating_patient_hdsr ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    299    325            V           2604    27247    treating_patient_hdsr created    DEFAULT     S   ALTER TABLE ONLY "3".treating_patient_hdsr ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "3".treating_patient_hdsr ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    299            W           2604    27248    treating_patient_hdsr modified    DEFAULT     T   ALTER TABLE ONLY "3".treating_patient_hdsr ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "3".treating_patient_hdsr ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    299            X           2604    27249     treating_patient_instrumental id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_instrumental ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_instrumental_id_seq'::regclass);
 L   ALTER TABLE "3".treating_patient_instrumental ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    326    300            Y           2604    27250 %   treating_patient_instrumental created    DEFAULT     [   ALTER TABLE ONLY "3".treating_patient_instrumental ALTER COLUMN created SET DEFAULT now();
 Q   ALTER TABLE "3".treating_patient_instrumental ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    300            Z           2604    27251 &   treating_patient_instrumental modified    DEFAULT     \   ALTER TABLE ONLY "3".treating_patient_instrumental ALTER COLUMN modified SET DEFAULT now();
 R   ALTER TABLE "3".treating_patient_instrumental ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    300            [           2604    27252    treating_patient_mmse id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_mmse ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mmse_id_seq'::regclass);
 D   ALTER TABLE "3".treating_patient_mmse ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    301    327            \           2604    27253    treating_patient_mmse created    DEFAULT     S   ALTER TABLE ONLY "3".treating_patient_mmse ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "3".treating_patient_mmse ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    301            ]           2604    27254    treating_patient_mmse modified    DEFAULT     T   ALTER TABLE ONLY "3".treating_patient_mmse ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "3".treating_patient_mmse ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    301            ^           2604    27678    treating_patient_mmse img12    DEFAULT     T   ALTER TABLE ONLY "3".treating_patient_mmse ALTER COLUMN img12 SET DEFAULT ''::text;
 G   ALTER TABLE "3".treating_patient_mmse ALTER COLUMN img12 DROP DEFAULT;
       3          postgres    false    301            _           2604    27707    treating_patient_mmse img14    DEFAULT     T   ALTER TABLE ONLY "3".treating_patient_mmse ALTER COLUMN img14 SET DEFAULT ''::text;
 G   ALTER TABLE "3".treating_patient_mmse ALTER COLUMN img14 DROP DEFAULT;
       3          postgres    false    301            `           2604    27736    treating_patient_mmse img12_out    DEFAULT     X   ALTER TABLE ONLY "3".treating_patient_mmse ALTER COLUMN img12_out SET DEFAULT ''::text;
 K   ALTER TABLE "3".treating_patient_mmse ALTER COLUMN img12_out DROP DEFAULT;
       3          postgres    false    301            a           2604    27765    treating_patient_mmse img14_out    DEFAULT     X   ALTER TABLE ONLY "3".treating_patient_mmse ALTER COLUMN img14_out SET DEFAULT ''::text;
 K   ALTER TABLE "3".treating_patient_mmse ALTER COLUMN img14_out DROP DEFAULT;
       3          postgres    false    301            b           2604    27255    treating_patient_mna id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_mna ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mna_id_seq'::regclass);
 C   ALTER TABLE "3".treating_patient_mna ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    302    328            c           2604    27256    treating_patient_mna created    DEFAULT     R   ALTER TABLE ONLY "3".treating_patient_mna ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "3".treating_patient_mna ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    302            d           2604    27257    treating_patient_mna modified    DEFAULT     S   ALTER TABLE ONLY "3".treating_patient_mna ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "3".treating_patient_mna ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    302            e           2604    27258    treating_patient_qol_pgc id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_qol_pgc ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_pgc_id_seq'::regclass);
 G   ALTER TABLE "3".treating_patient_qol_pgc ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    303    329            f           2604    27259     treating_patient_qol_pgc created    DEFAULT     V   ALTER TABLE ONLY "3".treating_patient_qol_pgc ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "3".treating_patient_qol_pgc ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    303            g           2604    27260 !   treating_patient_qol_pgc modified    DEFAULT     W   ALTER TABLE ONLY "3".treating_patient_qol_pgc ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "3".treating_patient_qol_pgc ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    303            h           2604    27261    treating_patient_qol_sf8 id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_qol_sf8 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_sf8_id_seq'::regclass);
 G   ALTER TABLE "3".treating_patient_qol_sf8 ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    304    330            i           2604    27262     treating_patient_qol_sf8 created    DEFAULT     V   ALTER TABLE ONLY "3".treating_patient_qol_sf8 ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "3".treating_patient_qol_sf8 ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    304            j           2604    27263 !   treating_patient_qol_sf8 modified    DEFAULT     W   ALTER TABLE ONLY "3".treating_patient_qol_sf8 ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "3".treating_patient_qol_sf8 ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    304            k           2604    27264    treating_patient_sarcopenia id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_sarcopenia ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_id_seq'::regclass);
 J   ALTER TABLE "3".treating_patient_sarcopenia ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    305    331            l           2604    27265 #   treating_patient_sarcopenia created    DEFAULT     Y   ALTER TABLE ONLY "3".treating_patient_sarcopenia ALTER COLUMN created SET DEFAULT now();
 O   ALTER TABLE "3".treating_patient_sarcopenia ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    305            m           2604    27266 $   treating_patient_sarcopenia modified    DEFAULT     Z   ALTER TABLE ONLY "3".treating_patient_sarcopenia ALTER COLUMN modified SET DEFAULT now();
 P   ALTER TABLE "3".treating_patient_sarcopenia ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    305            n           2604    27267 #   treating_patient_sarcopenia_loco id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_sarcopenia_loco ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_loco_id_seq'::regclass);
 O   ALTER TABLE "3".treating_patient_sarcopenia_loco ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    306    332            o           2604    27268 (   treating_patient_sarcopenia_loco created    DEFAULT     ^   ALTER TABLE ONLY "3".treating_patient_sarcopenia_loco ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "3".treating_patient_sarcopenia_loco ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    306            p           2604    27269 )   treating_patient_sarcopenia_loco modified    DEFAULT     _   ALTER TABLE ONLY "3".treating_patient_sarcopenia_loco ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "3".treating_patient_sarcopenia_loco ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    306            
           2604    72236    treating_patient_senion id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_senion ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "3".treating_patient_senion ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    528    524                       2604    72237    treating_patient_senion created    DEFAULT     U   ALTER TABLE ONLY "3".treating_patient_senion ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "3".treating_patient_senion ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    528                       2604    72238     treating_patient_senion modified    DEFAULT     V   ALTER TABLE ONLY "3".treating_patient_senion ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "3".treating_patient_senion ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    528            7           2604    72326    treating_patient_senior id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_senior ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "3".treating_patient_senior ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    543    524            8           2604    72327    treating_patient_senior created    DEFAULT     U   ALTER TABLE ONLY "3".treating_patient_senior ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "3".treating_patient_senior ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    543            9           2604    72328     treating_patient_senior modified    DEFAULT     V   ALTER TABLE ONLY "3".treating_patient_senior ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "3".treating_patient_senior ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    543            q           2604    27270    treating_patient_vitality id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_vitality ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_vitality_id_seq'::regclass);
 H   ALTER TABLE "3".treating_patient_vitality ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    307    333            r           2604    27271 !   treating_patient_vitality created    DEFAULT     W   ALTER TABLE ONLY "3".treating_patient_vitality ALTER COLUMN created SET DEFAULT now();
 M   ALTER TABLE "3".treating_patient_vitality ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    307            s           2604    27272 "   treating_patient_vitality modified    DEFAULT     X   ALTER TABLE ONLY "3".treating_patient_vitality ALTER COLUMN modified SET DEFAULT now();
 N   ALTER TABLE "3".treating_patient_vitality ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    307            t           2604    27273    treating_patient_zarit id    DEFAULT     �   ALTER TABLE ONLY "3".treating_patient_zarit ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_zarit_id_seq'::regclass);
 E   ALTER TABLE "3".treating_patient_zarit ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    334    308            u           2604    27274    treating_patient_zarit created    DEFAULT     T   ALTER TABLE ONLY "3".treating_patient_zarit ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "3".treating_patient_zarit ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    308            v           2604    27275    treating_patient_zarit modified    DEFAULT     U   ALTER TABLE ONLY "3".treating_patient_zarit ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "3".treating_patient_zarit ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    308            w           2604    27276    treating_patients id    DEFAULT     z   ALTER TABLE ONLY "3".treating_patients ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patients_id_seq'::regclass);
 @   ALTER TABLE "3".treating_patients ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    335    309            x           2604    27277    treating_patients created    DEFAULT     O   ALTER TABLE ONLY "3".treating_patients ALTER COLUMN created SET DEFAULT now();
 E   ALTER TABLE "3".treating_patients ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    309            y           2604    27278    treating_patients modified    DEFAULT     P   ALTER TABLE ONLY "3".treating_patients ALTER COLUMN modified SET DEFAULT now();
 F   ALTER TABLE "3".treating_patients ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    309            z           2604    27279    users id    DEFAULT     b   ALTER TABLE ONLY "3".users ALTER COLUMN id SET DEFAULT nextval('"@base".users_id_seq'::regclass);
 4   ALTER TABLE "3".users ALTER COLUMN id DROP DEFAULT;
       3          postgres    false    310    336            {           2604    27280    users is_super_admin    DEFAULT     J   ALTER TABLE ONLY "3".users ALTER COLUMN is_super_admin SET DEFAULT false;
 @   ALTER TABLE "3".users ALTER COLUMN is_super_admin DROP DEFAULT;
       3          postgres    false    310            |           2604    27281    users created    DEFAULT     C   ALTER TABLE ONLY "3".users ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "3".users ALTER COLUMN created DROP DEFAULT;
       3          postgres    false    310            }           2604    27282    users modified    DEFAULT     D   ALTER TABLE ONLY "3".users ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "3".users ALTER COLUMN modified DROP DEFAULT;
       3          postgres    false    310            �           2604    49377    areas id    DEFAULT     b   ALTER TABLE ONLY "4".areas ALTER COLUMN id SET DEFAULT nextval('"@base".areas_id_seq'::regclass);
 4   ALTER TABLE "4".areas ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    311    350            �           2604    49378    areas created    DEFAULT     C   ALTER TABLE ONLY "4".areas ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "4".areas ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    350            �           2604    49379    areas modified    DEFAULT     D   ALTER TABLE ONLY "4".areas ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "4".areas ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    350            �           2604    49367 
   centers id    DEFAULT     f   ALTER TABLE ONLY "4".centers ALTER COLUMN id SET DEFAULT nextval('"@base".centers_id_seq'::regclass);
 6   ALTER TABLE "4".centers ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    312    349            �           2604    49368    centers created    DEFAULT     E   ALTER TABLE ONLY "4".centers ALTER COLUMN created SET DEFAULT now();
 ;   ALTER TABLE "4".centers ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    349            �           2604    49369    centers modified    DEFAULT     F   ALTER TABLE ONLY "4".centers ALTER COLUMN modified SET DEFAULT now();
 <   ALTER TABLE "4".centers ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    349            �           2604    49477    patients id    DEFAULT     h   ALTER TABLE ONLY "4".patients ALTER COLUMN id SET DEFAULT nextval('"@base".patients_id_seq'::regclass);
 7   ALTER TABLE "4".patients ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    366    313            �           2604    49478    patients created    DEFAULT     F   ALTER TABLE ONLY "4".patients ALTER COLUMN created SET DEFAULT now();
 <   ALTER TABLE "4".patients ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    366            �           2604    49479    patients modified    DEFAULT     G   ALTER TABLE ONLY "4".patients ALTER COLUMN modified SET DEFAULT now();
 =   ALTER TABLE "4".patients ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    366            �           2604    49471    treating_patient_adl id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_adl_id_seq'::regclass);
 C   ALTER TABLE "4".treating_patient_adl ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    314    365            �           2604    49472    treating_patient_adl created    DEFAULT     R   ALTER TABLE ONLY "4".treating_patient_adl ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "4".treating_patient_adl ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    365            �           2604    49473    treating_patient_adl modified    DEFAULT     S   ALTER TABLE ONLY "4".treating_patient_adl ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "4".treating_patient_adl ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    365            �           2604    49465    treating_patient_basic_adl id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_basic_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_basic_adl_id_seq'::regclass);
 I   ALTER TABLE "4".treating_patient_basic_adl ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    364    315            �           2604    49466 "   treating_patient_basic_adl created    DEFAULT     X   ALTER TABLE ONLY "4".treating_patient_basic_adl ALTER COLUMN created SET DEFAULT now();
 N   ALTER TABLE "4".treating_patient_basic_adl ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    364            �           2604    49467 #   treating_patient_basic_adl modified    DEFAULT     Y   ALTER TABLE ONLY "4".treating_patient_basic_adl ALTER COLUMN modified SET DEFAULT now();
 O   ALTER TABLE "4".treating_patient_basic_adl ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    364            �           2604    49487    treating_patient_blood_sugar id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_blood_sugar ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_blood_sugar_id_seq'::regclass);
 K   ALTER TABLE "4".treating_patient_blood_sugar ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    316    367            �           2604    49488 $   treating_patient_blood_sugar created    DEFAULT     Z   ALTER TABLE ONLY "4".treating_patient_blood_sugar ALTER COLUMN created SET DEFAULT now();
 P   ALTER TABLE "4".treating_patient_blood_sugar ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    367            �           2604    49489 %   treating_patient_blood_sugar modified    DEFAULT     [   ALTER TABLE ONLY "4".treating_patient_blood_sugar ALTER COLUMN modified SET DEFAULT now();
 Q   ALTER TABLE "4".treating_patient_blood_sugar ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    367            �           2604    49459    treating_patient_cga7 id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_cga7 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_cga7_id_seq'::regclass);
 D   ALTER TABLE "4".treating_patient_cga7 ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    363    317            �           2604    49460    treating_patient_cga7 created    DEFAULT     S   ALTER TABLE ONLY "4".treating_patient_cga7 ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "4".treating_patient_cga7 ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    363            �           2604    49461    treating_patient_cga7 modified    DEFAULT     T   ALTER TABLE ONLY "4".treating_patient_cga7 ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "4".treating_patient_cga7 ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    363            �           2604    49453 #   treating_patient_closure_sticker id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_closure_sticker ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_closure_sticker_id_seq'::regclass);
 O   ALTER TABLE "4".treating_patient_closure_sticker ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    318    362            �           2604    49454 (   treating_patient_closure_sticker created    DEFAULT     ^   ALTER TABLE ONLY "4".treating_patient_closure_sticker ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "4".treating_patient_closure_sticker ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    362            �           2604    49455 )   treating_patient_closure_sticker modified    DEFAULT     _   ALTER TABLE ONLY "4".treating_patient_closure_sticker ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "4".treating_patient_closure_sticker ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    362            �           2604    49447 !   treating_patient_comprehensive id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_comprehensive ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_comprehensive_id_seq'::regclass);
 M   ALTER TABLE "4".treating_patient_comprehensive ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    319    361            �           2604    49448 &   treating_patient_comprehensive created    DEFAULT     \   ALTER TABLE ONLY "4".treating_patient_comprehensive ALTER COLUMN created SET DEFAULT now();
 R   ALTER TABLE "4".treating_patient_comprehensive ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    361            �           2604    49449 '   treating_patient_comprehensive modified    DEFAULT     ]   ALTER TABLE ONLY "4".treating_patient_comprehensive ALTER COLUMN modified SET DEFAULT now();
 S   ALTER TABLE "4".treating_patient_comprehensive ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    361            �           2604    49441    treating_patient_dbd id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_dbd ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_dbd_id_seq'::regclass);
 C   ALTER TABLE "4".treating_patient_dbd ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    360    320            �           2604    49442    treating_patient_dbd created    DEFAULT     R   ALTER TABLE ONLY "4".treating_patient_dbd ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "4".treating_patient_dbd ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    360            �           2604    49443    treating_patient_dbd modified    DEFAULT     S   ALTER TABLE ONLY "4".treating_patient_dbd ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "4".treating_patient_dbd ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    360            �           2604    49435    treating_patient_fra id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_fra ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_id_seq'::regclass);
 C   ALTER TABLE "4".treating_patient_fra ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    323    359            �           2604    49436    treating_patient_fra created    DEFAULT     R   ALTER TABLE ONLY "4".treating_patient_fra ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "4".treating_patient_fra ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    359            �           2604    49437    treating_patient_fra modified    DEFAULT     S   ALTER TABLE ONLY "4".treating_patient_fra ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "4".treating_patient_fra ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    359            �           2604    49429    treating_patient_fra_a id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_fra_a ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_a_id_seq'::regclass);
 E   ALTER TABLE "4".treating_patient_fra_a ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    358    321            �           2604    49430    treating_patient_fra_a created    DEFAULT     T   ALTER TABLE ONLY "4".treating_patient_fra_a ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "4".treating_patient_fra_a ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    358            �           2604    49431    treating_patient_fra_a modified    DEFAULT     U   ALTER TABLE ONLY "4".treating_patient_fra_a ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "4".treating_patient_fra_a ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    358            �           2604    49423    treating_patient_fra_b id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_fra_b ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_b_id_seq'::regclass);
 E   ALTER TABLE "4".treating_patient_fra_b ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    322    357            �           2604    49424    treating_patient_fra_b created    DEFAULT     T   ALTER TABLE ONLY "4".treating_patient_fra_b ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "4".treating_patient_fra_b ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    357            �           2604    49425    treating_patient_fra_b modified    DEFAULT     U   ALTER TABLE ONLY "4".treating_patient_fra_b ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "4".treating_patient_fra_b ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    357            �           2604    49361    treating_patient_gds15 id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_gds15 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_gds15_id_seq'::regclass);
 E   ALTER TABLE "4".treating_patient_gds15 ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    324    348            �           2604    49362    treating_patient_gds15 created    DEFAULT     T   ALTER TABLE ONLY "4".treating_patient_gds15 ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "4".treating_patient_gds15 ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    348            �           2604    49363    treating_patient_gds15 modified    DEFAULT     U   ALTER TABLE ONLY "4".treating_patient_gds15 ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "4".treating_patient_gds15 ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    348            �           2604    49352    treating_patient_hdsr id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_hdsr ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_hdsr_id_seq'::regclass);
 D   ALTER TABLE "4".treating_patient_hdsr ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    347    325            �           2604    49353    treating_patient_hdsr created    DEFAULT     S   ALTER TABLE ONLY "4".treating_patient_hdsr ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "4".treating_patient_hdsr ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    347            �           2604    49354    treating_patient_hdsr modified    DEFAULT     T   ALTER TABLE ONLY "4".treating_patient_hdsr ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "4".treating_patient_hdsr ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    347            �           2604    49343     treating_patient_instrumental id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_instrumental ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_instrumental_id_seq'::regclass);
 L   ALTER TABLE "4".treating_patient_instrumental ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    326    346            �           2604    49344 %   treating_patient_instrumental created    DEFAULT     [   ALTER TABLE ONLY "4".treating_patient_instrumental ALTER COLUMN created SET DEFAULT now();
 Q   ALTER TABLE "4".treating_patient_instrumental ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    346            �           2604    49345 &   treating_patient_instrumental modified    DEFAULT     \   ALTER TABLE ONLY "4".treating_patient_instrumental ALTER COLUMN modified SET DEFAULT now();
 R   ALTER TABLE "4".treating_patient_instrumental ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    346            �           2604    49306    treating_patient_mmse id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_mmse ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mmse_id_seq'::regclass);
 D   ALTER TABLE "4".treating_patient_mmse ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    342    327            �           2604    49307    treating_patient_mmse created    DEFAULT     S   ALTER TABLE ONLY "4".treating_patient_mmse ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "4".treating_patient_mmse ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    342            �           2604    49308    treating_patient_mmse modified    DEFAULT     T   ALTER TABLE ONLY "4".treating_patient_mmse ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "4".treating_patient_mmse ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    342            �           2604    49309    treating_patient_mmse img12    DEFAULT     T   ALTER TABLE ONLY "4".treating_patient_mmse ALTER COLUMN img12 SET DEFAULT ''::text;
 G   ALTER TABLE "4".treating_patient_mmse ALTER COLUMN img12 DROP DEFAULT;
       4          postgres    false    342            �           2604    49310    treating_patient_mmse img14    DEFAULT     T   ALTER TABLE ONLY "4".treating_patient_mmse ALTER COLUMN img14 SET DEFAULT ''::text;
 G   ALTER TABLE "4".treating_patient_mmse ALTER COLUMN img14 DROP DEFAULT;
       4          postgres    false    342            �           2604    49311    treating_patient_mmse img12_out    DEFAULT     X   ALTER TABLE ONLY "4".treating_patient_mmse ALTER COLUMN img12_out SET DEFAULT ''::text;
 K   ALTER TABLE "4".treating_patient_mmse ALTER COLUMN img12_out DROP DEFAULT;
       4          postgres    false    342            �           2604    49312    treating_patient_mmse img14_out    DEFAULT     X   ALTER TABLE ONLY "4".treating_patient_mmse ALTER COLUMN img14_out SET DEFAULT ''::text;
 K   ALTER TABLE "4".treating_patient_mmse ALTER COLUMN img14_out DROP DEFAULT;
       4          postgres    false    342            �           2604    49331    treating_patient_mna id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_mna ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mna_id_seq'::regclass);
 C   ALTER TABLE "4".treating_patient_mna ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    344    328            �           2604    49332    treating_patient_mna created    DEFAULT     R   ALTER TABLE ONLY "4".treating_patient_mna ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "4".treating_patient_mna ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    344            �           2604    49333    treating_patient_mna modified    DEFAULT     S   ALTER TABLE ONLY "4".treating_patient_mna ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "4".treating_patient_mna ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    344            �           2604    49417    treating_patient_qol_pgc id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_qol_pgc ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_pgc_id_seq'::regclass);
 G   ALTER TABLE "4".treating_patient_qol_pgc ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    329    356            �           2604    49418     treating_patient_qol_pgc created    DEFAULT     V   ALTER TABLE ONLY "4".treating_patient_qol_pgc ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "4".treating_patient_qol_pgc ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    356            �           2604    49419 !   treating_patient_qol_pgc modified    DEFAULT     W   ALTER TABLE ONLY "4".treating_patient_qol_pgc ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "4".treating_patient_qol_pgc ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    356            �           2604    49411    treating_patient_qol_sf8 id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_qol_sf8 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_sf8_id_seq'::regclass);
 G   ALTER TABLE "4".treating_patient_qol_sf8 ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    355    330            �           2604    49412     treating_patient_qol_sf8 created    DEFAULT     V   ALTER TABLE ONLY "4".treating_patient_qol_sf8 ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "4".treating_patient_qol_sf8 ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    355            �           2604    49413 !   treating_patient_qol_sf8 modified    DEFAULT     W   ALTER TABLE ONLY "4".treating_patient_qol_sf8 ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "4".treating_patient_qol_sf8 ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    355            �           2604    49405    treating_patient_sarcopenia id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_sarcopenia ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_id_seq'::regclass);
 J   ALTER TABLE "4".treating_patient_sarcopenia ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    354    331            �           2604    49406 #   treating_patient_sarcopenia created    DEFAULT     Y   ALTER TABLE ONLY "4".treating_patient_sarcopenia ALTER COLUMN created SET DEFAULT now();
 O   ALTER TABLE "4".treating_patient_sarcopenia ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    354            �           2604    49407 $   treating_patient_sarcopenia modified    DEFAULT     Z   ALTER TABLE ONLY "4".treating_patient_sarcopenia ALTER COLUMN modified SET DEFAULT now();
 P   ALTER TABLE "4".treating_patient_sarcopenia ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    354            �           2604    49399 #   treating_patient_sarcopenia_loco id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_sarcopenia_loco ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_loco_id_seq'::regclass);
 O   ALTER TABLE "4".treating_patient_sarcopenia_loco ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    332    353            �           2604    49400 (   treating_patient_sarcopenia_loco created    DEFAULT     ^   ALTER TABLE ONLY "4".treating_patient_sarcopenia_loco ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "4".treating_patient_sarcopenia_loco ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    353            �           2604    49401 )   treating_patient_sarcopenia_loco modified    DEFAULT     _   ALTER TABLE ONLY "4".treating_patient_sarcopenia_loco ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "4".treating_patient_sarcopenia_loco ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    353                       2604    72242    treating_patient_senion id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_senion ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "4".treating_patient_senion ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    524    529                       2604    72243    treating_patient_senion created    DEFAULT     U   ALTER TABLE ONLY "4".treating_patient_senion ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "4".treating_patient_senion ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    529                       2604    72244     treating_patient_senion modified    DEFAULT     V   ALTER TABLE ONLY "4".treating_patient_senion ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "4".treating_patient_senion ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    529            4           2604    72320    treating_patient_senior id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_senior ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "4".treating_patient_senior ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    524    542            5           2604    72321    treating_patient_senior created    DEFAULT     U   ALTER TABLE ONLY "4".treating_patient_senior ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "4".treating_patient_senior ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    542            6           2604    72322     treating_patient_senior modified    DEFAULT     V   ALTER TABLE ONLY "4".treating_patient_senior ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "4".treating_patient_senior ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    542            �           2604    49393    treating_patient_vitality id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_vitality ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_vitality_id_seq'::regclass);
 H   ALTER TABLE "4".treating_patient_vitality ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    352    333            �           2604    49394 !   treating_patient_vitality created    DEFAULT     W   ALTER TABLE ONLY "4".treating_patient_vitality ALTER COLUMN created SET DEFAULT now();
 M   ALTER TABLE "4".treating_patient_vitality ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    352            �           2604    49395 "   treating_patient_vitality modified    DEFAULT     X   ALTER TABLE ONLY "4".treating_patient_vitality ALTER COLUMN modified SET DEFAULT now();
 N   ALTER TABLE "4".treating_patient_vitality ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    352            �           2604    49387    treating_patient_zarit id    DEFAULT     �   ALTER TABLE ONLY "4".treating_patient_zarit ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_zarit_id_seq'::regclass);
 E   ALTER TABLE "4".treating_patient_zarit ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    334    351            �           2604    49388    treating_patient_zarit created    DEFAULT     T   ALTER TABLE ONLY "4".treating_patient_zarit ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "4".treating_patient_zarit ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    351            �           2604    49389    treating_patient_zarit modified    DEFAULT     U   ALTER TABLE ONLY "4".treating_patient_zarit ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "4".treating_patient_zarit ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    351            �           2604    49337    treating_patients id    DEFAULT     z   ALTER TABLE ONLY "4".treating_patients ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patients_id_seq'::regclass);
 @   ALTER TABLE "4".treating_patients ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    335    345            �           2604    49338    treating_patients created    DEFAULT     O   ALTER TABLE ONLY "4".treating_patients ALTER COLUMN created SET DEFAULT now();
 E   ALTER TABLE "4".treating_patients ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    345            �           2604    49339    treating_patients modified    DEFAULT     P   ALTER TABLE ONLY "4".treating_patients ALTER COLUMN modified SET DEFAULT now();
 F   ALTER TABLE "4".treating_patients ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    345            �           2604    49319    users id    DEFAULT     b   ALTER TABLE ONLY "4".users ALTER COLUMN id SET DEFAULT nextval('"@base".users_id_seq'::regclass);
 4   ALTER TABLE "4".users ALTER COLUMN id DROP DEFAULT;
       4          postgres    false    343    336            �           2604    49320    users is_super_admin    DEFAULT     J   ALTER TABLE ONLY "4".users ALTER COLUMN is_super_admin SET DEFAULT false;
 @   ALTER TABLE "4".users ALTER COLUMN is_super_admin DROP DEFAULT;
       4          postgres    false    343            �           2604    49321    users created    DEFAULT     C   ALTER TABLE ONLY "4".users ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "4".users ALTER COLUMN created DROP DEFAULT;
       4          postgres    false    343            �           2604    49322    users modified    DEFAULT     D   ALTER TABLE ONLY "4".users ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "4".users ALTER COLUMN modified DROP DEFAULT;
       4          postgres    false    343                       2604    49569    areas id    DEFAULT     b   ALTER TABLE ONLY "5".areas ALTER COLUMN id SET DEFAULT nextval('"@base".areas_id_seq'::regclass);
 4   ALTER TABLE "5".areas ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    311    376                       2604    49570    areas created    DEFAULT     C   ALTER TABLE ONLY "5".areas ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "5".areas ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    376                       2604    49571    areas modified    DEFAULT     D   ALTER TABLE ONLY "5".areas ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "5".areas ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    376                       2604    49559 
   centers id    DEFAULT     f   ALTER TABLE ONLY "5".centers ALTER COLUMN id SET DEFAULT nextval('"@base".centers_id_seq'::regclass);
 6   ALTER TABLE "5".centers ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    375    312                       2604    49560    centers created    DEFAULT     E   ALTER TABLE ONLY "5".centers ALTER COLUMN created SET DEFAULT now();
 ;   ALTER TABLE "5".centers ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    375            	           2604    49561    centers modified    DEFAULT     F   ALTER TABLE ONLY "5".centers ALTER COLUMN modified SET DEFAULT now();
 <   ALTER TABLE "5".centers ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    375            <           2604    49669    patients id    DEFAULT     h   ALTER TABLE ONLY "5".patients ALTER COLUMN id SET DEFAULT nextval('"@base".patients_id_seq'::regclass);
 7   ALTER TABLE "5".patients ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    392    313            =           2604    49670    patients created    DEFAULT     F   ALTER TABLE ONLY "5".patients ALTER COLUMN created SET DEFAULT now();
 <   ALTER TABLE "5".patients ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    392            >           2604    49671    patients modified    DEFAULT     G   ALTER TABLE ONLY "5".patients ALTER COLUMN modified SET DEFAULT now();
 =   ALTER TABLE "5".patients ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    392            9           2604    49663    treating_patient_adl id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_adl_id_seq'::regclass);
 C   ALTER TABLE "5".treating_patient_adl ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    314    391            :           2604    49664    treating_patient_adl created    DEFAULT     R   ALTER TABLE ONLY "5".treating_patient_adl ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "5".treating_patient_adl ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    391            ;           2604    49665    treating_patient_adl modified    DEFAULT     S   ALTER TABLE ONLY "5".treating_patient_adl ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "5".treating_patient_adl ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    391            6           2604    49657    treating_patient_basic_adl id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_basic_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_basic_adl_id_seq'::regclass);
 I   ALTER TABLE "5".treating_patient_basic_adl ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    315    390            7           2604    49658 "   treating_patient_basic_adl created    DEFAULT     X   ALTER TABLE ONLY "5".treating_patient_basic_adl ALTER COLUMN created SET DEFAULT now();
 N   ALTER TABLE "5".treating_patient_basic_adl ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    390            8           2604    49659 #   treating_patient_basic_adl modified    DEFAULT     Y   ALTER TABLE ONLY "5".treating_patient_basic_adl ALTER COLUMN modified SET DEFAULT now();
 O   ALTER TABLE "5".treating_patient_basic_adl ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    390            A           2604    49679    treating_patient_blood_sugar id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_blood_sugar ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_blood_sugar_id_seq'::regclass);
 K   ALTER TABLE "5".treating_patient_blood_sugar ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    393    316            B           2604    49680 $   treating_patient_blood_sugar created    DEFAULT     Z   ALTER TABLE ONLY "5".treating_patient_blood_sugar ALTER COLUMN created SET DEFAULT now();
 P   ALTER TABLE "5".treating_patient_blood_sugar ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    393            C           2604    49681 %   treating_patient_blood_sugar modified    DEFAULT     [   ALTER TABLE ONLY "5".treating_patient_blood_sugar ALTER COLUMN modified SET DEFAULT now();
 Q   ALTER TABLE "5".treating_patient_blood_sugar ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    393            3           2604    49651    treating_patient_cga7 id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_cga7 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_cga7_id_seq'::regclass);
 D   ALTER TABLE "5".treating_patient_cga7 ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    389    317            4           2604    49652    treating_patient_cga7 created    DEFAULT     S   ALTER TABLE ONLY "5".treating_patient_cga7 ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "5".treating_patient_cga7 ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    389            5           2604    49653    treating_patient_cga7 modified    DEFAULT     T   ALTER TABLE ONLY "5".treating_patient_cga7 ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "5".treating_patient_cga7 ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    389            0           2604    49645 #   treating_patient_closure_sticker id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_closure_sticker ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_closure_sticker_id_seq'::regclass);
 O   ALTER TABLE "5".treating_patient_closure_sticker ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    388    318            1           2604    49646 (   treating_patient_closure_sticker created    DEFAULT     ^   ALTER TABLE ONLY "5".treating_patient_closure_sticker ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "5".treating_patient_closure_sticker ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    388            2           2604    49647 )   treating_patient_closure_sticker modified    DEFAULT     _   ALTER TABLE ONLY "5".treating_patient_closure_sticker ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "5".treating_patient_closure_sticker ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    388            -           2604    49639 !   treating_patient_comprehensive id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_comprehensive ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_comprehensive_id_seq'::regclass);
 M   ALTER TABLE "5".treating_patient_comprehensive ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    319    387            .           2604    49640 &   treating_patient_comprehensive created    DEFAULT     \   ALTER TABLE ONLY "5".treating_patient_comprehensive ALTER COLUMN created SET DEFAULT now();
 R   ALTER TABLE "5".treating_patient_comprehensive ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    387            /           2604    49641 '   treating_patient_comprehensive modified    DEFAULT     ]   ALTER TABLE ONLY "5".treating_patient_comprehensive ALTER COLUMN modified SET DEFAULT now();
 S   ALTER TABLE "5".treating_patient_comprehensive ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    387            *           2604    49633    treating_patient_dbd id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_dbd ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_dbd_id_seq'::regclass);
 C   ALTER TABLE "5".treating_patient_dbd ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    386    320            +           2604    49634    treating_patient_dbd created    DEFAULT     R   ALTER TABLE ONLY "5".treating_patient_dbd ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "5".treating_patient_dbd ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    386            ,           2604    49635    treating_patient_dbd modified    DEFAULT     S   ALTER TABLE ONLY "5".treating_patient_dbd ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "5".treating_patient_dbd ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    386            '           2604    49627    treating_patient_fra id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_fra ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_id_seq'::regclass);
 C   ALTER TABLE "5".treating_patient_fra ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    385    323            (           2604    49628    treating_patient_fra created    DEFAULT     R   ALTER TABLE ONLY "5".treating_patient_fra ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "5".treating_patient_fra ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    385            )           2604    49629    treating_patient_fra modified    DEFAULT     S   ALTER TABLE ONLY "5".treating_patient_fra ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "5".treating_patient_fra ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    385            $           2604    49621    treating_patient_fra_a id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_fra_a ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_a_id_seq'::regclass);
 E   ALTER TABLE "5".treating_patient_fra_a ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    384    321            %           2604    49622    treating_patient_fra_a created    DEFAULT     T   ALTER TABLE ONLY "5".treating_patient_fra_a ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "5".treating_patient_fra_a ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    384            &           2604    49623    treating_patient_fra_a modified    DEFAULT     U   ALTER TABLE ONLY "5".treating_patient_fra_a ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "5".treating_patient_fra_a ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    384            !           2604    49615    treating_patient_fra_b id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_fra_b ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_b_id_seq'::regclass);
 E   ALTER TABLE "5".treating_patient_fra_b ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    322    383            "           2604    49616    treating_patient_fra_b created    DEFAULT     T   ALTER TABLE ONLY "5".treating_patient_fra_b ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "5".treating_patient_fra_b ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    383            #           2604    49617    treating_patient_fra_b modified    DEFAULT     U   ALTER TABLE ONLY "5".treating_patient_fra_b ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "5".treating_patient_fra_b ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    383                       2604    49553    treating_patient_gds15 id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_gds15 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_gds15_id_seq'::regclass);
 E   ALTER TABLE "5".treating_patient_gds15 ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    324    374                       2604    49554    treating_patient_gds15 created    DEFAULT     T   ALTER TABLE ONLY "5".treating_patient_gds15 ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "5".treating_patient_gds15 ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    374                       2604    49555    treating_patient_gds15 modified    DEFAULT     U   ALTER TABLE ONLY "5".treating_patient_gds15 ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "5".treating_patient_gds15 ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    374                       2604    49544    treating_patient_hdsr id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_hdsr ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_hdsr_id_seq'::regclass);
 D   ALTER TABLE "5".treating_patient_hdsr ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    373    325                       2604    49545    treating_patient_hdsr created    DEFAULT     S   ALTER TABLE ONLY "5".treating_patient_hdsr ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "5".treating_patient_hdsr ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    373                       2604    49546    treating_patient_hdsr modified    DEFAULT     T   ALTER TABLE ONLY "5".treating_patient_hdsr ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "5".treating_patient_hdsr ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    373            �           2604    49535     treating_patient_instrumental id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_instrumental ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_instrumental_id_seq'::regclass);
 L   ALTER TABLE "5".treating_patient_instrumental ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    326    372            �           2604    49536 %   treating_patient_instrumental created    DEFAULT     [   ALTER TABLE ONLY "5".treating_patient_instrumental ALTER COLUMN created SET DEFAULT now();
 Q   ALTER TABLE "5".treating_patient_instrumental ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    372                        2604    49537 &   treating_patient_instrumental modified    DEFAULT     \   ALTER TABLE ONLY "5".treating_patient_instrumental ALTER COLUMN modified SET DEFAULT now();
 R   ALTER TABLE "5".treating_patient_instrumental ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    372            �           2604    49498    treating_patient_mmse id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_mmse ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mmse_id_seq'::regclass);
 D   ALTER TABLE "5".treating_patient_mmse ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    327    368            �           2604    49499    treating_patient_mmse created    DEFAULT     S   ALTER TABLE ONLY "5".treating_patient_mmse ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "5".treating_patient_mmse ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    368            �           2604    49500    treating_patient_mmse modified    DEFAULT     T   ALTER TABLE ONLY "5".treating_patient_mmse ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "5".treating_patient_mmse ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    368            �           2604    49501    treating_patient_mmse img12    DEFAULT     T   ALTER TABLE ONLY "5".treating_patient_mmse ALTER COLUMN img12 SET DEFAULT ''::text;
 G   ALTER TABLE "5".treating_patient_mmse ALTER COLUMN img12 DROP DEFAULT;
       5          postgres    false    368            �           2604    49502    treating_patient_mmse img14    DEFAULT     T   ALTER TABLE ONLY "5".treating_patient_mmse ALTER COLUMN img14 SET DEFAULT ''::text;
 G   ALTER TABLE "5".treating_patient_mmse ALTER COLUMN img14 DROP DEFAULT;
       5          postgres    false    368            �           2604    49503    treating_patient_mmse img12_out    DEFAULT     X   ALTER TABLE ONLY "5".treating_patient_mmse ALTER COLUMN img12_out SET DEFAULT ''::text;
 K   ALTER TABLE "5".treating_patient_mmse ALTER COLUMN img12_out DROP DEFAULT;
       5          postgres    false    368            �           2604    49504    treating_patient_mmse img14_out    DEFAULT     X   ALTER TABLE ONLY "5".treating_patient_mmse ALTER COLUMN img14_out SET DEFAULT ''::text;
 K   ALTER TABLE "5".treating_patient_mmse ALTER COLUMN img14_out DROP DEFAULT;
       5          postgres    false    368            �           2604    49523    treating_patient_mna id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_mna ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mna_id_seq'::regclass);
 C   ALTER TABLE "5".treating_patient_mna ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    328    370            �           2604    49524    treating_patient_mna created    DEFAULT     R   ALTER TABLE ONLY "5".treating_patient_mna ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "5".treating_patient_mna ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    370            �           2604    49525    treating_patient_mna modified    DEFAULT     S   ALTER TABLE ONLY "5".treating_patient_mna ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "5".treating_patient_mna ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    370                       2604    49609    treating_patient_qol_pgc id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_qol_pgc ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_pgc_id_seq'::regclass);
 G   ALTER TABLE "5".treating_patient_qol_pgc ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    329    382                       2604    49610     treating_patient_qol_pgc created    DEFAULT     V   ALTER TABLE ONLY "5".treating_patient_qol_pgc ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "5".treating_patient_qol_pgc ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    382                        2604    49611 !   treating_patient_qol_pgc modified    DEFAULT     W   ALTER TABLE ONLY "5".treating_patient_qol_pgc ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "5".treating_patient_qol_pgc ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    382                       2604    49603    treating_patient_qol_sf8 id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_qol_sf8 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_sf8_id_seq'::regclass);
 G   ALTER TABLE "5".treating_patient_qol_sf8 ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    381    330                       2604    49604     treating_patient_qol_sf8 created    DEFAULT     V   ALTER TABLE ONLY "5".treating_patient_qol_sf8 ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "5".treating_patient_qol_sf8 ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    381                       2604    49605 !   treating_patient_qol_sf8 modified    DEFAULT     W   ALTER TABLE ONLY "5".treating_patient_qol_sf8 ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "5".treating_patient_qol_sf8 ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    381                       2604    49597    treating_patient_sarcopenia id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_sarcopenia ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_id_seq'::regclass);
 J   ALTER TABLE "5".treating_patient_sarcopenia ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    380    331                       2604    49598 #   treating_patient_sarcopenia created    DEFAULT     Y   ALTER TABLE ONLY "5".treating_patient_sarcopenia ALTER COLUMN created SET DEFAULT now();
 O   ALTER TABLE "5".treating_patient_sarcopenia ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    380                       2604    49599 $   treating_patient_sarcopenia modified    DEFAULT     Z   ALTER TABLE ONLY "5".treating_patient_sarcopenia ALTER COLUMN modified SET DEFAULT now();
 P   ALTER TABLE "5".treating_patient_sarcopenia ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    380                       2604    49591 #   treating_patient_sarcopenia_loco id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_sarcopenia_loco ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_loco_id_seq'::regclass);
 O   ALTER TABLE "5".treating_patient_sarcopenia_loco ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    332    379                       2604    49592 (   treating_patient_sarcopenia_loco created    DEFAULT     ^   ALTER TABLE ONLY "5".treating_patient_sarcopenia_loco ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "5".treating_patient_sarcopenia_loco ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    379                       2604    49593 )   treating_patient_sarcopenia_loco modified    DEFAULT     _   ALTER TABLE ONLY "5".treating_patient_sarcopenia_loco ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "5".treating_patient_sarcopenia_loco ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    379                       2604    72248    treating_patient_senion id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_senion ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "5".treating_patient_senion ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    530    524                       2604    72249    treating_patient_senion created    DEFAULT     U   ALTER TABLE ONLY "5".treating_patient_senion ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "5".treating_patient_senion ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    530                       2604    72250     treating_patient_senion modified    DEFAULT     V   ALTER TABLE ONLY "5".treating_patient_senion ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "5".treating_patient_senion ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    530            1           2604    72314    treating_patient_senior id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_senior ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "5".treating_patient_senior ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    524    541            2           2604    72315    treating_patient_senior created    DEFAULT     U   ALTER TABLE ONLY "5".treating_patient_senior ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "5".treating_patient_senior ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    541            3           2604    72316     treating_patient_senior modified    DEFAULT     V   ALTER TABLE ONLY "5".treating_patient_senior ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "5".treating_patient_senior ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    541                       2604    49585    treating_patient_vitality id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_vitality ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_vitality_id_seq'::regclass);
 H   ALTER TABLE "5".treating_patient_vitality ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    333    378                       2604    49586 !   treating_patient_vitality created    DEFAULT     W   ALTER TABLE ONLY "5".treating_patient_vitality ALTER COLUMN created SET DEFAULT now();
 M   ALTER TABLE "5".treating_patient_vitality ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    378                       2604    49587 "   treating_patient_vitality modified    DEFAULT     X   ALTER TABLE ONLY "5".treating_patient_vitality ALTER COLUMN modified SET DEFAULT now();
 N   ALTER TABLE "5".treating_patient_vitality ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    378                       2604    49579    treating_patient_zarit id    DEFAULT     �   ALTER TABLE ONLY "5".treating_patient_zarit ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_zarit_id_seq'::regclass);
 E   ALTER TABLE "5".treating_patient_zarit ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    377    334                       2604    49580    treating_patient_zarit created    DEFAULT     T   ALTER TABLE ONLY "5".treating_patient_zarit ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "5".treating_patient_zarit ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    377                       2604    49581    treating_patient_zarit modified    DEFAULT     U   ALTER TABLE ONLY "5".treating_patient_zarit ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "5".treating_patient_zarit ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    377            �           2604    49529    treating_patients id    DEFAULT     z   ALTER TABLE ONLY "5".treating_patients ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patients_id_seq'::regclass);
 @   ALTER TABLE "5".treating_patients ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    335    371            �           2604    49530    treating_patients created    DEFAULT     O   ALTER TABLE ONLY "5".treating_patients ALTER COLUMN created SET DEFAULT now();
 E   ALTER TABLE "5".treating_patients ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    371            �           2604    49531    treating_patients modified    DEFAULT     P   ALTER TABLE ONLY "5".treating_patients ALTER COLUMN modified SET DEFAULT now();
 F   ALTER TABLE "5".treating_patients ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    371            �           2604    49511    users id    DEFAULT     b   ALTER TABLE ONLY "5".users ALTER COLUMN id SET DEFAULT nextval('"@base".users_id_seq'::regclass);
 4   ALTER TABLE "5".users ALTER COLUMN id DROP DEFAULT;
       5          postgres    false    369    336            �           2604    49512    users is_super_admin    DEFAULT     J   ALTER TABLE ONLY "5".users ALTER COLUMN is_super_admin SET DEFAULT false;
 @   ALTER TABLE "5".users ALTER COLUMN is_super_admin DROP DEFAULT;
       5          postgres    false    369            �           2604    49513    users created    DEFAULT     C   ALTER TABLE ONLY "5".users ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "5".users ALTER COLUMN created DROP DEFAULT;
       5          postgres    false    369            �           2604    49514    users modified    DEFAULT     D   ALTER TABLE ONLY "5".users ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "5".users ALTER COLUMN modified DROP DEFAULT;
       5          postgres    false    369            d           2604    49760    areas id    DEFAULT     b   ALTER TABLE ONLY "6".areas ALTER COLUMN id SET DEFAULT nextval('"@base".areas_id_seq'::regclass);
 4   ALTER TABLE "6".areas ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    402    311            e           2604    49761    areas created    DEFAULT     C   ALTER TABLE ONLY "6".areas ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "6".areas ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    402            f           2604    49762    areas modified    DEFAULT     D   ALTER TABLE ONLY "6".areas ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "6".areas ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    402            `           2604    49750 
   centers id    DEFAULT     f   ALTER TABLE ONLY "6".centers ALTER COLUMN id SET DEFAULT nextval('"@base".centers_id_seq'::regclass);
 6   ALTER TABLE "6".centers ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    401    312            a           2604    49751    centers created    DEFAULT     E   ALTER TABLE ONLY "6".centers ALTER COLUMN created SET DEFAULT now();
 ;   ALTER TABLE "6".centers ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    401            b           2604    49752    centers modified    DEFAULT     F   ALTER TABLE ONLY "6".centers ALTER COLUMN modified SET DEFAULT now();
 <   ALTER TABLE "6".centers ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    401            �           2604    49860    patients id    DEFAULT     h   ALTER TABLE ONLY "6".patients ALTER COLUMN id SET DEFAULT nextval('"@base".patients_id_seq'::regclass);
 7   ALTER TABLE "6".patients ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    418    313            �           2604    49861    patients created    DEFAULT     F   ALTER TABLE ONLY "6".patients ALTER COLUMN created SET DEFAULT now();
 <   ALTER TABLE "6".patients ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    418            �           2604    49862    patients modified    DEFAULT     G   ALTER TABLE ONLY "6".patients ALTER COLUMN modified SET DEFAULT now();
 =   ALTER TABLE "6".patients ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    418            �           2604    49854    treating_patient_adl id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_adl_id_seq'::regclass);
 C   ALTER TABLE "6".treating_patient_adl ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    417    314            �           2604    49855    treating_patient_adl created    DEFAULT     R   ALTER TABLE ONLY "6".treating_patient_adl ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "6".treating_patient_adl ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    417            �           2604    49856    treating_patient_adl modified    DEFAULT     S   ALTER TABLE ONLY "6".treating_patient_adl ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "6".treating_patient_adl ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    417            �           2604    49848    treating_patient_basic_adl id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_basic_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_basic_adl_id_seq'::regclass);
 I   ALTER TABLE "6".treating_patient_basic_adl ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    315    416            �           2604    49849 "   treating_patient_basic_adl created    DEFAULT     X   ALTER TABLE ONLY "6".treating_patient_basic_adl ALTER COLUMN created SET DEFAULT now();
 N   ALTER TABLE "6".treating_patient_basic_adl ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    416            �           2604    49850 #   treating_patient_basic_adl modified    DEFAULT     Y   ALTER TABLE ONLY "6".treating_patient_basic_adl ALTER COLUMN modified SET DEFAULT now();
 O   ALTER TABLE "6".treating_patient_basic_adl ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    416            �           2604    49870    treating_patient_blood_sugar id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_blood_sugar ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_blood_sugar_id_seq'::regclass);
 K   ALTER TABLE "6".treating_patient_blood_sugar ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    316    419            �           2604    49871 $   treating_patient_blood_sugar created    DEFAULT     Z   ALTER TABLE ONLY "6".treating_patient_blood_sugar ALTER COLUMN created SET DEFAULT now();
 P   ALTER TABLE "6".treating_patient_blood_sugar ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    419            �           2604    49872 %   treating_patient_blood_sugar modified    DEFAULT     [   ALTER TABLE ONLY "6".treating_patient_blood_sugar ALTER COLUMN modified SET DEFAULT now();
 Q   ALTER TABLE "6".treating_patient_blood_sugar ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    419            �           2604    49842    treating_patient_cga7 id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_cga7 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_cga7_id_seq'::regclass);
 D   ALTER TABLE "6".treating_patient_cga7 ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    415    317            �           2604    49843    treating_patient_cga7 created    DEFAULT     S   ALTER TABLE ONLY "6".treating_patient_cga7 ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "6".treating_patient_cga7 ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    415            �           2604    49844    treating_patient_cga7 modified    DEFAULT     T   ALTER TABLE ONLY "6".treating_patient_cga7 ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "6".treating_patient_cga7 ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    415            �           2604    49836 #   treating_patient_closure_sticker id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_closure_sticker ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_closure_sticker_id_seq'::regclass);
 O   ALTER TABLE "6".treating_patient_closure_sticker ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    318    414            �           2604    49837 (   treating_patient_closure_sticker created    DEFAULT     ^   ALTER TABLE ONLY "6".treating_patient_closure_sticker ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "6".treating_patient_closure_sticker ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    414            �           2604    49838 )   treating_patient_closure_sticker modified    DEFAULT     _   ALTER TABLE ONLY "6".treating_patient_closure_sticker ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "6".treating_patient_closure_sticker ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    414            �           2604    49830 !   treating_patient_comprehensive id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_comprehensive ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_comprehensive_id_seq'::regclass);
 M   ALTER TABLE "6".treating_patient_comprehensive ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    413    319            �           2604    49831 &   treating_patient_comprehensive created    DEFAULT     \   ALTER TABLE ONLY "6".treating_patient_comprehensive ALTER COLUMN created SET DEFAULT now();
 R   ALTER TABLE "6".treating_patient_comprehensive ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    413            �           2604    49832 '   treating_patient_comprehensive modified    DEFAULT     ]   ALTER TABLE ONLY "6".treating_patient_comprehensive ALTER COLUMN modified SET DEFAULT now();
 S   ALTER TABLE "6".treating_patient_comprehensive ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    413            �           2604    49824    treating_patient_dbd id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_dbd ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_dbd_id_seq'::regclass);
 C   ALTER TABLE "6".treating_patient_dbd ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    320    412            �           2604    49825    treating_patient_dbd created    DEFAULT     R   ALTER TABLE ONLY "6".treating_patient_dbd ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "6".treating_patient_dbd ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    412            �           2604    49826    treating_patient_dbd modified    DEFAULT     S   ALTER TABLE ONLY "6".treating_patient_dbd ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "6".treating_patient_dbd ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    412            �           2604    49818    treating_patient_fra id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_fra ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_id_seq'::regclass);
 C   ALTER TABLE "6".treating_patient_fra ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    411    323            �           2604    49819    treating_patient_fra created    DEFAULT     R   ALTER TABLE ONLY "6".treating_patient_fra ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "6".treating_patient_fra ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    411            �           2604    49820    treating_patient_fra modified    DEFAULT     S   ALTER TABLE ONLY "6".treating_patient_fra ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "6".treating_patient_fra ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    411            }           2604    49812    treating_patient_fra_a id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_fra_a ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_a_id_seq'::regclass);
 E   ALTER TABLE "6".treating_patient_fra_a ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    321    410            ~           2604    49813    treating_patient_fra_a created    DEFAULT     T   ALTER TABLE ONLY "6".treating_patient_fra_a ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "6".treating_patient_fra_a ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    410                       2604    49814    treating_patient_fra_a modified    DEFAULT     U   ALTER TABLE ONLY "6".treating_patient_fra_a ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "6".treating_patient_fra_a ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    410            z           2604    49806    treating_patient_fra_b id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_fra_b ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_b_id_seq'::regclass);
 E   ALTER TABLE "6".treating_patient_fra_b ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    409    322            {           2604    49807    treating_patient_fra_b created    DEFAULT     T   ALTER TABLE ONLY "6".treating_patient_fra_b ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "6".treating_patient_fra_b ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    409            |           2604    49808    treating_patient_fra_b modified    DEFAULT     U   ALTER TABLE ONLY "6".treating_patient_fra_b ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "6".treating_patient_fra_b ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    409            ]           2604    49744    treating_patient_gds15 id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_gds15 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_gds15_id_seq'::regclass);
 E   ALTER TABLE "6".treating_patient_gds15 ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    324    400            ^           2604    49745    treating_patient_gds15 created    DEFAULT     T   ALTER TABLE ONLY "6".treating_patient_gds15 ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "6".treating_patient_gds15 ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    400            _           2604    49746    treating_patient_gds15 modified    DEFAULT     U   ALTER TABLE ONLY "6".treating_patient_gds15 ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "6".treating_patient_gds15 ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    400            Z           2604    49735    treating_patient_hdsr id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_hdsr ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_hdsr_id_seq'::regclass);
 D   ALTER TABLE "6".treating_patient_hdsr ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    399    325            [           2604    49736    treating_patient_hdsr created    DEFAULT     S   ALTER TABLE ONLY "6".treating_patient_hdsr ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "6".treating_patient_hdsr ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    399            \           2604    49737    treating_patient_hdsr modified    DEFAULT     T   ALTER TABLE ONLY "6".treating_patient_hdsr ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "6".treating_patient_hdsr ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    399            W           2604    49726     treating_patient_instrumental id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_instrumental ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_instrumental_id_seq'::regclass);
 L   ALTER TABLE "6".treating_patient_instrumental ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    398    326            X           2604    49727 %   treating_patient_instrumental created    DEFAULT     [   ALTER TABLE ONLY "6".treating_patient_instrumental ALTER COLUMN created SET DEFAULT now();
 Q   ALTER TABLE "6".treating_patient_instrumental ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    398            Y           2604    49728 &   treating_patient_instrumental modified    DEFAULT     \   ALTER TABLE ONLY "6".treating_patient_instrumental ALTER COLUMN modified SET DEFAULT now();
 R   ALTER TABLE "6".treating_patient_instrumental ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    398            D           2604    49689    treating_patient_mmse id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_mmse ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mmse_id_seq'::regclass);
 D   ALTER TABLE "6".treating_patient_mmse ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    394    327            E           2604    49690    treating_patient_mmse created    DEFAULT     S   ALTER TABLE ONLY "6".treating_patient_mmse ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "6".treating_patient_mmse ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    394            F           2604    49691    treating_patient_mmse modified    DEFAULT     T   ALTER TABLE ONLY "6".treating_patient_mmse ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "6".treating_patient_mmse ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    394            G           2604    49692    treating_patient_mmse img12    DEFAULT     T   ALTER TABLE ONLY "6".treating_patient_mmse ALTER COLUMN img12 SET DEFAULT ''::text;
 G   ALTER TABLE "6".treating_patient_mmse ALTER COLUMN img12 DROP DEFAULT;
       6          postgres    false    394            H           2604    49693    treating_patient_mmse img14    DEFAULT     T   ALTER TABLE ONLY "6".treating_patient_mmse ALTER COLUMN img14 SET DEFAULT ''::text;
 G   ALTER TABLE "6".treating_patient_mmse ALTER COLUMN img14 DROP DEFAULT;
       6          postgres    false    394            I           2604    49694    treating_patient_mmse img12_out    DEFAULT     X   ALTER TABLE ONLY "6".treating_patient_mmse ALTER COLUMN img12_out SET DEFAULT ''::text;
 K   ALTER TABLE "6".treating_patient_mmse ALTER COLUMN img12_out DROP DEFAULT;
       6          postgres    false    394            J           2604    49695    treating_patient_mmse img14_out    DEFAULT     X   ALTER TABLE ONLY "6".treating_patient_mmse ALTER COLUMN img14_out SET DEFAULT ''::text;
 K   ALTER TABLE "6".treating_patient_mmse ALTER COLUMN img14_out DROP DEFAULT;
       6          postgres    false    394            Q           2604    49714    treating_patient_mna id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_mna ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mna_id_seq'::regclass);
 C   ALTER TABLE "6".treating_patient_mna ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    396    328            R           2604    49715    treating_patient_mna created    DEFAULT     R   ALTER TABLE ONLY "6".treating_patient_mna ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "6".treating_patient_mna ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    396            S           2604    49716    treating_patient_mna modified    DEFAULT     S   ALTER TABLE ONLY "6".treating_patient_mna ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "6".treating_patient_mna ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    396            w           2604    49800    treating_patient_qol_pgc id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_qol_pgc ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_pgc_id_seq'::regclass);
 G   ALTER TABLE "6".treating_patient_qol_pgc ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    408    329            x           2604    49801     treating_patient_qol_pgc created    DEFAULT     V   ALTER TABLE ONLY "6".treating_patient_qol_pgc ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "6".treating_patient_qol_pgc ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    408            y           2604    49802 !   treating_patient_qol_pgc modified    DEFAULT     W   ALTER TABLE ONLY "6".treating_patient_qol_pgc ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "6".treating_patient_qol_pgc ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    408            t           2604    49794    treating_patient_qol_sf8 id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_qol_sf8 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_sf8_id_seq'::regclass);
 G   ALTER TABLE "6".treating_patient_qol_sf8 ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    330    407            u           2604    49795     treating_patient_qol_sf8 created    DEFAULT     V   ALTER TABLE ONLY "6".treating_patient_qol_sf8 ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "6".treating_patient_qol_sf8 ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    407            v           2604    49796 !   treating_patient_qol_sf8 modified    DEFAULT     W   ALTER TABLE ONLY "6".treating_patient_qol_sf8 ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "6".treating_patient_qol_sf8 ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    407            q           2604    49788    treating_patient_sarcopenia id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_sarcopenia ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_id_seq'::regclass);
 J   ALTER TABLE "6".treating_patient_sarcopenia ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    406    331            r           2604    49789 #   treating_patient_sarcopenia created    DEFAULT     Y   ALTER TABLE ONLY "6".treating_patient_sarcopenia ALTER COLUMN created SET DEFAULT now();
 O   ALTER TABLE "6".treating_patient_sarcopenia ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    406            s           2604    49790 $   treating_patient_sarcopenia modified    DEFAULT     Z   ALTER TABLE ONLY "6".treating_patient_sarcopenia ALTER COLUMN modified SET DEFAULT now();
 P   ALTER TABLE "6".treating_patient_sarcopenia ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    406            n           2604    49782 #   treating_patient_sarcopenia_loco id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_sarcopenia_loco ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_loco_id_seq'::regclass);
 O   ALTER TABLE "6".treating_patient_sarcopenia_loco ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    405    332            o           2604    49783 (   treating_patient_sarcopenia_loco created    DEFAULT     ^   ALTER TABLE ONLY "6".treating_patient_sarcopenia_loco ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "6".treating_patient_sarcopenia_loco ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    405            p           2604    49784 )   treating_patient_sarcopenia_loco modified    DEFAULT     _   ALTER TABLE ONLY "6".treating_patient_sarcopenia_loco ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "6".treating_patient_sarcopenia_loco ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    405                       2604    72254    treating_patient_senion id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_senion ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "6".treating_patient_senion ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    531    524                       2604    72255    treating_patient_senion created    DEFAULT     U   ALTER TABLE ONLY "6".treating_patient_senion ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "6".treating_patient_senion ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    531                       2604    72256     treating_patient_senion modified    DEFAULT     V   ALTER TABLE ONLY "6".treating_patient_senion ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "6".treating_patient_senion ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    531            .           2604    72308    treating_patient_senior id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_senior ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "6".treating_patient_senior ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    540    524            /           2604    72309    treating_patient_senior created    DEFAULT     U   ALTER TABLE ONLY "6".treating_patient_senior ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "6".treating_patient_senior ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    540            0           2604    72310     treating_patient_senior modified    DEFAULT     V   ALTER TABLE ONLY "6".treating_patient_senior ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "6".treating_patient_senior ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    540            k           2604    49776    treating_patient_vitality id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_vitality ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_vitality_id_seq'::regclass);
 H   ALTER TABLE "6".treating_patient_vitality ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    404    333            l           2604    49777 !   treating_patient_vitality created    DEFAULT     W   ALTER TABLE ONLY "6".treating_patient_vitality ALTER COLUMN created SET DEFAULT now();
 M   ALTER TABLE "6".treating_patient_vitality ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    404            m           2604    49778 "   treating_patient_vitality modified    DEFAULT     X   ALTER TABLE ONLY "6".treating_patient_vitality ALTER COLUMN modified SET DEFAULT now();
 N   ALTER TABLE "6".treating_patient_vitality ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    404            h           2604    49770    treating_patient_zarit id    DEFAULT     �   ALTER TABLE ONLY "6".treating_patient_zarit ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_zarit_id_seq'::regclass);
 E   ALTER TABLE "6".treating_patient_zarit ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    403    334            i           2604    49771    treating_patient_zarit created    DEFAULT     T   ALTER TABLE ONLY "6".treating_patient_zarit ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "6".treating_patient_zarit ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    403            j           2604    49772    treating_patient_zarit modified    DEFAULT     U   ALTER TABLE ONLY "6".treating_patient_zarit ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "6".treating_patient_zarit ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    403            T           2604    49720    treating_patients id    DEFAULT     z   ALTER TABLE ONLY "6".treating_patients ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patients_id_seq'::regclass);
 @   ALTER TABLE "6".treating_patients ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    397    335            U           2604    49721    treating_patients created    DEFAULT     O   ALTER TABLE ONLY "6".treating_patients ALTER COLUMN created SET DEFAULT now();
 E   ALTER TABLE "6".treating_patients ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    397            V           2604    49722    treating_patients modified    DEFAULT     P   ALTER TABLE ONLY "6".treating_patients ALTER COLUMN modified SET DEFAULT now();
 F   ALTER TABLE "6".treating_patients ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    397            K           2604    49702    users id    DEFAULT     b   ALTER TABLE ONLY "6".users ALTER COLUMN id SET DEFAULT nextval('"@base".users_id_seq'::regclass);
 4   ALTER TABLE "6".users ALTER COLUMN id DROP DEFAULT;
       6          postgres    false    336    395            L           2604    49703    users is_super_admin    DEFAULT     J   ALTER TABLE ONLY "6".users ALTER COLUMN is_super_admin SET DEFAULT false;
 @   ALTER TABLE "6".users ALTER COLUMN is_super_admin DROP DEFAULT;
       6          postgres    false    395            M           2604    49704    users created    DEFAULT     C   ALTER TABLE ONLY "6".users ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "6".users ALTER COLUMN created DROP DEFAULT;
       6          postgres    false    395            N           2604    49705    users modified    DEFAULT     D   ALTER TABLE ONLY "6".users ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "6".users ALTER COLUMN modified DROP DEFAULT;
       6          postgres    false    395            �           2604    49951    areas id    DEFAULT     b   ALTER TABLE ONLY "7".areas ALTER COLUMN id SET DEFAULT nextval('"@base".areas_id_seq'::regclass);
 4   ALTER TABLE "7".areas ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    428    311            �           2604    49952    areas created    DEFAULT     C   ALTER TABLE ONLY "7".areas ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "7".areas ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    428            �           2604    49953    areas modified    DEFAULT     D   ALTER TABLE ONLY "7".areas ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "7".areas ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    428            �           2604    49941 
   centers id    DEFAULT     f   ALTER TABLE ONLY "7".centers ALTER COLUMN id SET DEFAULT nextval('"@base".centers_id_seq'::regclass);
 6   ALTER TABLE "7".centers ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    427    312            �           2604    49942    centers created    DEFAULT     E   ALTER TABLE ONLY "7".centers ALTER COLUMN created SET DEFAULT now();
 ;   ALTER TABLE "7".centers ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    427            �           2604    49943    centers modified    DEFAULT     F   ALTER TABLE ONLY "7".centers ALTER COLUMN modified SET DEFAULT now();
 <   ALTER TABLE "7".centers ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    427            �           2604    50051    patients id    DEFAULT     h   ALTER TABLE ONLY "7".patients ALTER COLUMN id SET DEFAULT nextval('"@base".patients_id_seq'::regclass);
 7   ALTER TABLE "7".patients ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    444    313            �           2604    50052    patients created    DEFAULT     F   ALTER TABLE ONLY "7".patients ALTER COLUMN created SET DEFAULT now();
 <   ALTER TABLE "7".patients ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    444            �           2604    50053    patients modified    DEFAULT     G   ALTER TABLE ONLY "7".patients ALTER COLUMN modified SET DEFAULT now();
 =   ALTER TABLE "7".patients ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    444            �           2604    50045    treating_patient_adl id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_adl_id_seq'::regclass);
 C   ALTER TABLE "7".treating_patient_adl ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    443    314            �           2604    50046    treating_patient_adl created    DEFAULT     R   ALTER TABLE ONLY "7".treating_patient_adl ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "7".treating_patient_adl ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    443            �           2604    50047    treating_patient_adl modified    DEFAULT     S   ALTER TABLE ONLY "7".treating_patient_adl ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "7".treating_patient_adl ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    443            �           2604    50039    treating_patient_basic_adl id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_basic_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_basic_adl_id_seq'::regclass);
 I   ALTER TABLE "7".treating_patient_basic_adl ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    442    315            �           2604    50040 "   treating_patient_basic_adl created    DEFAULT     X   ALTER TABLE ONLY "7".treating_patient_basic_adl ALTER COLUMN created SET DEFAULT now();
 N   ALTER TABLE "7".treating_patient_basic_adl ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    442            �           2604    50041 #   treating_patient_basic_adl modified    DEFAULT     Y   ALTER TABLE ONLY "7".treating_patient_basic_adl ALTER COLUMN modified SET DEFAULT now();
 O   ALTER TABLE "7".treating_patient_basic_adl ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    442            �           2604    50061    treating_patient_blood_sugar id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_blood_sugar ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_blood_sugar_id_seq'::regclass);
 K   ALTER TABLE "7".treating_patient_blood_sugar ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    445    316            �           2604    50062 $   treating_patient_blood_sugar created    DEFAULT     Z   ALTER TABLE ONLY "7".treating_patient_blood_sugar ALTER COLUMN created SET DEFAULT now();
 P   ALTER TABLE "7".treating_patient_blood_sugar ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    445            �           2604    50063 %   treating_patient_blood_sugar modified    DEFAULT     [   ALTER TABLE ONLY "7".treating_patient_blood_sugar ALTER COLUMN modified SET DEFAULT now();
 Q   ALTER TABLE "7".treating_patient_blood_sugar ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    445            �           2604    50033    treating_patient_cga7 id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_cga7 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_cga7_id_seq'::regclass);
 D   ALTER TABLE "7".treating_patient_cga7 ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    441    317            �           2604    50034    treating_patient_cga7 created    DEFAULT     S   ALTER TABLE ONLY "7".treating_patient_cga7 ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "7".treating_patient_cga7 ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    441            �           2604    50035    treating_patient_cga7 modified    DEFAULT     T   ALTER TABLE ONLY "7".treating_patient_cga7 ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "7".treating_patient_cga7 ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    441            �           2604    50027 #   treating_patient_closure_sticker id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_closure_sticker ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_closure_sticker_id_seq'::regclass);
 O   ALTER TABLE "7".treating_patient_closure_sticker ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    440    318            �           2604    50028 (   treating_patient_closure_sticker created    DEFAULT     ^   ALTER TABLE ONLY "7".treating_patient_closure_sticker ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "7".treating_patient_closure_sticker ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    440            �           2604    50029 )   treating_patient_closure_sticker modified    DEFAULT     _   ALTER TABLE ONLY "7".treating_patient_closure_sticker ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "7".treating_patient_closure_sticker ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    440            �           2604    50021 !   treating_patient_comprehensive id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_comprehensive ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_comprehensive_id_seq'::regclass);
 M   ALTER TABLE "7".treating_patient_comprehensive ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    439    319            �           2604    50022 &   treating_patient_comprehensive created    DEFAULT     \   ALTER TABLE ONLY "7".treating_patient_comprehensive ALTER COLUMN created SET DEFAULT now();
 R   ALTER TABLE "7".treating_patient_comprehensive ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    439            �           2604    50023 '   treating_patient_comprehensive modified    DEFAULT     ]   ALTER TABLE ONLY "7".treating_patient_comprehensive ALTER COLUMN modified SET DEFAULT now();
 S   ALTER TABLE "7".treating_patient_comprehensive ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    439            �           2604    50015    treating_patient_dbd id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_dbd ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_dbd_id_seq'::regclass);
 C   ALTER TABLE "7".treating_patient_dbd ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    438    320            �           2604    50016    treating_patient_dbd created    DEFAULT     R   ALTER TABLE ONLY "7".treating_patient_dbd ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "7".treating_patient_dbd ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    438            �           2604    50017    treating_patient_dbd modified    DEFAULT     S   ALTER TABLE ONLY "7".treating_patient_dbd ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "7".treating_patient_dbd ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    438            �           2604    50009    treating_patient_fra id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_fra ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_id_seq'::regclass);
 C   ALTER TABLE "7".treating_patient_fra ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    437    323            �           2604    50010    treating_patient_fra created    DEFAULT     R   ALTER TABLE ONLY "7".treating_patient_fra ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "7".treating_patient_fra ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    437            �           2604    50011    treating_patient_fra modified    DEFAULT     S   ALTER TABLE ONLY "7".treating_patient_fra ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "7".treating_patient_fra ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    437            �           2604    50003    treating_patient_fra_a id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_fra_a ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_a_id_seq'::regclass);
 E   ALTER TABLE "7".treating_patient_fra_a ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    436    321            �           2604    50004    treating_patient_fra_a created    DEFAULT     T   ALTER TABLE ONLY "7".treating_patient_fra_a ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "7".treating_patient_fra_a ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    436            �           2604    50005    treating_patient_fra_a modified    DEFAULT     U   ALTER TABLE ONLY "7".treating_patient_fra_a ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "7".treating_patient_fra_a ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    436            �           2604    49997    treating_patient_fra_b id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_fra_b ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_b_id_seq'::regclass);
 E   ALTER TABLE "7".treating_patient_fra_b ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    435    322            �           2604    49998    treating_patient_fra_b created    DEFAULT     T   ALTER TABLE ONLY "7".treating_patient_fra_b ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "7".treating_patient_fra_b ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    435            �           2604    49999    treating_patient_fra_b modified    DEFAULT     U   ALTER TABLE ONLY "7".treating_patient_fra_b ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "7".treating_patient_fra_b ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    435            �           2604    49935    treating_patient_gds15 id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_gds15 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_gds15_id_seq'::regclass);
 E   ALTER TABLE "7".treating_patient_gds15 ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    426    324            �           2604    49936    treating_patient_gds15 created    DEFAULT     T   ALTER TABLE ONLY "7".treating_patient_gds15 ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "7".treating_patient_gds15 ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    426            �           2604    49937    treating_patient_gds15 modified    DEFAULT     U   ALTER TABLE ONLY "7".treating_patient_gds15 ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "7".treating_patient_gds15 ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    426            �           2604    49926    treating_patient_hdsr id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_hdsr ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_hdsr_id_seq'::regclass);
 D   ALTER TABLE "7".treating_patient_hdsr ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    425    325            �           2604    49927    treating_patient_hdsr created    DEFAULT     S   ALTER TABLE ONLY "7".treating_patient_hdsr ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "7".treating_patient_hdsr ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    425            �           2604    49928    treating_patient_hdsr modified    DEFAULT     T   ALTER TABLE ONLY "7".treating_patient_hdsr ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "7".treating_patient_hdsr ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    425            �           2604    49917     treating_patient_instrumental id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_instrumental ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_instrumental_id_seq'::regclass);
 L   ALTER TABLE "7".treating_patient_instrumental ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    326    424            �           2604    49918 %   treating_patient_instrumental created    DEFAULT     [   ALTER TABLE ONLY "7".treating_patient_instrumental ALTER COLUMN created SET DEFAULT now();
 Q   ALTER TABLE "7".treating_patient_instrumental ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    424            �           2604    49919 &   treating_patient_instrumental modified    DEFAULT     \   ALTER TABLE ONLY "7".treating_patient_instrumental ALTER COLUMN modified SET DEFAULT now();
 R   ALTER TABLE "7".treating_patient_instrumental ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    424            �           2604    49880    treating_patient_mmse id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_mmse ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mmse_id_seq'::regclass);
 D   ALTER TABLE "7".treating_patient_mmse ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    420    327            �           2604    49881    treating_patient_mmse created    DEFAULT     S   ALTER TABLE ONLY "7".treating_patient_mmse ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "7".treating_patient_mmse ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    420            �           2604    49882    treating_patient_mmse modified    DEFAULT     T   ALTER TABLE ONLY "7".treating_patient_mmse ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "7".treating_patient_mmse ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    420            �           2604    49883    treating_patient_mmse img12    DEFAULT     T   ALTER TABLE ONLY "7".treating_patient_mmse ALTER COLUMN img12 SET DEFAULT ''::text;
 G   ALTER TABLE "7".treating_patient_mmse ALTER COLUMN img12 DROP DEFAULT;
       7          postgres    false    420            �           2604    49884    treating_patient_mmse img14    DEFAULT     T   ALTER TABLE ONLY "7".treating_patient_mmse ALTER COLUMN img14 SET DEFAULT ''::text;
 G   ALTER TABLE "7".treating_patient_mmse ALTER COLUMN img14 DROP DEFAULT;
       7          postgres    false    420            �           2604    49885    treating_patient_mmse img12_out    DEFAULT     X   ALTER TABLE ONLY "7".treating_patient_mmse ALTER COLUMN img12_out SET DEFAULT ''::text;
 K   ALTER TABLE "7".treating_patient_mmse ALTER COLUMN img12_out DROP DEFAULT;
       7          postgres    false    420            �           2604    49886    treating_patient_mmse img14_out    DEFAULT     X   ALTER TABLE ONLY "7".treating_patient_mmse ALTER COLUMN img14_out SET DEFAULT ''::text;
 K   ALTER TABLE "7".treating_patient_mmse ALTER COLUMN img14_out DROP DEFAULT;
       7          postgres    false    420            �           2604    49905    treating_patient_mna id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_mna ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mna_id_seq'::regclass);
 C   ALTER TABLE "7".treating_patient_mna ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    422    328            �           2604    49906    treating_patient_mna created    DEFAULT     R   ALTER TABLE ONLY "7".treating_patient_mna ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "7".treating_patient_mna ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    422            �           2604    49907    treating_patient_mna modified    DEFAULT     S   ALTER TABLE ONLY "7".treating_patient_mna ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "7".treating_patient_mna ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    422            �           2604    49991    treating_patient_qol_pgc id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_qol_pgc ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_pgc_id_seq'::regclass);
 G   ALTER TABLE "7".treating_patient_qol_pgc ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    434    329            �           2604    49992     treating_patient_qol_pgc created    DEFAULT     V   ALTER TABLE ONLY "7".treating_patient_qol_pgc ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "7".treating_patient_qol_pgc ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    434            �           2604    49993 !   treating_patient_qol_pgc modified    DEFAULT     W   ALTER TABLE ONLY "7".treating_patient_qol_pgc ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "7".treating_patient_qol_pgc ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    434            �           2604    49985    treating_patient_qol_sf8 id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_qol_sf8 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_sf8_id_seq'::regclass);
 G   ALTER TABLE "7".treating_patient_qol_sf8 ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    433    330            �           2604    49986     treating_patient_qol_sf8 created    DEFAULT     V   ALTER TABLE ONLY "7".treating_patient_qol_sf8 ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "7".treating_patient_qol_sf8 ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    433            �           2604    49987 !   treating_patient_qol_sf8 modified    DEFAULT     W   ALTER TABLE ONLY "7".treating_patient_qol_sf8 ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "7".treating_patient_qol_sf8 ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    433            �           2604    49979    treating_patient_sarcopenia id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_sarcopenia ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_id_seq'::regclass);
 J   ALTER TABLE "7".treating_patient_sarcopenia ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    432    331            �           2604    49980 #   treating_patient_sarcopenia created    DEFAULT     Y   ALTER TABLE ONLY "7".treating_patient_sarcopenia ALTER COLUMN created SET DEFAULT now();
 O   ALTER TABLE "7".treating_patient_sarcopenia ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    432            �           2604    49981 $   treating_patient_sarcopenia modified    DEFAULT     Z   ALTER TABLE ONLY "7".treating_patient_sarcopenia ALTER COLUMN modified SET DEFAULT now();
 P   ALTER TABLE "7".treating_patient_sarcopenia ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    432            �           2604    49973 #   treating_patient_sarcopenia_loco id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_sarcopenia_loco ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_loco_id_seq'::regclass);
 O   ALTER TABLE "7".treating_patient_sarcopenia_loco ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    431    332            �           2604    49974 (   treating_patient_sarcopenia_loco created    DEFAULT     ^   ALTER TABLE ONLY "7".treating_patient_sarcopenia_loco ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "7".treating_patient_sarcopenia_loco ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    431            �           2604    49975 )   treating_patient_sarcopenia_loco modified    DEFAULT     _   ALTER TABLE ONLY "7".treating_patient_sarcopenia_loco ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "7".treating_patient_sarcopenia_loco ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    431                       2604    72260    treating_patient_senion id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_senion ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "7".treating_patient_senion ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    532    524                       2604    72261    treating_patient_senion created    DEFAULT     U   ALTER TABLE ONLY "7".treating_patient_senion ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "7".treating_patient_senion ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    532                       2604    72262     treating_patient_senion modified    DEFAULT     V   ALTER TABLE ONLY "7".treating_patient_senion ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "7".treating_patient_senion ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    532            +           2604    72302    treating_patient_senior id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_senior ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "7".treating_patient_senior ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    539    524            ,           2604    72303    treating_patient_senior created    DEFAULT     U   ALTER TABLE ONLY "7".treating_patient_senior ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "7".treating_patient_senior ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    539            -           2604    72304     treating_patient_senior modified    DEFAULT     V   ALTER TABLE ONLY "7".treating_patient_senior ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "7".treating_patient_senior ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    539            �           2604    49967    treating_patient_vitality id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_vitality ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_vitality_id_seq'::regclass);
 H   ALTER TABLE "7".treating_patient_vitality ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    430    333            �           2604    49968 !   treating_patient_vitality created    DEFAULT     W   ALTER TABLE ONLY "7".treating_patient_vitality ALTER COLUMN created SET DEFAULT now();
 M   ALTER TABLE "7".treating_patient_vitality ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    430            �           2604    49969 "   treating_patient_vitality modified    DEFAULT     X   ALTER TABLE ONLY "7".treating_patient_vitality ALTER COLUMN modified SET DEFAULT now();
 N   ALTER TABLE "7".treating_patient_vitality ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    430            �           2604    49961    treating_patient_zarit id    DEFAULT     �   ALTER TABLE ONLY "7".treating_patient_zarit ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_zarit_id_seq'::regclass);
 E   ALTER TABLE "7".treating_patient_zarit ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    429    334            �           2604    49962    treating_patient_zarit created    DEFAULT     T   ALTER TABLE ONLY "7".treating_patient_zarit ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "7".treating_patient_zarit ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    429            �           2604    49963    treating_patient_zarit modified    DEFAULT     U   ALTER TABLE ONLY "7".treating_patient_zarit ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "7".treating_patient_zarit ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    429            �           2604    49911    treating_patients id    DEFAULT     z   ALTER TABLE ONLY "7".treating_patients ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patients_id_seq'::regclass);
 @   ALTER TABLE "7".treating_patients ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    335    423            �           2604    49912    treating_patients created    DEFAULT     O   ALTER TABLE ONLY "7".treating_patients ALTER COLUMN created SET DEFAULT now();
 E   ALTER TABLE "7".treating_patients ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    423            �           2604    49913    treating_patients modified    DEFAULT     P   ALTER TABLE ONLY "7".treating_patients ALTER COLUMN modified SET DEFAULT now();
 F   ALTER TABLE "7".treating_patients ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    423            �           2604    49893    users id    DEFAULT     b   ALTER TABLE ONLY "7".users ALTER COLUMN id SET DEFAULT nextval('"@base".users_id_seq'::regclass);
 4   ALTER TABLE "7".users ALTER COLUMN id DROP DEFAULT;
       7          postgres    false    336    421            �           2604    49894    users is_super_admin    DEFAULT     J   ALTER TABLE ONLY "7".users ALTER COLUMN is_super_admin SET DEFAULT false;
 @   ALTER TABLE "7".users ALTER COLUMN is_super_admin DROP DEFAULT;
       7          postgres    false    421            �           2604    49895    users created    DEFAULT     C   ALTER TABLE ONLY "7".users ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "7".users ALTER COLUMN created DROP DEFAULT;
       7          postgres    false    421            �           2604    49896    users modified    DEFAULT     D   ALTER TABLE ONLY "7".users ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "7".users ALTER COLUMN modified DROP DEFAULT;
       7          postgres    false    421                       2604    50142    areas id    DEFAULT     b   ALTER TABLE ONLY "8".areas ALTER COLUMN id SET DEFAULT nextval('"@base".areas_id_seq'::regclass);
 4   ALTER TABLE "8".areas ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    454    311                       2604    50143    areas created    DEFAULT     C   ALTER TABLE ONLY "8".areas ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "8".areas ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    454                       2604    50144    areas modified    DEFAULT     D   ALTER TABLE ONLY "8".areas ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "8".areas ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    454                       2604    50132 
   centers id    DEFAULT     f   ALTER TABLE ONLY "8".centers ALTER COLUMN id SET DEFAULT nextval('"@base".centers_id_seq'::regclass);
 6   ALTER TABLE "8".centers ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    453    312                       2604    50133    centers created    DEFAULT     E   ALTER TABLE ONLY "8".centers ALTER COLUMN created SET DEFAULT now();
 ;   ALTER TABLE "8".centers ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    453                       2604    50134    centers modified    DEFAULT     F   ALTER TABLE ONLY "8".centers ALTER COLUMN modified SET DEFAULT now();
 <   ALTER TABLE "8".centers ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    453            G           2604    50242    patients id    DEFAULT     h   ALTER TABLE ONLY "8".patients ALTER COLUMN id SET DEFAULT nextval('"@base".patients_id_seq'::regclass);
 7   ALTER TABLE "8".patients ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    470    313            H           2604    50243    patients created    DEFAULT     F   ALTER TABLE ONLY "8".patients ALTER COLUMN created SET DEFAULT now();
 <   ALTER TABLE "8".patients ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    470            I           2604    50244    patients modified    DEFAULT     G   ALTER TABLE ONLY "8".patients ALTER COLUMN modified SET DEFAULT now();
 =   ALTER TABLE "8".patients ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    470            D           2604    50236    treating_patient_adl id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_adl_id_seq'::regclass);
 C   ALTER TABLE "8".treating_patient_adl ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    469    314            E           2604    50237    treating_patient_adl created    DEFAULT     R   ALTER TABLE ONLY "8".treating_patient_adl ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "8".treating_patient_adl ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    469            F           2604    50238    treating_patient_adl modified    DEFAULT     S   ALTER TABLE ONLY "8".treating_patient_adl ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "8".treating_patient_adl ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    469            A           2604    50230    treating_patient_basic_adl id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_basic_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_basic_adl_id_seq'::regclass);
 I   ALTER TABLE "8".treating_patient_basic_adl ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    468    315            B           2604    50231 "   treating_patient_basic_adl created    DEFAULT     X   ALTER TABLE ONLY "8".treating_patient_basic_adl ALTER COLUMN created SET DEFAULT now();
 N   ALTER TABLE "8".treating_patient_basic_adl ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    468            C           2604    50232 #   treating_patient_basic_adl modified    DEFAULT     Y   ALTER TABLE ONLY "8".treating_patient_basic_adl ALTER COLUMN modified SET DEFAULT now();
 O   ALTER TABLE "8".treating_patient_basic_adl ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    468            L           2604    50252    treating_patient_blood_sugar id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_blood_sugar ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_blood_sugar_id_seq'::regclass);
 K   ALTER TABLE "8".treating_patient_blood_sugar ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    471    316            M           2604    50253 $   treating_patient_blood_sugar created    DEFAULT     Z   ALTER TABLE ONLY "8".treating_patient_blood_sugar ALTER COLUMN created SET DEFAULT now();
 P   ALTER TABLE "8".treating_patient_blood_sugar ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    471            N           2604    50254 %   treating_patient_blood_sugar modified    DEFAULT     [   ALTER TABLE ONLY "8".treating_patient_blood_sugar ALTER COLUMN modified SET DEFAULT now();
 Q   ALTER TABLE "8".treating_patient_blood_sugar ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    471            >           2604    50224    treating_patient_cga7 id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_cga7 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_cga7_id_seq'::regclass);
 D   ALTER TABLE "8".treating_patient_cga7 ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    467    317            ?           2604    50225    treating_patient_cga7 created    DEFAULT     S   ALTER TABLE ONLY "8".treating_patient_cga7 ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "8".treating_patient_cga7 ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    467            @           2604    50226    treating_patient_cga7 modified    DEFAULT     T   ALTER TABLE ONLY "8".treating_patient_cga7 ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "8".treating_patient_cga7 ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    467            ;           2604    50218 #   treating_patient_closure_sticker id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_closure_sticker ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_closure_sticker_id_seq'::regclass);
 O   ALTER TABLE "8".treating_patient_closure_sticker ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    466    318            <           2604    50219 (   treating_patient_closure_sticker created    DEFAULT     ^   ALTER TABLE ONLY "8".treating_patient_closure_sticker ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "8".treating_patient_closure_sticker ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    466            =           2604    50220 )   treating_patient_closure_sticker modified    DEFAULT     _   ALTER TABLE ONLY "8".treating_patient_closure_sticker ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "8".treating_patient_closure_sticker ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    466            8           2604    50212 !   treating_patient_comprehensive id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_comprehensive ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_comprehensive_id_seq'::regclass);
 M   ALTER TABLE "8".treating_patient_comprehensive ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    465    319            9           2604    50213 &   treating_patient_comprehensive created    DEFAULT     \   ALTER TABLE ONLY "8".treating_patient_comprehensive ALTER COLUMN created SET DEFAULT now();
 R   ALTER TABLE "8".treating_patient_comprehensive ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    465            :           2604    50214 '   treating_patient_comprehensive modified    DEFAULT     ]   ALTER TABLE ONLY "8".treating_patient_comprehensive ALTER COLUMN modified SET DEFAULT now();
 S   ALTER TABLE "8".treating_patient_comprehensive ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    465            5           2604    50206    treating_patient_dbd id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_dbd ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_dbd_id_seq'::regclass);
 C   ALTER TABLE "8".treating_patient_dbd ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    464    320            6           2604    50207    treating_patient_dbd created    DEFAULT     R   ALTER TABLE ONLY "8".treating_patient_dbd ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "8".treating_patient_dbd ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    464            7           2604    50208    treating_patient_dbd modified    DEFAULT     S   ALTER TABLE ONLY "8".treating_patient_dbd ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "8".treating_patient_dbd ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    464            2           2604    50200    treating_patient_fra id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_fra ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_id_seq'::regclass);
 C   ALTER TABLE "8".treating_patient_fra ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    463    323            3           2604    50201    treating_patient_fra created    DEFAULT     R   ALTER TABLE ONLY "8".treating_patient_fra ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "8".treating_patient_fra ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    463            4           2604    50202    treating_patient_fra modified    DEFAULT     S   ALTER TABLE ONLY "8".treating_patient_fra ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "8".treating_patient_fra ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    463            /           2604    50194    treating_patient_fra_a id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_fra_a ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_a_id_seq'::regclass);
 E   ALTER TABLE "8".treating_patient_fra_a ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    462    321            0           2604    50195    treating_patient_fra_a created    DEFAULT     T   ALTER TABLE ONLY "8".treating_patient_fra_a ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "8".treating_patient_fra_a ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    462            1           2604    50196    treating_patient_fra_a modified    DEFAULT     U   ALTER TABLE ONLY "8".treating_patient_fra_a ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "8".treating_patient_fra_a ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    462            ,           2604    50188    treating_patient_fra_b id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_fra_b ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_b_id_seq'::regclass);
 E   ALTER TABLE "8".treating_patient_fra_b ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    461    322            -           2604    50189    treating_patient_fra_b created    DEFAULT     T   ALTER TABLE ONLY "8".treating_patient_fra_b ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "8".treating_patient_fra_b ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    461            .           2604    50190    treating_patient_fra_b modified    DEFAULT     U   ALTER TABLE ONLY "8".treating_patient_fra_b ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "8".treating_patient_fra_b ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    461                       2604    50126    treating_patient_gds15 id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_gds15 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_gds15_id_seq'::regclass);
 E   ALTER TABLE "8".treating_patient_gds15 ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    452    324                       2604    50127    treating_patient_gds15 created    DEFAULT     T   ALTER TABLE ONLY "8".treating_patient_gds15 ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "8".treating_patient_gds15 ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    452                       2604    50128    treating_patient_gds15 modified    DEFAULT     U   ALTER TABLE ONLY "8".treating_patient_gds15 ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "8".treating_patient_gds15 ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    452                       2604    50117    treating_patient_hdsr id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_hdsr ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_hdsr_id_seq'::regclass);
 D   ALTER TABLE "8".treating_patient_hdsr ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    451    325                       2604    50118    treating_patient_hdsr created    DEFAULT     S   ALTER TABLE ONLY "8".treating_patient_hdsr ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "8".treating_patient_hdsr ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    451                       2604    50119    treating_patient_hdsr modified    DEFAULT     T   ALTER TABLE ONLY "8".treating_patient_hdsr ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "8".treating_patient_hdsr ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    451            	           2604    50108     treating_patient_instrumental id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_instrumental ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_instrumental_id_seq'::regclass);
 L   ALTER TABLE "8".treating_patient_instrumental ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    450    326            
           2604    50109 %   treating_patient_instrumental created    DEFAULT     [   ALTER TABLE ONLY "8".treating_patient_instrumental ALTER COLUMN created SET DEFAULT now();
 Q   ALTER TABLE "8".treating_patient_instrumental ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    450                       2604    50110 &   treating_patient_instrumental modified    DEFAULT     \   ALTER TABLE ONLY "8".treating_patient_instrumental ALTER COLUMN modified SET DEFAULT now();
 R   ALTER TABLE "8".treating_patient_instrumental ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    450            �           2604    50071    treating_patient_mmse id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_mmse ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mmse_id_seq'::regclass);
 D   ALTER TABLE "8".treating_patient_mmse ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    446    327            �           2604    50072    treating_patient_mmse created    DEFAULT     S   ALTER TABLE ONLY "8".treating_patient_mmse ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "8".treating_patient_mmse ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    446            �           2604    50073    treating_patient_mmse modified    DEFAULT     T   ALTER TABLE ONLY "8".treating_patient_mmse ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "8".treating_patient_mmse ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    446            �           2604    50074    treating_patient_mmse img12    DEFAULT     T   ALTER TABLE ONLY "8".treating_patient_mmse ALTER COLUMN img12 SET DEFAULT ''::text;
 G   ALTER TABLE "8".treating_patient_mmse ALTER COLUMN img12 DROP DEFAULT;
       8          postgres    false    446            �           2604    50075    treating_patient_mmse img14    DEFAULT     T   ALTER TABLE ONLY "8".treating_patient_mmse ALTER COLUMN img14 SET DEFAULT ''::text;
 G   ALTER TABLE "8".treating_patient_mmse ALTER COLUMN img14 DROP DEFAULT;
       8          postgres    false    446            �           2604    50076    treating_patient_mmse img12_out    DEFAULT     X   ALTER TABLE ONLY "8".treating_patient_mmse ALTER COLUMN img12_out SET DEFAULT ''::text;
 K   ALTER TABLE "8".treating_patient_mmse ALTER COLUMN img12_out DROP DEFAULT;
       8          postgres    false    446            �           2604    50077    treating_patient_mmse img14_out    DEFAULT     X   ALTER TABLE ONLY "8".treating_patient_mmse ALTER COLUMN img14_out SET DEFAULT ''::text;
 K   ALTER TABLE "8".treating_patient_mmse ALTER COLUMN img14_out DROP DEFAULT;
       8          postgres    false    446                       2604    50096    treating_patient_mna id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_mna ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mna_id_seq'::regclass);
 C   ALTER TABLE "8".treating_patient_mna ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    448    328                       2604    50097    treating_patient_mna created    DEFAULT     R   ALTER TABLE ONLY "8".treating_patient_mna ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "8".treating_patient_mna ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    448                       2604    50098    treating_patient_mna modified    DEFAULT     S   ALTER TABLE ONLY "8".treating_patient_mna ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "8".treating_patient_mna ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    448            )           2604    50182    treating_patient_qol_pgc id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_qol_pgc ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_pgc_id_seq'::regclass);
 G   ALTER TABLE "8".treating_patient_qol_pgc ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    460    329            *           2604    50183     treating_patient_qol_pgc created    DEFAULT     V   ALTER TABLE ONLY "8".treating_patient_qol_pgc ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "8".treating_patient_qol_pgc ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    460            +           2604    50184 !   treating_patient_qol_pgc modified    DEFAULT     W   ALTER TABLE ONLY "8".treating_patient_qol_pgc ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "8".treating_patient_qol_pgc ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    460            &           2604    50176    treating_patient_qol_sf8 id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_qol_sf8 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_sf8_id_seq'::regclass);
 G   ALTER TABLE "8".treating_patient_qol_sf8 ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    459    330            '           2604    50177     treating_patient_qol_sf8 created    DEFAULT     V   ALTER TABLE ONLY "8".treating_patient_qol_sf8 ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "8".treating_patient_qol_sf8 ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    459            (           2604    50178 !   treating_patient_qol_sf8 modified    DEFAULT     W   ALTER TABLE ONLY "8".treating_patient_qol_sf8 ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "8".treating_patient_qol_sf8 ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    459            #           2604    50170    treating_patient_sarcopenia id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_sarcopenia ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_id_seq'::regclass);
 J   ALTER TABLE "8".treating_patient_sarcopenia ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    458    331            $           2604    50171 #   treating_patient_sarcopenia created    DEFAULT     Y   ALTER TABLE ONLY "8".treating_patient_sarcopenia ALTER COLUMN created SET DEFAULT now();
 O   ALTER TABLE "8".treating_patient_sarcopenia ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    458            %           2604    50172 $   treating_patient_sarcopenia modified    DEFAULT     Z   ALTER TABLE ONLY "8".treating_patient_sarcopenia ALTER COLUMN modified SET DEFAULT now();
 P   ALTER TABLE "8".treating_patient_sarcopenia ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    458                        2604    50164 #   treating_patient_sarcopenia_loco id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_sarcopenia_loco ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_loco_id_seq'::regclass);
 O   ALTER TABLE "8".treating_patient_sarcopenia_loco ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    457    332            !           2604    50165 (   treating_patient_sarcopenia_loco created    DEFAULT     ^   ALTER TABLE ONLY "8".treating_patient_sarcopenia_loco ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "8".treating_patient_sarcopenia_loco ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    457            "           2604    50166 )   treating_patient_sarcopenia_loco modified    DEFAULT     _   ALTER TABLE ONLY "8".treating_patient_sarcopenia_loco ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "8".treating_patient_sarcopenia_loco ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    457                       2604    72266    treating_patient_senion id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_senion ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "8".treating_patient_senion ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    533    524                       2604    72267    treating_patient_senion created    DEFAULT     U   ALTER TABLE ONLY "8".treating_patient_senion ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "8".treating_patient_senion ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    533                       2604    72268     treating_patient_senion modified    DEFAULT     V   ALTER TABLE ONLY "8".treating_patient_senion ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "8".treating_patient_senion ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    533            (           2604    72296    treating_patient_senior id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_senior ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "8".treating_patient_senior ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    538    524            )           2604    72297    treating_patient_senior created    DEFAULT     U   ALTER TABLE ONLY "8".treating_patient_senior ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "8".treating_patient_senior ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    538            *           2604    72298     treating_patient_senior modified    DEFAULT     V   ALTER TABLE ONLY "8".treating_patient_senior ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "8".treating_patient_senior ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    538                       2604    50158    treating_patient_vitality id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_vitality ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_vitality_id_seq'::regclass);
 H   ALTER TABLE "8".treating_patient_vitality ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    456    333                       2604    50159 !   treating_patient_vitality created    DEFAULT     W   ALTER TABLE ONLY "8".treating_patient_vitality ALTER COLUMN created SET DEFAULT now();
 M   ALTER TABLE "8".treating_patient_vitality ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    456                       2604    50160 "   treating_patient_vitality modified    DEFAULT     X   ALTER TABLE ONLY "8".treating_patient_vitality ALTER COLUMN modified SET DEFAULT now();
 N   ALTER TABLE "8".treating_patient_vitality ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    456                       2604    50152    treating_patient_zarit id    DEFAULT     �   ALTER TABLE ONLY "8".treating_patient_zarit ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_zarit_id_seq'::regclass);
 E   ALTER TABLE "8".treating_patient_zarit ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    455    334                       2604    50153    treating_patient_zarit created    DEFAULT     T   ALTER TABLE ONLY "8".treating_patient_zarit ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "8".treating_patient_zarit ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    455                       2604    50154    treating_patient_zarit modified    DEFAULT     U   ALTER TABLE ONLY "8".treating_patient_zarit ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "8".treating_patient_zarit ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    455                       2604    50102    treating_patients id    DEFAULT     z   ALTER TABLE ONLY "8".treating_patients ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patients_id_seq'::regclass);
 @   ALTER TABLE "8".treating_patients ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    449    335                       2604    50103    treating_patients created    DEFAULT     O   ALTER TABLE ONLY "8".treating_patients ALTER COLUMN created SET DEFAULT now();
 E   ALTER TABLE "8".treating_patients ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    449                       2604    50104    treating_patients modified    DEFAULT     P   ALTER TABLE ONLY "8".treating_patients ALTER COLUMN modified SET DEFAULT now();
 F   ALTER TABLE "8".treating_patients ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    449            �           2604    50084    users id    DEFAULT     b   ALTER TABLE ONLY "8".users ALTER COLUMN id SET DEFAULT nextval('"@base".users_id_seq'::regclass);
 4   ALTER TABLE "8".users ALTER COLUMN id DROP DEFAULT;
       8          postgres    false    447    336            �           2604    50085    users is_super_admin    DEFAULT     J   ALTER TABLE ONLY "8".users ALTER COLUMN is_super_admin SET DEFAULT false;
 @   ALTER TABLE "8".users ALTER COLUMN is_super_admin DROP DEFAULT;
       8          postgres    false    447            �           2604    50086    users created    DEFAULT     C   ALTER TABLE ONLY "8".users ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "8".users ALTER COLUMN created DROP DEFAULT;
       8          postgres    false    447                        2604    50087    users modified    DEFAULT     D   ALTER TABLE ONLY "8".users ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "8".users ALTER COLUMN modified DROP DEFAULT;
       8          postgres    false    447            o           2604    50334    areas id    DEFAULT     b   ALTER TABLE ONLY "9".areas ALTER COLUMN id SET DEFAULT nextval('"@base".areas_id_seq'::regclass);
 4   ALTER TABLE "9".areas ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    480    311            p           2604    50335    areas created    DEFAULT     C   ALTER TABLE ONLY "9".areas ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "9".areas ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    480            q           2604    50336    areas modified    DEFAULT     D   ALTER TABLE ONLY "9".areas ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "9".areas ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    480            k           2604    50324 
   centers id    DEFAULT     f   ALTER TABLE ONLY "9".centers ALTER COLUMN id SET DEFAULT nextval('"@base".centers_id_seq'::regclass);
 6   ALTER TABLE "9".centers ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    479    312            l           2604    50325    centers created    DEFAULT     E   ALTER TABLE ONLY "9".centers ALTER COLUMN created SET DEFAULT now();
 ;   ALTER TABLE "9".centers ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    479            m           2604    50326    centers modified    DEFAULT     F   ALTER TABLE ONLY "9".centers ALTER COLUMN modified SET DEFAULT now();
 <   ALTER TABLE "9".centers ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    479            �           2604    50434    patients id    DEFAULT     h   ALTER TABLE ONLY "9".patients ALTER COLUMN id SET DEFAULT nextval('"@base".patients_id_seq'::regclass);
 7   ALTER TABLE "9".patients ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    313    496            �           2604    50435    patients created    DEFAULT     F   ALTER TABLE ONLY "9".patients ALTER COLUMN created SET DEFAULT now();
 <   ALTER TABLE "9".patients ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    496            �           2604    50436    patients modified    DEFAULT     G   ALTER TABLE ONLY "9".patients ALTER COLUMN modified SET DEFAULT now();
 =   ALTER TABLE "9".patients ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    496            �           2604    50428    treating_patient_adl id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_adl_id_seq'::regclass);
 C   ALTER TABLE "9".treating_patient_adl ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    495    314            �           2604    50429    treating_patient_adl created    DEFAULT     R   ALTER TABLE ONLY "9".treating_patient_adl ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "9".treating_patient_adl ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    495            �           2604    50430    treating_patient_adl modified    DEFAULT     S   ALTER TABLE ONLY "9".treating_patient_adl ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "9".treating_patient_adl ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    495            �           2604    50422    treating_patient_basic_adl id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_basic_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_basic_adl_id_seq'::regclass);
 I   ALTER TABLE "9".treating_patient_basic_adl ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    494    315            �           2604    50423 "   treating_patient_basic_adl created    DEFAULT     X   ALTER TABLE ONLY "9".treating_patient_basic_adl ALTER COLUMN created SET DEFAULT now();
 N   ALTER TABLE "9".treating_patient_basic_adl ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    494            �           2604    50424 #   treating_patient_basic_adl modified    DEFAULT     Y   ALTER TABLE ONLY "9".treating_patient_basic_adl ALTER COLUMN modified SET DEFAULT now();
 O   ALTER TABLE "9".treating_patient_basic_adl ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    494            �           2604    50444    treating_patient_blood_sugar id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_blood_sugar ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_blood_sugar_id_seq'::regclass);
 K   ALTER TABLE "9".treating_patient_blood_sugar ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    316    497            �           2604    50445 $   treating_patient_blood_sugar created    DEFAULT     Z   ALTER TABLE ONLY "9".treating_patient_blood_sugar ALTER COLUMN created SET DEFAULT now();
 P   ALTER TABLE "9".treating_patient_blood_sugar ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    497            �           2604    50446 %   treating_patient_blood_sugar modified    DEFAULT     [   ALTER TABLE ONLY "9".treating_patient_blood_sugar ALTER COLUMN modified SET DEFAULT now();
 Q   ALTER TABLE "9".treating_patient_blood_sugar ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    497            �           2604    50416    treating_patient_cga7 id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_cga7 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_cga7_id_seq'::regclass);
 D   ALTER TABLE "9".treating_patient_cga7 ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    493    317            �           2604    50417    treating_patient_cga7 created    DEFAULT     S   ALTER TABLE ONLY "9".treating_patient_cga7 ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "9".treating_patient_cga7 ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    493            �           2604    50418    treating_patient_cga7 modified    DEFAULT     T   ALTER TABLE ONLY "9".treating_patient_cga7 ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "9".treating_patient_cga7 ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    493            �           2604    50410 #   treating_patient_closure_sticker id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_closure_sticker ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_closure_sticker_id_seq'::regclass);
 O   ALTER TABLE "9".treating_patient_closure_sticker ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    318    492            �           2604    50411 (   treating_patient_closure_sticker created    DEFAULT     ^   ALTER TABLE ONLY "9".treating_patient_closure_sticker ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "9".treating_patient_closure_sticker ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    492            �           2604    50412 )   treating_patient_closure_sticker modified    DEFAULT     _   ALTER TABLE ONLY "9".treating_patient_closure_sticker ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "9".treating_patient_closure_sticker ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    492            �           2604    50404 !   treating_patient_comprehensive id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_comprehensive ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_comprehensive_id_seq'::regclass);
 M   ALTER TABLE "9".treating_patient_comprehensive ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    491    319            �           2604    50405 &   treating_patient_comprehensive created    DEFAULT     \   ALTER TABLE ONLY "9".treating_patient_comprehensive ALTER COLUMN created SET DEFAULT now();
 R   ALTER TABLE "9".treating_patient_comprehensive ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    491            �           2604    50406 '   treating_patient_comprehensive modified    DEFAULT     ]   ALTER TABLE ONLY "9".treating_patient_comprehensive ALTER COLUMN modified SET DEFAULT now();
 S   ALTER TABLE "9".treating_patient_comprehensive ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    491            �           2604    50398    treating_patient_dbd id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_dbd ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_dbd_id_seq'::regclass);
 C   ALTER TABLE "9".treating_patient_dbd ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    320    490            �           2604    50399    treating_patient_dbd created    DEFAULT     R   ALTER TABLE ONLY "9".treating_patient_dbd ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "9".treating_patient_dbd ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    490            �           2604    50400    treating_patient_dbd modified    DEFAULT     S   ALTER TABLE ONLY "9".treating_patient_dbd ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "9".treating_patient_dbd ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    490            �           2604    50392    treating_patient_fra id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_fra ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_id_seq'::regclass);
 C   ALTER TABLE "9".treating_patient_fra ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    489    323            �           2604    50393    treating_patient_fra created    DEFAULT     R   ALTER TABLE ONLY "9".treating_patient_fra ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "9".treating_patient_fra ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    489            �           2604    50394    treating_patient_fra modified    DEFAULT     S   ALTER TABLE ONLY "9".treating_patient_fra ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "9".treating_patient_fra ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    489            �           2604    50386    treating_patient_fra_a id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_fra_a ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_a_id_seq'::regclass);
 E   ALTER TABLE "9".treating_patient_fra_a ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    488    321            �           2604    50387    treating_patient_fra_a created    DEFAULT     T   ALTER TABLE ONLY "9".treating_patient_fra_a ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "9".treating_patient_fra_a ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    488            �           2604    50388    treating_patient_fra_a modified    DEFAULT     U   ALTER TABLE ONLY "9".treating_patient_fra_a ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "9".treating_patient_fra_a ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    488            �           2604    50380    treating_patient_fra_b id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_fra_b ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_b_id_seq'::regclass);
 E   ALTER TABLE "9".treating_patient_fra_b ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    487    322            �           2604    50381    treating_patient_fra_b created    DEFAULT     T   ALTER TABLE ONLY "9".treating_patient_fra_b ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "9".treating_patient_fra_b ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    487            �           2604    50382    treating_patient_fra_b modified    DEFAULT     U   ALTER TABLE ONLY "9".treating_patient_fra_b ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "9".treating_patient_fra_b ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    487            h           2604    50318    treating_patient_gds15 id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_gds15 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_gds15_id_seq'::regclass);
 E   ALTER TABLE "9".treating_patient_gds15 ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    478    324            i           2604    50319    treating_patient_gds15 created    DEFAULT     T   ALTER TABLE ONLY "9".treating_patient_gds15 ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "9".treating_patient_gds15 ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    478            j           2604    50320    treating_patient_gds15 modified    DEFAULT     U   ALTER TABLE ONLY "9".treating_patient_gds15 ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "9".treating_patient_gds15 ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    478            e           2604    50309    treating_patient_hdsr id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_hdsr ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_hdsr_id_seq'::regclass);
 D   ALTER TABLE "9".treating_patient_hdsr ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    325    477            f           2604    50310    treating_patient_hdsr created    DEFAULT     S   ALTER TABLE ONLY "9".treating_patient_hdsr ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "9".treating_patient_hdsr ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    477            g           2604    50311    treating_patient_hdsr modified    DEFAULT     T   ALTER TABLE ONLY "9".treating_patient_hdsr ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "9".treating_patient_hdsr ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    477            b           2604    50300     treating_patient_instrumental id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_instrumental ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_instrumental_id_seq'::regclass);
 L   ALTER TABLE "9".treating_patient_instrumental ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    326    476            c           2604    50301 %   treating_patient_instrumental created    DEFAULT     [   ALTER TABLE ONLY "9".treating_patient_instrumental ALTER COLUMN created SET DEFAULT now();
 Q   ALTER TABLE "9".treating_patient_instrumental ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    476            d           2604    50302 &   treating_patient_instrumental modified    DEFAULT     \   ALTER TABLE ONLY "9".treating_patient_instrumental ALTER COLUMN modified SET DEFAULT now();
 R   ALTER TABLE "9".treating_patient_instrumental ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    476            O           2604    50263    treating_patient_mmse id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_mmse ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mmse_id_seq'::regclass);
 D   ALTER TABLE "9".treating_patient_mmse ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    472    327            P           2604    50264    treating_patient_mmse created    DEFAULT     S   ALTER TABLE ONLY "9".treating_patient_mmse ALTER COLUMN created SET DEFAULT now();
 I   ALTER TABLE "9".treating_patient_mmse ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    472            Q           2604    50265    treating_patient_mmse modified    DEFAULT     T   ALTER TABLE ONLY "9".treating_patient_mmse ALTER COLUMN modified SET DEFAULT now();
 J   ALTER TABLE "9".treating_patient_mmse ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    472            R           2604    50266    treating_patient_mmse img12    DEFAULT     T   ALTER TABLE ONLY "9".treating_patient_mmse ALTER COLUMN img12 SET DEFAULT ''::text;
 G   ALTER TABLE "9".treating_patient_mmse ALTER COLUMN img12 DROP DEFAULT;
       9          postgres    false    472            S           2604    50267    treating_patient_mmse img14    DEFAULT     T   ALTER TABLE ONLY "9".treating_patient_mmse ALTER COLUMN img14 SET DEFAULT ''::text;
 G   ALTER TABLE "9".treating_patient_mmse ALTER COLUMN img14 DROP DEFAULT;
       9          postgres    false    472            T           2604    50268    treating_patient_mmse img12_out    DEFAULT     X   ALTER TABLE ONLY "9".treating_patient_mmse ALTER COLUMN img12_out SET DEFAULT ''::text;
 K   ALTER TABLE "9".treating_patient_mmse ALTER COLUMN img12_out DROP DEFAULT;
       9          postgres    false    472            U           2604    50269    treating_patient_mmse img14_out    DEFAULT     X   ALTER TABLE ONLY "9".treating_patient_mmse ALTER COLUMN img14_out SET DEFAULT ''::text;
 K   ALTER TABLE "9".treating_patient_mmse ALTER COLUMN img14_out DROP DEFAULT;
       9          postgres    false    472            \           2604    50288    treating_patient_mna id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_mna ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mna_id_seq'::regclass);
 C   ALTER TABLE "9".treating_patient_mna ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    474    328            ]           2604    50289    treating_patient_mna created    DEFAULT     R   ALTER TABLE ONLY "9".treating_patient_mna ALTER COLUMN created SET DEFAULT now();
 H   ALTER TABLE "9".treating_patient_mna ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    474            ^           2604    50290    treating_patient_mna modified    DEFAULT     S   ALTER TABLE ONLY "9".treating_patient_mna ALTER COLUMN modified SET DEFAULT now();
 I   ALTER TABLE "9".treating_patient_mna ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    474            �           2604    50374    treating_patient_qol_pgc id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_qol_pgc ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_pgc_id_seq'::regclass);
 G   ALTER TABLE "9".treating_patient_qol_pgc ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    329    486            �           2604    50375     treating_patient_qol_pgc created    DEFAULT     V   ALTER TABLE ONLY "9".treating_patient_qol_pgc ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "9".treating_patient_qol_pgc ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    486            �           2604    50376 !   treating_patient_qol_pgc modified    DEFAULT     W   ALTER TABLE ONLY "9".treating_patient_qol_pgc ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "9".treating_patient_qol_pgc ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    486                       2604    50368    treating_patient_qol_sf8 id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_qol_sf8 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_sf8_id_seq'::regclass);
 G   ALTER TABLE "9".treating_patient_qol_sf8 ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    485    330            �           2604    50369     treating_patient_qol_sf8 created    DEFAULT     V   ALTER TABLE ONLY "9".treating_patient_qol_sf8 ALTER COLUMN created SET DEFAULT now();
 L   ALTER TABLE "9".treating_patient_qol_sf8 ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    485            �           2604    50370 !   treating_patient_qol_sf8 modified    DEFAULT     W   ALTER TABLE ONLY "9".treating_patient_qol_sf8 ALTER COLUMN modified SET DEFAULT now();
 M   ALTER TABLE "9".treating_patient_qol_sf8 ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    485            |           2604    50362    treating_patient_sarcopenia id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_sarcopenia ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_id_seq'::regclass);
 J   ALTER TABLE "9".treating_patient_sarcopenia ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    331    484            }           2604    50363 #   treating_patient_sarcopenia created    DEFAULT     Y   ALTER TABLE ONLY "9".treating_patient_sarcopenia ALTER COLUMN created SET DEFAULT now();
 O   ALTER TABLE "9".treating_patient_sarcopenia ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    484            ~           2604    50364 $   treating_patient_sarcopenia modified    DEFAULT     Z   ALTER TABLE ONLY "9".treating_patient_sarcopenia ALTER COLUMN modified SET DEFAULT now();
 P   ALTER TABLE "9".treating_patient_sarcopenia ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    484            y           2604    50356 #   treating_patient_sarcopenia_loco id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_sarcopenia_loco ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_loco_id_seq'::regclass);
 O   ALTER TABLE "9".treating_patient_sarcopenia_loco ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    332    483            z           2604    50357 (   treating_patient_sarcopenia_loco created    DEFAULT     ^   ALTER TABLE ONLY "9".treating_patient_sarcopenia_loco ALTER COLUMN created SET DEFAULT now();
 T   ALTER TABLE "9".treating_patient_sarcopenia_loco ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    483            {           2604    50358 )   treating_patient_sarcopenia_loco modified    DEFAULT     _   ALTER TABLE ONLY "9".treating_patient_sarcopenia_loco ALTER COLUMN modified SET DEFAULT now();
 U   ALTER TABLE "9".treating_patient_sarcopenia_loco ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    483                       2604    72272    treating_patient_senion id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_senion ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "9".treating_patient_senion ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    534    524                       2604    72273    treating_patient_senion created    DEFAULT     U   ALTER TABLE ONLY "9".treating_patient_senion ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "9".treating_patient_senion ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    534                       2604    72274     treating_patient_senion modified    DEFAULT     V   ALTER TABLE ONLY "9".treating_patient_senion ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "9".treating_patient_senion ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    534            %           2604    72290    treating_patient_senior id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_senior ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 F   ALTER TABLE "9".treating_patient_senior ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    537    524            &           2604    72291    treating_patient_senior created    DEFAULT     U   ALTER TABLE ONLY "9".treating_patient_senior ALTER COLUMN created SET DEFAULT now();
 K   ALTER TABLE "9".treating_patient_senior ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    537            '           2604    72292     treating_patient_senior modified    DEFAULT     V   ALTER TABLE ONLY "9".treating_patient_senior ALTER COLUMN modified SET DEFAULT now();
 L   ALTER TABLE "9".treating_patient_senior ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    537            v           2604    50350    treating_patient_vitality id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_vitality ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_vitality_id_seq'::regclass);
 H   ALTER TABLE "9".treating_patient_vitality ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    333    482            w           2604    50351 !   treating_patient_vitality created    DEFAULT     W   ALTER TABLE ONLY "9".treating_patient_vitality ALTER COLUMN created SET DEFAULT now();
 M   ALTER TABLE "9".treating_patient_vitality ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    482            x           2604    50352 "   treating_patient_vitality modified    DEFAULT     X   ALTER TABLE ONLY "9".treating_patient_vitality ALTER COLUMN modified SET DEFAULT now();
 N   ALTER TABLE "9".treating_patient_vitality ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    482            s           2604    50344    treating_patient_zarit id    DEFAULT     �   ALTER TABLE ONLY "9".treating_patient_zarit ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_zarit_id_seq'::regclass);
 E   ALTER TABLE "9".treating_patient_zarit ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    481    334            t           2604    50345    treating_patient_zarit created    DEFAULT     T   ALTER TABLE ONLY "9".treating_patient_zarit ALTER COLUMN created SET DEFAULT now();
 J   ALTER TABLE "9".treating_patient_zarit ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    481            u           2604    50346    treating_patient_zarit modified    DEFAULT     U   ALTER TABLE ONLY "9".treating_patient_zarit ALTER COLUMN modified SET DEFAULT now();
 K   ALTER TABLE "9".treating_patient_zarit ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    481            _           2604    50294    treating_patients id    DEFAULT     z   ALTER TABLE ONLY "9".treating_patients ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patients_id_seq'::regclass);
 @   ALTER TABLE "9".treating_patients ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    475    335            `           2604    50295    treating_patients created    DEFAULT     O   ALTER TABLE ONLY "9".treating_patients ALTER COLUMN created SET DEFAULT now();
 E   ALTER TABLE "9".treating_patients ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    475            a           2604    50296    treating_patients modified    DEFAULT     P   ALTER TABLE ONLY "9".treating_patients ALTER COLUMN modified SET DEFAULT now();
 F   ALTER TABLE "9".treating_patients ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    475            V           2604    50276    users id    DEFAULT     b   ALTER TABLE ONLY "9".users ALTER COLUMN id SET DEFAULT nextval('"@base".users_id_seq'::regclass);
 4   ALTER TABLE "9".users ALTER COLUMN id DROP DEFAULT;
       9          postgres    false    473    336            W           2604    50277    users is_super_admin    DEFAULT     J   ALTER TABLE ONLY "9".users ALTER COLUMN is_super_admin SET DEFAULT false;
 @   ALTER TABLE "9".users ALTER COLUMN is_super_admin DROP DEFAULT;
       9          postgres    false    473            X           2604    50278    users created    DEFAULT     C   ALTER TABLE ONLY "9".users ALTER COLUMN created SET DEFAULT now();
 9   ALTER TABLE "9".users ALTER COLUMN created DROP DEFAULT;
       9          postgres    false    473            Y           2604    50279    users modified    DEFAULT     D   ALTER TABLE ONLY "9".users ALTER COLUMN modified SET DEFAULT now();
 :   ALTER TABLE "9".users ALTER COLUMN modified DROP DEFAULT;
       9          postgres    false    473                       2604    27283    areas id    DEFAULT     f   ALTER TABLE ONLY "@base".areas ALTER COLUMN id SET DEFAULT nextval('"@base".areas_id_seq'::regclass);
 8   ALTER TABLE "@base".areas ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    311    207            $           2604    27284 
   centers id    DEFAULT     j   ALTER TABLE ONLY "@base".centers ALTER COLUMN id SET DEFAULT nextval('"@base".centers_id_seq'::regclass);
 :   ALTER TABLE "@base".centers ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    312    209            ,           2604    27285    patients id    DEFAULT     l   ALTER TABLE ONLY "@base".patients ALTER COLUMN id SET DEFAULT nextval('"@base".patients_id_seq'::regclass);
 ;   ALTER TABLE "@base".patients ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    313    211            6           2604    27286    treating_patient_adl id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_adl_id_seq'::regclass);
 G   ALTER TABLE "@base".treating_patient_adl ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    314    213            <           2604    27287    treating_patient_basic_adl id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_basic_adl ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_basic_adl_id_seq'::regclass);
 M   ALTER TABLE "@base".treating_patient_basic_adl ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    315    215            B           2604    27288    treating_patient_blood_sugar id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_blood_sugar ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_blood_sugar_id_seq'::regclass);
 O   ALTER TABLE "@base".treating_patient_blood_sugar ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    316    217            H           2604    27289    treating_patient_cga7 id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_cga7 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_cga7_id_seq'::regclass);
 H   ALTER TABLE "@base".treating_patient_cga7 ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    317    219            N           2604    27290 #   treating_patient_closure_sticker id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_closure_sticker ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_closure_sticker_id_seq'::regclass);
 S   ALTER TABLE "@base".treating_patient_closure_sticker ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    318    221            T           2604    27291 !   treating_patient_comprehensive id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_comprehensive ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_comprehensive_id_seq'::regclass);
 Q   ALTER TABLE "@base".treating_patient_comprehensive ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    319    223            Z           2604    27292    treating_patient_dbd id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_dbd ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_dbd_id_seq'::regclass);
 G   ALTER TABLE "@base".treating_patient_dbd ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    320    225            `           2604    27293    treating_patient_fra id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_fra ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_id_seq'::regclass);
 G   ALTER TABLE "@base".treating_patient_fra ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    323    227            f           2604    27294    treating_patient_fra_a id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_fra_a ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_a_id_seq'::regclass);
 I   ALTER TABLE "@base".treating_patient_fra_a ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    321    229            l           2604    27295    treating_patient_fra_b id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_fra_b ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_fra_b_id_seq'::regclass);
 I   ALTER TABLE "@base".treating_patient_fra_b ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    322    231            r           2604    27296    treating_patient_gds15 id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_gds15 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_gds15_id_seq'::regclass);
 I   ALTER TABLE "@base".treating_patient_gds15 ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    324    233            x           2604    27297    treating_patient_hdsr id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_hdsr ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_hdsr_id_seq'::regclass);
 H   ALTER TABLE "@base".treating_patient_hdsr ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    325    235            ~           2604    27298     treating_patient_instrumental id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_instrumental ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_instrumental_id_seq'::regclass);
 P   ALTER TABLE "@base".treating_patient_instrumental ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    326    237            �           2604    27299    treating_patient_mmse id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_mmse ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mmse_id_seq'::regclass);
 H   ALTER TABLE "@base".treating_patient_mmse ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    327    239            �           2604    27300    treating_patient_mna id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_mna ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_mna_id_seq'::regclass);
 G   ALTER TABLE "@base".treating_patient_mna ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    328    241            �           2604    27301    treating_patient_qol_pgc id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_qol_pgc ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_pgc_id_seq'::regclass);
 K   ALTER TABLE "@base".treating_patient_qol_pgc ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    329    243            �           2604    27302    treating_patient_qol_sf8 id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_qol_sf8 ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_qol_sf8_id_seq'::regclass);
 K   ALTER TABLE "@base".treating_patient_qol_sf8 ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    330    245            �           2604    27303    treating_patient_sarcopenia id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_sarcopenia ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_id_seq'::regclass);
 N   ALTER TABLE "@base".treating_patient_sarcopenia ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    331    247            �           2604    27304 #   treating_patient_sarcopenia_loco id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_sarcopenia_loco ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_sarcopenia_loco_id_seq'::regclass);
 S   ALTER TABLE "@base".treating_patient_sarcopenia_loco ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    332    249                       2604    72206    treating_patient_senior id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_senior ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_senior_id_seq'::regclass);
 J   ALTER TABLE "@base".treating_patient_senior ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    525    524    525            �           2604    27305    treating_patient_vitality id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_vitality ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_vitality_id_seq'::regclass);
 L   ALTER TABLE "@base".treating_patient_vitality ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    333    251            �           2604    27306    treating_patient_zarit id    DEFAULT     �   ALTER TABLE ONLY "@base".treating_patient_zarit ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patient_zarit_id_seq'::regclass);
 I   ALTER TABLE "@base".treating_patient_zarit ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    334    253            �           2604    27307    treating_patients id    DEFAULT     ~   ALTER TABLE ONLY "@base".treating_patients ALTER COLUMN id SET DEFAULT nextval('"@base".treating_patients_id_seq'::regclass);
 D   ALTER TABLE "@base".treating_patients ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    335    255            �           2604    27308    users id    DEFAULT     f   ALTER TABLE ONLY "@base".users ALTER COLUMN id SET DEFAULT nextval('"@base".users_id_seq'::regclass);
 8   ALTER TABLE "@base".users ALTER COLUMN id DROP DEFAULT;
       @base          postgres    false    336    257            �           2604    27309 
   service id    DEFAULT     h   ALTER TABLE ONLY public.service ALTER COLUMN id SET DEFAULT nextval('public.service_id_seq'::regclass);
 9   ALTER TABLE public.service ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    339    338            �           2604    27310    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    341    340            :          0    26329    areas 
   TABLE DATA           |   COPY "1".areas (id, service_id, center_id, area_name, area_name_kana, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    208   }<
      <          0    26347    centers 
   TABLE DATA           �   COPY "1".centers (id, service_id, facility_cat, center_name, center_kana, post_cd, prefectures, municipality, building_name, phone, manager_name, manager_kana, manager_email, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    210   W=
      >          0    26365    patients 
   TABLE DATA           �   COPY "1".patients (id, service_id, area_id, patient_cd, patient_name, patient_name_kana, gender, birthday, status, created, createdid, modified, modifiedid, post_cd, prefectures, municipality, address, agree1, agree2) FROM stdin;
    1          postgres    false    212   >?
      @          0    26379    treating_patient_adl 
   TABLE DATA           �   COPY "1".treating_patient_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    214   �C
      B          0    26389    treating_patient_basic_adl 
   TABLE DATA           �   COPY "1".treating_patient_basic_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    216   #D
      D          0    26402    treating_patient_blood_sugar 
   TABLE DATA           �   COPY "1".treating_patient_blood_sugar (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    218   lD
      F          0    26415    treating_patient_cga7 
   TABLE DATA           �   COPY "1".treating_patient_cga7 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    220   �D
      H          0    26425     treating_patient_closure_sticker 
   TABLE DATA           '  COPY "1".treating_patient_closure_sticker (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    222   �D
      J          0    26435    treating_patient_comprehensive 
   TABLE DATA           �   COPY "1".treating_patient_comprehensive (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    224   �D
      L          0    26445    treating_patient_dbd 
   TABLE DATA           >  COPY "1".treating_patient_dbd (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, faq24, faq25, faq26, faq27, faq28, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    226   	E
      N          0    26455    treating_patient_fra 
   TABLE DATA             COPY "1".treating_patient_fra (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    228   OE
      P          0    26465    treating_patient_fra_a 
   TABLE DATA           +  COPY "1".treating_patient_fra_a (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid, faq23, faq24, faq25) FROM stdin;
    1          postgres    false    230   lE
      R          0    26475    treating_patient_fra_b 
   TABLE DATA           �   COPY "1".treating_patient_fra_b (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    232   .F
      T          0    26485    treating_patient_gds15 
   TABLE DATA           �   COPY "1".treating_patient_gds15 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    234   oF
      V          0    26498    treating_patient_hdsr 
   TABLE DATA           �   COPY "1".treating_patient_hdsr (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, memo, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    236   �F
      X          0    26514    treating_patient_instrumental 
   TABLE DATA           �   COPY "1".treating_patient_instrumental (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, memo, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    238   �F
      Z          0    26530    treating_patient_mmse 
   TABLE DATA           ?  COPY "1".treating_patient_mmse (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, memo, created, createdid, modified, modifiedid, img12, img14, img12_out, img14_out) FROM stdin;
    1          postgres    false    240   �F
      \          0    26543    treating_patient_mna 
   TABLE DATA             COPY "1".treating_patient_mna (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    242   <G
      ^          0    26553    treating_patient_qol_pgc 
   TABLE DATA           �   COPY "1".treating_patient_qol_pgc (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    244   �G
      `          0    26563    treating_patient_qol_sf8 
   TABLE DATA           �   COPY "1".treating_patient_qol_sf8 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    246   �G
      b          0    26573    treating_patient_sarcopenia 
   TABLE DATA           �   COPY "1".treating_patient_sarcopenia (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, dxa, bia, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    248   �G
      d          0    26583     treating_patient_sarcopenia_loco 
   TABLE DATA           �   COPY "1".treating_patient_sarcopenia_loco (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    250   qH
      x          0    72221    treating_patient_senion 
   TABLE DATA           D  COPY "1".treating_patient_senion (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    526   �H
      �          0    72335    treating_patient_senior 
   TABLE DATA           D  COPY "1".treating_patient_senior (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    545   �H
      f          0    26593    treating_patient_vitality 
   TABLE DATA           �   COPY "1".treating_patient_vitality (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    252   �H
      h          0    26603    treating_patient_zarit 
   TABLE DATA             COPY "1".treating_patient_zarit (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    254   I
      j          0    26613    treating_patients 
   TABLE DATA           �   COPY "1".treating_patients (id, service_id, area_id, patient_id, check_date, cm, kg, support, bmi, age, status, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    256   PI
      l          0    26629    users 
   TABLE DATA           �   COPY "1".users (id, service_id, center_id, user_name, user_name_kana, username, password, user_right, csv_use, login_uuid, last_login_time, last_ng_time, ng_count, acc_lock, is_super_admin, status, created, createdid, modified, modifiedid) FROM stdin;
    1          postgres    false    258   �J
      d          0    50522    areas 
   TABLE DATA           }   COPY "10".areas (id, service_id, center_id, area_name, area_name_kana, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    506   �K
      c          0    50512    centers 
   TABLE DATA           �   COPY "10".centers (id, service_id, facility_cat, center_name, center_kana, post_cd, prefectures, municipality, building_name, phone, manager_name, manager_kana, manager_email, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    505   �K
      t          0    50622    patients 
   TABLE DATA           �   COPY "10".patients (id, service_id, area_id, patient_cd, patient_name, patient_name_kana, gender, birthday, status, created, createdid, modified, modifiedid, post_cd, prefectures, municipality, address, agree1, agree2) FROM stdin;
    10          postgres    false    522   GL
      s          0    50616    treating_patient_adl 
   TABLE DATA           �   COPY "10".treating_patient_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    521   �L
      r          0    50610    treating_patient_basic_adl 
   TABLE DATA           �   COPY "10".treating_patient_basic_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    520   �L
      u          0    50632    treating_patient_blood_sugar 
   TABLE DATA           �   COPY "10".treating_patient_blood_sugar (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    523   �L
      q          0    50604    treating_patient_cga7 
   TABLE DATA           �   COPY "10".treating_patient_cga7 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    519   �L
      p          0    50598     treating_patient_closure_sticker 
   TABLE DATA           (  COPY "10".treating_patient_closure_sticker (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    518   M
      o          0    50592    treating_patient_comprehensive 
   TABLE DATA           �   COPY "10".treating_patient_comprehensive (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    517   6M
      n          0    50586    treating_patient_dbd 
   TABLE DATA           ?  COPY "10".treating_patient_dbd (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, faq24, faq25, faq26, faq27, faq28, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    516   SM
      m          0    50580    treating_patient_fra 
   TABLE DATA             COPY "10".treating_patient_fra (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    515   pM
      l          0    50574    treating_patient_fra_a 
   TABLE DATA           ,  COPY "10".treating_patient_fra_a (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid, faq23, faq24, faq25) FROM stdin;
    10          postgres    false    514   �M
      k          0    50568    treating_patient_fra_b 
   TABLE DATA           �   COPY "10".treating_patient_fra_b (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    513   �M
      b          0    50506    treating_patient_gds15 
   TABLE DATA           �   COPY "10".treating_patient_gds15 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    504   �M
      a          0    50497    treating_patient_hdsr 
   TABLE DATA           �   COPY "10".treating_patient_hdsr (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, memo, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    503   �M
      `          0    50488    treating_patient_instrumental 
   TABLE DATA           �   COPY "10".treating_patient_instrumental (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, memo, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    502   N
      \          0    50451    treating_patient_mmse 
   TABLE DATA           @  COPY "10".treating_patient_mmse (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, memo, created, createdid, modified, modifiedid, img12, img14, img12_out, img14_out) FROM stdin;
    10          postgres    false    498   N
      ^          0    50476    treating_patient_mna 
   TABLE DATA             COPY "10".treating_patient_mna (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    500   ;N
      j          0    50562    treating_patient_qol_pgc 
   TABLE DATA           �   COPY "10".treating_patient_qol_pgc (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    512   XN
      i          0    50556    treating_patient_qol_sf8 
   TABLE DATA           �   COPY "10".treating_patient_qol_sf8 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    511   uN
      h          0    50550    treating_patient_sarcopenia 
   TABLE DATA           �   COPY "10".treating_patient_sarcopenia (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, dxa, bia, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    510   �N
      g          0    50544     treating_patient_sarcopenia_loco 
   TABLE DATA           �   COPY "10".treating_patient_sarcopenia_loco (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    509   �N
      �          0    72275    treating_patient_senion 
   TABLE DATA           E  COPY "10".treating_patient_senion (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    535   �N
      �          0    72281    treating_patient_senior 
   TABLE DATA           E  COPY "10".treating_patient_senior (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    536   �N
      f          0    50538    treating_patient_vitality 
   TABLE DATA           �   COPY "10".treating_patient_vitality (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    508   O
      e          0    50532    treating_patient_zarit 
   TABLE DATA             COPY "10".treating_patient_zarit (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    507   #O
      _          0    50482    treating_patients 
   TABLE DATA           �   COPY "10".treating_patients (id, service_id, area_id, patient_id, check_date, cm, kg, support, bmi, age, status, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    501   @O
      ]          0    50464    users 
   TABLE DATA           �   COPY "10".users (id, service_id, center_id, user_name, user_name_kana, username, password, user_right, csv_use, login_uuid, last_login_time, last_ng_time, ng_count, acc_lock, is_super_admin, status, created, createdid, modified, modifiedid) FROM stdin;
    10          postgres    false    499   �O
      m          0    26640    areas 
   TABLE DATA           |   COPY "2".areas (id, service_id, center_id, area_name, area_name_kana, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    259   @P
      n          0    26649    centers 
   TABLE DATA           �   COPY "2".centers (id, service_id, facility_cat, center_name, center_kana, post_cd, prefectures, municipality, building_name, phone, manager_name, manager_kana, manager_email, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    260   �P
      o          0    26658    patients 
   TABLE DATA           �   COPY "2".patients (id, service_id, area_id, patient_cd, patient_name, patient_name_kana, gender, birthday, status, created, createdid, modified, modifiedid, post_cd, prefectures, municipality, address, agree1, agree2) FROM stdin;
    2          postgres    false    261   UQ
      p          0    26667    treating_patient_adl 
   TABLE DATA           �   COPY "2".treating_patient_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    262   �U
      q          0    26672    treating_patient_basic_adl 
   TABLE DATA           �   COPY "2".treating_patient_basic_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    263   �U
      r          0    26677    treating_patient_blood_sugar 
   TABLE DATA           �   COPY "2".treating_patient_blood_sugar (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    264   �U
      s          0    26685    treating_patient_cga7 
   TABLE DATA           �   COPY "2".treating_patient_cga7 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    265   �U
      t          0    26690     treating_patient_closure_sticker 
   TABLE DATA           '  COPY "2".treating_patient_closure_sticker (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    266   �U
      u          0    26695    treating_patient_comprehensive 
   TABLE DATA           �   COPY "2".treating_patient_comprehensive (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    267   V
      v          0    26700    treating_patient_dbd 
   TABLE DATA           >  COPY "2".treating_patient_dbd (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, faq24, faq25, faq26, faq27, faq28, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    268   .V
      w          0    26705    treating_patient_fra 
   TABLE DATA             COPY "2".treating_patient_fra (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    269   KV
      x          0    26710    treating_patient_fra_a 
   TABLE DATA           +  COPY "2".treating_patient_fra_a (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid, faq23, faq24, faq25) FROM stdin;
    2          postgres    false    270   �V
      y          0    26715    treating_patient_fra_b 
   TABLE DATA           �   COPY "2".treating_patient_fra_b (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    271   �Y
      z          0    26720    treating_patient_gds15 
   TABLE DATA           �   COPY "2".treating_patient_gds15 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    272   �Y
      {          0    26725    treating_patient_hdsr 
   TABLE DATA           �   COPY "2".treating_patient_hdsr (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, memo, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    273   NZ
      |          0    26733    treating_patient_instrumental 
   TABLE DATA           �   COPY "2".treating_patient_instrumental (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, memo, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    274   [
      }          0    26741    treating_patient_mmse 
   TABLE DATA           ?  COPY "2".treating_patient_mmse (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, memo, created, createdid, modified, modifiedid, img12, img14, img12_out, img14_out) FROM stdin;
    2          postgres    false    275   1[
      ~          0    26749    treating_patient_mna 
   TABLE DATA             COPY "2".treating_patient_mna (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    276   �[
                0    26754    treating_patient_qol_pgc 
   TABLE DATA           �   COPY "2".treating_patient_qol_pgc (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    277   �[
      �          0    26759    treating_patient_qol_sf8 
   TABLE DATA           �   COPY "2".treating_patient_qol_sf8 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    278   \
      �          0    26764    treating_patient_sarcopenia 
   TABLE DATA           �   COPY "2".treating_patient_sarcopenia (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, dxa, bia, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    279   9\
      �          0    26769     treating_patient_sarcopenia_loco 
   TABLE DATA           �   COPY "2".treating_patient_sarcopenia_loco (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    280   ]
      y          0    72227    treating_patient_senion 
   TABLE DATA           D  COPY "2".treating_patient_senion (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    527   -]
      �          0    72329    treating_patient_senior 
   TABLE DATA           D  COPY "2".treating_patient_senior (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    544   J]
      �          0    26774    treating_patient_vitality 
   TABLE DATA           �   COPY "2".treating_patient_vitality (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    281   %^
      �          0    26779    treating_patient_zarit 
   TABLE DATA             COPY "2".treating_patient_zarit (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    282   �^
      �          0    26784    treating_patients 
   TABLE DATA           �   COPY "2".treating_patients (id, service_id, area_id, patient_id, check_date, cm, kg, support, bmi, age, status, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    283   �^
      �          0    26789    users 
   TABLE DATA           �   COPY "2".users (id, service_id, center_id, user_name, user_name_kana, username, password, user_right, csv_use, login_uuid, last_login_time, last_ng_time, ng_count, acc_lock, is_super_admin, status, created, createdid, modified, modifiedid) FROM stdin;
    2          postgres    false    284   �f
      �          0    26800    areas 
   TABLE DATA           |   COPY "3".areas (id, service_id, center_id, area_name, area_name_kana, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    285   �h
      �          0    26809    centers 
   TABLE DATA           �   COPY "3".centers (id, service_id, facility_cat, center_name, center_kana, post_cd, prefectures, municipality, building_name, phone, manager_name, manager_kana, manager_email, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    286   �h
      �          0    26818    patients 
   TABLE DATA           �   COPY "3".patients (id, service_id, area_id, patient_cd, patient_name, patient_name_kana, gender, birthday, status, created, createdid, modified, modifiedid, post_cd, prefectures, municipality, address, agree1, agree2) FROM stdin;
    3          postgres    false    287   i
      �          0    26827    treating_patient_adl 
   TABLE DATA           �   COPY "3".treating_patient_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    288   +i
      �          0    26832    treating_patient_basic_adl 
   TABLE DATA           �   COPY "3".treating_patient_basic_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    289   Hi
      �          0    26837    treating_patient_blood_sugar 
   TABLE DATA           �   COPY "3".treating_patient_blood_sugar (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    290   ei
      �          0    26845    treating_patient_cga7 
   TABLE DATA           �   COPY "3".treating_patient_cga7 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    291   �i
      �          0    26850     treating_patient_closure_sticker 
   TABLE DATA           '  COPY "3".treating_patient_closure_sticker (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    292   �i
      �          0    26855    treating_patient_comprehensive 
   TABLE DATA           �   COPY "3".treating_patient_comprehensive (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    293   �i
      �          0    26860    treating_patient_dbd 
   TABLE DATA           >  COPY "3".treating_patient_dbd (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, faq24, faq25, faq26, faq27, faq28, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    294   �i
      �          0    26865    treating_patient_fra 
   TABLE DATA             COPY "3".treating_patient_fra (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    295   �i
      �          0    26870    treating_patient_fra_a 
   TABLE DATA           +  COPY "3".treating_patient_fra_a (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid, faq23, faq24, faq25) FROM stdin;
    3          postgres    false    296   j
      �          0    26875    treating_patient_fra_b 
   TABLE DATA           �   COPY "3".treating_patient_fra_b (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    297   0j
      �          0    26880    treating_patient_gds15 
   TABLE DATA           �   COPY "3".treating_patient_gds15 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    298   Mj
      �          0    26885    treating_patient_hdsr 
   TABLE DATA           �   COPY "3".treating_patient_hdsr (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, memo, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    299   jj
      �          0    26893    treating_patient_instrumental 
   TABLE DATA           �   COPY "3".treating_patient_instrumental (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, memo, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    300   �j
      �          0    26901    treating_patient_mmse 
   TABLE DATA           ?  COPY "3".treating_patient_mmse (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, memo, created, createdid, modified, modifiedid, img12, img14, img12_out, img14_out) FROM stdin;
    3          postgres    false    301   �j
      �          0    26909    treating_patient_mna 
   TABLE DATA             COPY "3".treating_patient_mna (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    302   �j
      �          0    26914    treating_patient_qol_pgc 
   TABLE DATA           �   COPY "3".treating_patient_qol_pgc (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    303   �j
      �          0    26919    treating_patient_qol_sf8 
   TABLE DATA           �   COPY "3".treating_patient_qol_sf8 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    304   �j
      �          0    26924    treating_patient_sarcopenia 
   TABLE DATA           �   COPY "3".treating_patient_sarcopenia (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, dxa, bia, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    305   k
      �          0    26929     treating_patient_sarcopenia_loco 
   TABLE DATA           �   COPY "3".treating_patient_sarcopenia_loco (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    306   5k
      z          0    72233    treating_patient_senion 
   TABLE DATA           D  COPY "3".treating_patient_senion (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    528   Rk
      �          0    72323    treating_patient_senior 
   TABLE DATA           D  COPY "3".treating_patient_senior (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    543   ok
      �          0    26934    treating_patient_vitality 
   TABLE DATA           �   COPY "3".treating_patient_vitality (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    307   �k
      �          0    26939    treating_patient_zarit 
   TABLE DATA             COPY "3".treating_patient_zarit (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    308   �k
      �          0    26944    treating_patients 
   TABLE DATA           �   COPY "3".treating_patients (id, service_id, area_id, patient_id, check_date, cm, kg, support, bmi, age, status, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    309   �k
      �          0    26949    users 
   TABLE DATA           �   COPY "3".users (id, service_id, center_id, user_name, user_name_kana, username, password, user_right, csv_use, login_uuid, last_login_time, last_ng_time, ng_count, acc_lock, is_super_admin, status, created, createdid, modified, modifiedid) FROM stdin;
    3          postgres    false    310   �k
      �          0    49374    areas 
   TABLE DATA           |   COPY "4".areas (id, service_id, center_id, area_name, area_name_kana, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    350   |l
      �          0    49364    centers 
   TABLE DATA           �   COPY "4".centers (id, service_id, facility_cat, center_name, center_kana, post_cd, prefectures, municipality, building_name, phone, manager_name, manager_kana, manager_email, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    349   �l
      �          0    49474    patients 
   TABLE DATA           �   COPY "4".patients (id, service_id, area_id, patient_cd, patient_name, patient_name_kana, gender, birthday, status, created, createdid, modified, modifiedid, post_cd, prefectures, municipality, address, agree1, agree2) FROM stdin;
    4          postgres    false    366   �l
      �          0    49468    treating_patient_adl 
   TABLE DATA           �   COPY "4".treating_patient_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    365   �l
      �          0    49462    treating_patient_basic_adl 
   TABLE DATA           �   COPY "4".treating_patient_basic_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    364   �l
      �          0    49484    treating_patient_blood_sugar 
   TABLE DATA           �   COPY "4".treating_patient_blood_sugar (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    367   m
      �          0    49456    treating_patient_cga7 
   TABLE DATA           �   COPY "4".treating_patient_cga7 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    363   *m
      �          0    49450     treating_patient_closure_sticker 
   TABLE DATA           '  COPY "4".treating_patient_closure_sticker (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    362   Gm
      �          0    49444    treating_patient_comprehensive 
   TABLE DATA           �   COPY "4".treating_patient_comprehensive (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    361   dm
      �          0    49438    treating_patient_dbd 
   TABLE DATA           >  COPY "4".treating_patient_dbd (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, faq24, faq25, faq26, faq27, faq28, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    360   �m
      �          0    49432    treating_patient_fra 
   TABLE DATA             COPY "4".treating_patient_fra (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    359   �m
      �          0    49426    treating_patient_fra_a 
   TABLE DATA           +  COPY "4".treating_patient_fra_a (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid, faq23, faq24, faq25) FROM stdin;
    4          postgres    false    358   �m
      �          0    49420    treating_patient_fra_b 
   TABLE DATA           �   COPY "4".treating_patient_fra_b (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    357   �m
      �          0    49358    treating_patient_gds15 
   TABLE DATA           �   COPY "4".treating_patient_gds15 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    348   �m
      �          0    49349    treating_patient_hdsr 
   TABLE DATA           �   COPY "4".treating_patient_hdsr (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, memo, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    347   n
      �          0    49340    treating_patient_instrumental 
   TABLE DATA           �   COPY "4".treating_patient_instrumental (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, memo, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    346   /n
      �          0    49303    treating_patient_mmse 
   TABLE DATA           ?  COPY "4".treating_patient_mmse (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, memo, created, createdid, modified, modifiedid, img12, img14, img12_out, img14_out) FROM stdin;
    4          postgres    false    342   Ln
      �          0    49328    treating_patient_mna 
   TABLE DATA             COPY "4".treating_patient_mna (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    344   in
      �          0    49414    treating_patient_qol_pgc 
   TABLE DATA           �   COPY "4".treating_patient_qol_pgc (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    356   �n
      �          0    49408    treating_patient_qol_sf8 
   TABLE DATA           �   COPY "4".treating_patient_qol_sf8 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    355   �n
      �          0    49402    treating_patient_sarcopenia 
   TABLE DATA           �   COPY "4".treating_patient_sarcopenia (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, dxa, bia, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    354   �n
      �          0    49396     treating_patient_sarcopenia_loco 
   TABLE DATA           �   COPY "4".treating_patient_sarcopenia_loco (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    353   �n
      {          0    72239    treating_patient_senion 
   TABLE DATA           D  COPY "4".treating_patient_senion (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    529   �n
      �          0    72317    treating_patient_senior 
   TABLE DATA           D  COPY "4".treating_patient_senior (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    542   o
      �          0    49390    treating_patient_vitality 
   TABLE DATA           �   COPY "4".treating_patient_vitality (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    352   4o
      �          0    49384    treating_patient_zarit 
   TABLE DATA             COPY "4".treating_patient_zarit (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    351   Qo
      �          0    49334    treating_patients 
   TABLE DATA           �   COPY "4".treating_patients (id, service_id, area_id, patient_id, check_date, cm, kg, support, bmi, age, status, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    345   no
      �          0    49316    users 
   TABLE DATA           �   COPY "4".users (id, service_id, center_id, user_name, user_name_kana, username, password, user_right, csv_use, login_uuid, last_login_time, last_ng_time, ng_count, acc_lock, is_super_admin, status, created, createdid, modified, modifiedid) FROM stdin;
    4          postgres    false    343   �o
      �          0    49566    areas 
   TABLE DATA           |   COPY "5".areas (id, service_id, center_id, area_name, area_name_kana, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    376   &p
      �          0    49556    centers 
   TABLE DATA           �   COPY "5".centers (id, service_id, facility_cat, center_name, center_kana, post_cd, prefectures, municipality, building_name, phone, manager_name, manager_kana, manager_email, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    375   Cp
      �          0    49666    patients 
   TABLE DATA           �   COPY "5".patients (id, service_id, area_id, patient_cd, patient_name, patient_name_kana, gender, birthday, status, created, createdid, modified, modifiedid, post_cd, prefectures, municipality, address, agree1, agree2) FROM stdin;
    5          postgres    false    392   `p
      �          0    49660    treating_patient_adl 
   TABLE DATA           �   COPY "5".treating_patient_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    391   }p
      �          0    49654    treating_patient_basic_adl 
   TABLE DATA           �   COPY "5".treating_patient_basic_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    390   �p
      �          0    49676    treating_patient_blood_sugar 
   TABLE DATA           �   COPY "5".treating_patient_blood_sugar (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    393   �p
      �          0    49648    treating_patient_cga7 
   TABLE DATA           �   COPY "5".treating_patient_cga7 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    389   �p
      �          0    49642     treating_patient_closure_sticker 
   TABLE DATA           '  COPY "5".treating_patient_closure_sticker (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    388   �p
      �          0    49636    treating_patient_comprehensive 
   TABLE DATA           �   COPY "5".treating_patient_comprehensive (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    387   q
      �          0    49630    treating_patient_dbd 
   TABLE DATA           >  COPY "5".treating_patient_dbd (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, faq24, faq25, faq26, faq27, faq28, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    386   +q
      �          0    49624    treating_patient_fra 
   TABLE DATA             COPY "5".treating_patient_fra (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    385   Hq
      �          0    49618    treating_patient_fra_a 
   TABLE DATA           +  COPY "5".treating_patient_fra_a (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid, faq23, faq24, faq25) FROM stdin;
    5          postgres    false    384   eq
      �          0    49612    treating_patient_fra_b 
   TABLE DATA           �   COPY "5".treating_patient_fra_b (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    383   �q
      �          0    49550    treating_patient_gds15 
   TABLE DATA           �   COPY "5".treating_patient_gds15 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    374   �q
      �          0    49541    treating_patient_hdsr 
   TABLE DATA           �   COPY "5".treating_patient_hdsr (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, memo, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    373   �q
      �          0    49532    treating_patient_instrumental 
   TABLE DATA           �   COPY "5".treating_patient_instrumental (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, memo, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    372   �q
      �          0    49495    treating_patient_mmse 
   TABLE DATA           ?  COPY "5".treating_patient_mmse (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, memo, created, createdid, modified, modifiedid, img12, img14, img12_out, img14_out) FROM stdin;
    5          postgres    false    368   �q
      �          0    49520    treating_patient_mna 
   TABLE DATA             COPY "5".treating_patient_mna (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    370   r
      �          0    49606    treating_patient_qol_pgc 
   TABLE DATA           �   COPY "5".treating_patient_qol_pgc (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    382   0r
      �          0    49600    treating_patient_qol_sf8 
   TABLE DATA           �   COPY "5".treating_patient_qol_sf8 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    381   Mr
      �          0    49594    treating_patient_sarcopenia 
   TABLE DATA           �   COPY "5".treating_patient_sarcopenia (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, dxa, bia, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    380   jr
      �          0    49588     treating_patient_sarcopenia_loco 
   TABLE DATA           �   COPY "5".treating_patient_sarcopenia_loco (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    379   �r
      |          0    72245    treating_patient_senion 
   TABLE DATA           D  COPY "5".treating_patient_senion (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    530   �r
      �          0    72311    treating_patient_senior 
   TABLE DATA           D  COPY "5".treating_patient_senior (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    541   �r
      �          0    49582    treating_patient_vitality 
   TABLE DATA           �   COPY "5".treating_patient_vitality (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    378   �r
      �          0    49576    treating_patient_zarit 
   TABLE DATA             COPY "5".treating_patient_zarit (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    377   �r
      �          0    49526    treating_patients 
   TABLE DATA           �   COPY "5".treating_patients (id, service_id, area_id, patient_id, check_date, cm, kg, support, bmi, age, status, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    371   s
      �          0    49508    users 
   TABLE DATA           �   COPY "5".users (id, service_id, center_id, user_name, user_name_kana, username, password, user_right, csv_use, login_uuid, last_login_time, last_ng_time, ng_count, acc_lock, is_super_admin, status, created, createdid, modified, modifiedid) FROM stdin;
    5          postgres    false    369   5s
      �          0    49757    areas 
   TABLE DATA           |   COPY "6".areas (id, service_id, center_id, area_name, area_name_kana, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    402   �s
      �          0    49747    centers 
   TABLE DATA           �   COPY "6".centers (id, service_id, facility_cat, center_name, center_kana, post_cd, prefectures, municipality, building_name, phone, manager_name, manager_kana, manager_email, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    401   �s
                0    49857    patients 
   TABLE DATA           �   COPY "6".patients (id, service_id, area_id, patient_cd, patient_name, patient_name_kana, gender, birthday, status, created, createdid, modified, modifiedid, post_cd, prefectures, municipality, address, agree1, agree2) FROM stdin;
    6          postgres    false    418   
t
                0    49851    treating_patient_adl 
   TABLE DATA           �   COPY "6".treating_patient_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    417   't
      
          0    49845    treating_patient_basic_adl 
   TABLE DATA           �   COPY "6".treating_patient_basic_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    416   Dt
                0    49867    treating_patient_blood_sugar 
   TABLE DATA           �   COPY "6".treating_patient_blood_sugar (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    419   at
      	          0    49839    treating_patient_cga7 
   TABLE DATA           �   COPY "6".treating_patient_cga7 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    415   ~t
                0    49833     treating_patient_closure_sticker 
   TABLE DATA           '  COPY "6".treating_patient_closure_sticker (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    414   �t
                0    49827    treating_patient_comprehensive 
   TABLE DATA           �   COPY "6".treating_patient_comprehensive (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    413   �t
                0    49821    treating_patient_dbd 
   TABLE DATA           >  COPY "6".treating_patient_dbd (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, faq24, faq25, faq26, faq27, faq28, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    412   �t
                0    49815    treating_patient_fra 
   TABLE DATA             COPY "6".treating_patient_fra (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    411   �t
                0    49809    treating_patient_fra_a 
   TABLE DATA           +  COPY "6".treating_patient_fra_a (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid, faq23, faq24, faq25) FROM stdin;
    6          postgres    false    410   u
                0    49803    treating_patient_fra_b 
   TABLE DATA           �   COPY "6".treating_patient_fra_b (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    409   ,u
      �          0    49741    treating_patient_gds15 
   TABLE DATA           �   COPY "6".treating_patient_gds15 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    400   Iu
      �          0    49732    treating_patient_hdsr 
   TABLE DATA           �   COPY "6".treating_patient_hdsr (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, memo, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    399   fu
      �          0    49723    treating_patient_instrumental 
   TABLE DATA           �   COPY "6".treating_patient_instrumental (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, memo, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    398   �u
      �          0    49686    treating_patient_mmse 
   TABLE DATA           ?  COPY "6".treating_patient_mmse (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, memo, created, createdid, modified, modifiedid, img12, img14, img12_out, img14_out) FROM stdin;
    6          postgres    false    394   �u
      �          0    49711    treating_patient_mna 
   TABLE DATA             COPY "6".treating_patient_mna (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    396   �u
                0    49797    treating_patient_qol_pgc 
   TABLE DATA           �   COPY "6".treating_patient_qol_pgc (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    408   �u
                0    49791    treating_patient_qol_sf8 
   TABLE DATA           �   COPY "6".treating_patient_qol_sf8 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    407   �u
                 0    49785    treating_patient_sarcopenia 
   TABLE DATA           �   COPY "6".treating_patient_sarcopenia (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, dxa, bia, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    406   v
      �          0    49779     treating_patient_sarcopenia_loco 
   TABLE DATA           �   COPY "6".treating_patient_sarcopenia_loco (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    405   1v
      }          0    72251    treating_patient_senion 
   TABLE DATA           D  COPY "6".treating_patient_senion (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    531   Nv
      �          0    72305    treating_patient_senior 
   TABLE DATA           D  COPY "6".treating_patient_senior (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    540   kv
      �          0    49773    treating_patient_vitality 
   TABLE DATA           �   COPY "6".treating_patient_vitality (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    404   �v
      �          0    49767    treating_patient_zarit 
   TABLE DATA             COPY "6".treating_patient_zarit (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    403   �v
      �          0    49717    treating_patients 
   TABLE DATA           �   COPY "6".treating_patients (id, service_id, area_id, patient_id, check_date, cm, kg, support, bmi, age, status, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    397   �v
      �          0    49699    users 
   TABLE DATA           �   COPY "6".users (id, service_id, center_id, user_name, user_name_kana, username, password, user_right, csv_use, login_uuid, last_login_time, last_ng_time, ng_count, acc_lock, is_super_admin, status, created, createdid, modified, modifiedid) FROM stdin;
    6          postgres    false    395   �v
                0    49948    areas 
   TABLE DATA           |   COPY "7".areas (id, service_id, center_id, area_name, area_name_kana, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    428   zw
                0    49938    centers 
   TABLE DATA           �   COPY "7".centers (id, service_id, facility_cat, center_name, center_kana, post_cd, prefectures, municipality, building_name, phone, manager_name, manager_kana, manager_email, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    427   �w
      &          0    50048    patients 
   TABLE DATA           �   COPY "7".patients (id, service_id, area_id, patient_cd, patient_name, patient_name_kana, gender, birthday, status, created, createdid, modified, modifiedid, post_cd, prefectures, municipality, address, agree1, agree2) FROM stdin;
    7          postgres    false    444   �w
      %          0    50042    treating_patient_adl 
   TABLE DATA           �   COPY "7".treating_patient_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    443   �w
      $          0    50036    treating_patient_basic_adl 
   TABLE DATA           �   COPY "7".treating_patient_basic_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    442   �w
      '          0    50058    treating_patient_blood_sugar 
   TABLE DATA           �   COPY "7".treating_patient_blood_sugar (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    445   x
      #          0    50030    treating_patient_cga7 
   TABLE DATA           �   COPY "7".treating_patient_cga7 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    441   (x
      "          0    50024     treating_patient_closure_sticker 
   TABLE DATA           '  COPY "7".treating_patient_closure_sticker (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    440   Ex
      !          0    50018    treating_patient_comprehensive 
   TABLE DATA           �   COPY "7".treating_patient_comprehensive (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    439   bx
                 0    50012    treating_patient_dbd 
   TABLE DATA           >  COPY "7".treating_patient_dbd (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, faq24, faq25, faq26, faq27, faq28, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    438   x
                0    50006    treating_patient_fra 
   TABLE DATA             COPY "7".treating_patient_fra (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    437   �x
                0    50000    treating_patient_fra_a 
   TABLE DATA           +  COPY "7".treating_patient_fra_a (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid, faq23, faq24, faq25) FROM stdin;
    7          postgres    false    436   �x
                0    49994    treating_patient_fra_b 
   TABLE DATA           �   COPY "7".treating_patient_fra_b (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    435   �x
                0    49932    treating_patient_gds15 
   TABLE DATA           �   COPY "7".treating_patient_gds15 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    426   �x
                0    49923    treating_patient_hdsr 
   TABLE DATA           �   COPY "7".treating_patient_hdsr (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, memo, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    425   y
                0    49914    treating_patient_instrumental 
   TABLE DATA           �   COPY "7".treating_patient_instrumental (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, memo, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    424   -y
                0    49877    treating_patient_mmse 
   TABLE DATA           ?  COPY "7".treating_patient_mmse (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, memo, created, createdid, modified, modifiedid, img12, img14, img12_out, img14_out) FROM stdin;
    7          postgres    false    420   Jy
                0    49902    treating_patient_mna 
   TABLE DATA             COPY "7".treating_patient_mna (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    422   gy
                0    49988    treating_patient_qol_pgc 
   TABLE DATA           �   COPY "7".treating_patient_qol_pgc (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    434   �y
                0    49982    treating_patient_qol_sf8 
   TABLE DATA           �   COPY "7".treating_patient_qol_sf8 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    433   �y
                0    49976    treating_patient_sarcopenia 
   TABLE DATA           �   COPY "7".treating_patient_sarcopenia (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, dxa, bia, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    432   �y
                0    49970     treating_patient_sarcopenia_loco 
   TABLE DATA           �   COPY "7".treating_patient_sarcopenia_loco (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    431   �y
      ~          0    72257    treating_patient_senion 
   TABLE DATA           D  COPY "7".treating_patient_senion (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    532   �y
      �          0    72299    treating_patient_senior 
   TABLE DATA           D  COPY "7".treating_patient_senior (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    539   z
                0    49964    treating_patient_vitality 
   TABLE DATA           �   COPY "7".treating_patient_vitality (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    430   2z
                0    49958    treating_patient_zarit 
   TABLE DATA             COPY "7".treating_patient_zarit (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    429   Oz
                0    49908    treating_patients 
   TABLE DATA           �   COPY "7".treating_patients (id, service_id, area_id, patient_id, check_date, cm, kg, support, bmi, age, status, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    423   lz
                0    49890    users 
   TABLE DATA           �   COPY "7".users (id, service_id, center_id, user_name, user_name_kana, username, password, user_right, csv_use, login_uuid, last_login_time, last_ng_time, ng_count, acc_lock, is_super_admin, status, created, createdid, modified, modifiedid) FROM stdin;
    7          postgres    false    421   �z
      0          0    50139    areas 
   TABLE DATA           |   COPY "8".areas (id, service_id, center_id, area_name, area_name_kana, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    454   ${
      /          0    50129    centers 
   TABLE DATA           �   COPY "8".centers (id, service_id, facility_cat, center_name, center_kana, post_cd, prefectures, municipality, building_name, phone, manager_name, manager_kana, manager_email, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    453   A{
      @          0    50239    patients 
   TABLE DATA           �   COPY "8".patients (id, service_id, area_id, patient_cd, patient_name, patient_name_kana, gender, birthday, status, created, createdid, modified, modifiedid, post_cd, prefectures, municipality, address, agree1, agree2) FROM stdin;
    8          postgres    false    470   ^{
      ?          0    50233    treating_patient_adl 
   TABLE DATA           �   COPY "8".treating_patient_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    469   {{
      >          0    50227    treating_patient_basic_adl 
   TABLE DATA           �   COPY "8".treating_patient_basic_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    468   �{
      A          0    50249    treating_patient_blood_sugar 
   TABLE DATA           �   COPY "8".treating_patient_blood_sugar (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    471   �{
      =          0    50221    treating_patient_cga7 
   TABLE DATA           �   COPY "8".treating_patient_cga7 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    467   �{
      <          0    50215     treating_patient_closure_sticker 
   TABLE DATA           '  COPY "8".treating_patient_closure_sticker (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    466   �{
      ;          0    50209    treating_patient_comprehensive 
   TABLE DATA           �   COPY "8".treating_patient_comprehensive (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    465   |
      :          0    50203    treating_patient_dbd 
   TABLE DATA           >  COPY "8".treating_patient_dbd (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, faq24, faq25, faq26, faq27, faq28, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    464   )|
      9          0    50197    treating_patient_fra 
   TABLE DATA             COPY "8".treating_patient_fra (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    463   F|
      8          0    50191    treating_patient_fra_a 
   TABLE DATA           +  COPY "8".treating_patient_fra_a (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid, faq23, faq24, faq25) FROM stdin;
    8          postgres    false    462   c|
      7          0    50185    treating_patient_fra_b 
   TABLE DATA           �   COPY "8".treating_patient_fra_b (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    461   �|
      .          0    50123    treating_patient_gds15 
   TABLE DATA           �   COPY "8".treating_patient_gds15 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    452   �|
      -          0    50114    treating_patient_hdsr 
   TABLE DATA           �   COPY "8".treating_patient_hdsr (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, memo, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    451   �|
      ,          0    50105    treating_patient_instrumental 
   TABLE DATA           �   COPY "8".treating_patient_instrumental (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, memo, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    450   �|
      (          0    50068    treating_patient_mmse 
   TABLE DATA           ?  COPY "8".treating_patient_mmse (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, memo, created, createdid, modified, modifiedid, img12, img14, img12_out, img14_out) FROM stdin;
    8          postgres    false    446   �|
      *          0    50093    treating_patient_mna 
   TABLE DATA             COPY "8".treating_patient_mna (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    448   }
      6          0    50179    treating_patient_qol_pgc 
   TABLE DATA           �   COPY "8".treating_patient_qol_pgc (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    460   .}
      5          0    50173    treating_patient_qol_sf8 
   TABLE DATA           �   COPY "8".treating_patient_qol_sf8 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    459   K}
      4          0    50167    treating_patient_sarcopenia 
   TABLE DATA           �   COPY "8".treating_patient_sarcopenia (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, dxa, bia, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    458   h}
      3          0    50161     treating_patient_sarcopenia_loco 
   TABLE DATA           �   COPY "8".treating_patient_sarcopenia_loco (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    457   �}
                0    72263    treating_patient_senion 
   TABLE DATA           D  COPY "8".treating_patient_senion (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    533   �}
      �          0    72293    treating_patient_senior 
   TABLE DATA           D  COPY "8".treating_patient_senior (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    538   �}
      2          0    50155    treating_patient_vitality 
   TABLE DATA           �   COPY "8".treating_patient_vitality (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    456   �}
      1          0    50149    treating_patient_zarit 
   TABLE DATA             COPY "8".treating_patient_zarit (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    455   �}
      +          0    50099    treating_patients 
   TABLE DATA           �   COPY "8".treating_patients (id, service_id, area_id, patient_id, check_date, cm, kg, support, bmi, age, status, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    449   ~
      )          0    50081    users 
   TABLE DATA           �   COPY "8".users (id, service_id, center_id, user_name, user_name_kana, username, password, user_right, csv_use, login_uuid, last_login_time, last_ng_time, ng_count, acc_lock, is_super_admin, status, created, createdid, modified, modifiedid) FROM stdin;
    8          postgres    false    447   3~
      J          0    50331    areas 
   TABLE DATA           |   COPY "9".areas (id, service_id, center_id, area_name, area_name_kana, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    480   �~
      I          0    50321    centers 
   TABLE DATA           �   COPY "9".centers (id, service_id, facility_cat, center_name, center_kana, post_cd, prefectures, municipality, building_name, phone, manager_name, manager_kana, manager_email, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    479   
      Z          0    50431    patients 
   TABLE DATA           �   COPY "9".patients (id, service_id, area_id, patient_cd, patient_name, patient_name_kana, gender, birthday, status, created, createdid, modified, modifiedid, post_cd, prefectures, municipality, address, agree1, agree2) FROM stdin;
    9          postgres    false    496   \
      Y          0    50425    treating_patient_adl 
   TABLE DATA           �   COPY "9".treating_patient_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    495   �
      X          0    50419    treating_patient_basic_adl 
   TABLE DATA           �   COPY "9".treating_patient_basic_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    494   �
      [          0    50441    treating_patient_blood_sugar 
   TABLE DATA           �   COPY "9".treating_patient_blood_sugar (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    497   �
      W          0    50413    treating_patient_cga7 
   TABLE DATA           �   COPY "9".treating_patient_cga7 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    493   �
      V          0    50407     treating_patient_closure_sticker 
   TABLE DATA           '  COPY "9".treating_patient_closure_sticker (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    492   "�
      U          0    50401    treating_patient_comprehensive 
   TABLE DATA           �   COPY "9".treating_patient_comprehensive (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    491   ?�
      T          0    50395    treating_patient_dbd 
   TABLE DATA           >  COPY "9".treating_patient_dbd (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, faq24, faq25, faq26, faq27, faq28, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    490   \�
      S          0    50389    treating_patient_fra 
   TABLE DATA             COPY "9".treating_patient_fra (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    489   y�
      R          0    50383    treating_patient_fra_a 
   TABLE DATA           +  COPY "9".treating_patient_fra_a (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid, faq23, faq24, faq25) FROM stdin;
    9          postgres    false    488   ��
      Q          0    50377    treating_patient_fra_b 
   TABLE DATA           �   COPY "9".treating_patient_fra_b (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    487   ��
      H          0    50315    treating_patient_gds15 
   TABLE DATA           �   COPY "9".treating_patient_gds15 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    478   Ѐ
      G          0    50306    treating_patient_hdsr 
   TABLE DATA           �   COPY "9".treating_patient_hdsr (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, memo, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    477   �
      F          0    50297    treating_patient_instrumental 
   TABLE DATA           �   COPY "9".treating_patient_instrumental (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, memo, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    476   
�
      B          0    50260    treating_patient_mmse 
   TABLE DATA           ?  COPY "9".treating_patient_mmse (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, memo, created, createdid, modified, modifiedid, img12, img14, img12_out, img14_out) FROM stdin;
    9          postgres    false    472   '�
      D          0    50285    treating_patient_mna 
   TABLE DATA             COPY "9".treating_patient_mna (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    474   D�
      P          0    50371    treating_patient_qol_pgc 
   TABLE DATA           �   COPY "9".treating_patient_qol_pgc (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    486   a�
      O          0    50365    treating_patient_qol_sf8 
   TABLE DATA           �   COPY "9".treating_patient_qol_sf8 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    485   ~�
      N          0    50359    treating_patient_sarcopenia 
   TABLE DATA           �   COPY "9".treating_patient_sarcopenia (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, dxa, bia, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    484   ��
      M          0    50353     treating_patient_sarcopenia_loco 
   TABLE DATA           �   COPY "9".treating_patient_sarcopenia_loco (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    483   ��
      �          0    72269    treating_patient_senion 
   TABLE DATA           D  COPY "9".treating_patient_senion (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    534   Ձ
      �          0    72287    treating_patient_senior 
   TABLE DATA           D  COPY "9".treating_patient_senior (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    537   �
      L          0    50347    treating_patient_vitality 
   TABLE DATA           �   COPY "9".treating_patient_vitality (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    482   �
      K          0    50341    treating_patient_zarit 
   TABLE DATA             COPY "9".treating_patient_zarit (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    481   ,�
      E          0    50291    treating_patients 
   TABLE DATA           �   COPY "9".treating_patients (id, service_id, area_id, patient_id, check_date, cm, kg, support, bmi, age, status, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    475   I�
      C          0    50273    users 
   TABLE DATA           �   COPY "9".users (id, service_id, center_id, user_name, user_name_kana, username, password, user_right, csv_use, login_uuid, last_login_time, last_ng_time, ng_count, acc_lock, is_super_admin, status, created, createdid, modified, modifiedid) FROM stdin;
    9          postgres    false    473   ��
      9          0    26320    areas 
   TABLE DATA           �   COPY "@base".areas (id, service_id, center_id, area_name, area_name_kana, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    207   C�
      ;          0    26338    centers 
   TABLE DATA           �   COPY "@base".centers (id, service_id, facility_cat, center_name, center_kana, post_cd, prefectures, municipality, building_name, phone, manager_name, manager_kana, manager_email, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    209   `�
      =          0    26356    patients 
   TABLE DATA           �   COPY "@base".patients (id, service_id, area_id, patient_cd, patient_name, patient_name_kana, gender, birthday, status, created, createdid, modified, modifiedid, post_cd, prefectures, municipality, address, agree1, agree2) FROM stdin;
    @base          postgres    false    211   }�
      ?          0    26374    treating_patient_adl 
   TABLE DATA           �   COPY "@base".treating_patient_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    213   ��
      A          0    26384    treating_patient_basic_adl 
   TABLE DATA           �   COPY "@base".treating_patient_basic_adl (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    215   ��
      C          0    26394    treating_patient_blood_sugar 
   TABLE DATA           �   COPY "@base".treating_patient_blood_sugar (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    217   ԃ
      E          0    26410    treating_patient_cga7 
   TABLE DATA           �   COPY "@base".treating_patient_cga7 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    219   �
      G          0    26420     treating_patient_closure_sticker 
   TABLE DATA           +  COPY "@base".treating_patient_closure_sticker (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    221   �
      I          0    26430    treating_patient_comprehensive 
   TABLE DATA           �   COPY "@base".treating_patient_comprehensive (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    223   +�
      K          0    26440    treating_patient_dbd 
   TABLE DATA           B  COPY "@base".treating_patient_dbd (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, faq23, faq24, faq25, faq26, faq27, faq28, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    225   H�
      M          0    26450    treating_patient_fra 
   TABLE DATA             COPY "@base".treating_patient_fra (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    227   e�
      O          0    26460    treating_patient_fra_a 
   TABLE DATA           /  COPY "@base".treating_patient_fra_a (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, created, createdid, modified, modifiedid, faq23, faq24, faq25) FROM stdin;
    @base          postgres    false    229   ��
      Q          0    26470    treating_patient_fra_b 
   TABLE DATA           �   COPY "@base".treating_patient_fra_b (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    231   ��
      S          0    26480    treating_patient_gds15 
   TABLE DATA           �   COPY "@base".treating_patient_gds15 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    233   ��
      U          0    26490    treating_patient_hdsr 
   TABLE DATA           �   COPY "@base".treating_patient_hdsr (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, memo, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    235   ل
      W          0    26506    treating_patient_instrumental 
   TABLE DATA           �   COPY "@base".treating_patient_instrumental (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, memo, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    237   ��
      Y          0    26522    treating_patient_mmse 
   TABLE DATA           C  COPY "@base".treating_patient_mmse (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, faq22, memo, created, createdid, modified, modifiedid, img12, img14, img12_out, img14_out) FROM stdin;
    @base          postgres    false    239   �
      [          0    26538    treating_patient_mna 
   TABLE DATA           
  COPY "@base".treating_patient_mna (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    241   0�
      ]          0    26548    treating_patient_qol_pgc 
   TABLE DATA           �   COPY "@base".treating_patient_qol_pgc (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    243   M�
      _          0    26558    treating_patient_qol_sf8 
   TABLE DATA           �   COPY "@base".treating_patient_qol_sf8 (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    245   j�
      a          0    26568    treating_patient_sarcopenia 
   TABLE DATA           �   COPY "@base".treating_patient_sarcopenia (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, dxa, bia, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    247   ��
      c          0    26578     treating_patient_sarcopenia_loco 
   TABLE DATA           �   COPY "@base".treating_patient_sarcopenia_loco (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    249   ��
      w          0    72203    treating_patient_senior 
   TABLE DATA           H  COPY "@base".treating_patient_senior (id, service_id, treating_patient_id, healt_condition_01, mental_help_01, eating_habit_01, oral_01, oral_02, weight_01, execise_01, execise_02, execise_03, cognitive_01, cognitive_02, smoking_01, social_01, social_02, social_support_01, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    525   ��
      e          0    26588    treating_patient_vitality 
   TABLE DATA           �   COPY "@base".treating_patient_vitality (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    251   ޅ
      g          0    26598    treating_patient_zarit 
   TABLE DATA             COPY "@base".treating_patient_zarit (id, service_id, treating_patient_id, faq01, faq02, faq03, faq04, faq05, faq06, faq07, faq08, faq09, faq10, faq11, faq12, faq13, faq14, faq15, faq16, faq17, faq18, faq19, faq20, faq21, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    253   ��
      i          0    26608    treating_patients 
   TABLE DATA           �   COPY "@base".treating_patients (id, service_id, area_id, patient_id, check_date, cm, kg, support, bmi, age, status, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    255   �
      k          0    26618    users 
   TABLE DATA              COPY "@base".users (id, service_id, center_id, user_name, user_name_kana, username, password, user_right, csv_use, login_uuid, last_login_time, last_ng_time, ng_count, acc_lock, is_super_admin, status, created, createdid, modified, modifiedid) FROM stdin;
    @base          postgres    false    257   5�
      �          0    27012    phinxlog 
   TABLE DATA           ]   COPY public.phinxlog (version, migration_name, start_time, end_time, breakpoint) FROM stdin;
    public          postgres    false    337   R�
      �          0    27016    service 
   TABLE DATA           �   COPY public.service (id, service_name, service, date_start, date_end, digest_login, digest_password, status, created, createdid, modified, modifiedid, fra_older_flag) FROM stdin;
    public          postgres    false    338   ��
      �          0    27030    users 
   TABLE DATA           �   COPY public.users (id, user_name, user_name_kana, user_login, password, login_uuid, last_login_time, last_ng_time, ng_count, account_lock, status, created, createdid, modified, modifiedid) FROM stdin;
    public          postgres    false    340   ��
                 0    0    areas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('"@base".areas_id_seq', 11, true);
          @base          postgres    false    311                       0    0    centers_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('"@base".centers_id_seq', 15, true);
          @base          postgres    false    312                       0    0    patients_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('"@base".patients_id_seq', 190, true);
          @base          postgres    false    313                       0    0    treating_patient_adl_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('"@base".treating_patient_adl_id_seq', 3, true);
          @base          postgres    false    314            	           0    0 !   treating_patient_basic_adl_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('"@base".treating_patient_basic_adl_id_seq', 1, true);
          @base          postgres    false    315            
           0    0 #   treating_patient_blood_sugar_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('"@base".treating_patient_blood_sugar_id_seq', 1, false);
          @base          postgres    false    316                       0    0    treating_patient_cga7_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"@base".treating_patient_cga7_id_seq', 1, false);
          @base          postgres    false    317                       0    0 '   treating_patient_closure_sticker_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('"@base".treating_patient_closure_sticker_id_seq', 1, true);
          @base          postgres    false    318                       0    0 %   treating_patient_comprehensive_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('"@base".treating_patient_comprehensive_id_seq', 1, false);
          @base          postgres    false    319                       0    0    treating_patient_dbd_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('"@base".treating_patient_dbd_id_seq', 1, true);
          @base          postgres    false    320                       0    0    treating_patient_fra_a_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('"@base".treating_patient_fra_a_id_seq', 37, true);
          @base          postgres    false    321                       0    0    treating_patient_fra_b_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"@base".treating_patient_fra_b_id_seq', 1, true);
          @base          postgres    false    322                       0    0    treating_patient_fra_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('"@base".treating_patient_fra_id_seq', 4, true);
          @base          postgres    false    323                       0    0    treating_patient_gds15_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"@base".treating_patient_gds15_id_seq', 3, true);
          @base          postgres    false    324                       0    0    treating_patient_hdsr_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('"@base".treating_patient_hdsr_id_seq', 5, true);
          @base          postgres    false    325                       0    0 $   treating_patient_instrumental_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('"@base".treating_patient_instrumental_id_seq', 1, false);
          @base          postgres    false    326                       0    0    treating_patient_mmse_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('"@base".treating_patient_mmse_id_seq', 6, true);
          @base          postgres    false    327                       0    0    treating_patient_mna_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('"@base".treating_patient_mna_id_seq', 1, true);
          @base          postgres    false    328                       0    0    treating_patient_qol_pgc_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('"@base".treating_patient_qol_pgc_id_seq', 2, true);
          @base          postgres    false    329                       0    0    treating_patient_qol_sf8_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('"@base".treating_patient_qol_sf8_id_seq', 1, false);
          @base          postgres    false    330                       0    0 "   treating_patient_sarcopenia_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('"@base".treating_patient_sarcopenia_id_seq', 10, true);
          @base          postgres    false    331                       0    0 '   treating_patient_sarcopenia_loco_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('"@base".treating_patient_sarcopenia_loco_id_seq', 1, false);
          @base          postgres    false    332                       0    0    treating_patient_senior_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('"@base".treating_patient_senior_id_seq', 9, true);
          @base          postgres    false    524                       0    0     treating_patient_vitality_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('"@base".treating_patient_vitality_id_seq', 5, true);
          @base          postgres    false    333                       0    0    treating_patient_zarit_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"@base".treating_patient_zarit_id_seq', 1, true);
          @base          postgres    false    334                       0    0    treating_patients_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('"@base".treating_patients_id_seq', 170, true);
          @base          postgres    false    335                       0    0    users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('"@base".users_id_seq', 16, true);
          @base          postgres    false    336                        0    0    service_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.service_id_seq', 10, true);
          public          postgres    false    339            !           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    341            A           2606    27312 $   areas areas_area_name_service_id_key 
   CONSTRAINT     q   ALTER TABLE ONLY "@base".areas
    ADD CONSTRAINT areas_area_name_service_id_key UNIQUE (area_name, service_id);
 O   ALTER TABLE ONLY "@base".areas DROP CONSTRAINT areas_area_name_service_id_key;
       @base            postgres    false    207    207            C           2606    27314    areas areas_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY "@base".areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY "@base".areas DROP CONSTRAINT areas_pkey;
       @base            postgres    false    207            E           2606    27316 *   centers centers_center_name_service_id_key 
   CONSTRAINT     y   ALTER TABLE ONLY "@base".centers
    ADD CONSTRAINT centers_center_name_service_id_key UNIQUE (center_name, service_id);
 U   ALTER TABLE ONLY "@base".centers DROP CONSTRAINT centers_center_name_service_id_key;
       @base            postgres    false    209    209            G           2606    27318    centers centers_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY "@base".centers
    ADD CONSTRAINT centers_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY "@base".centers DROP CONSTRAINT centers_pkey;
       @base            postgres    false    209            I           2606    27320 +   patients patients_patient_cd_service_id_key 
   CONSTRAINT     y   ALTER TABLE ONLY "@base".patients
    ADD CONSTRAINT patients_patient_cd_service_id_key UNIQUE (patient_cd, service_id);
 V   ALTER TABLE ONLY "@base".patients DROP CONSTRAINT patients_patient_cd_service_id_key;
       @base            postgres    false    211    211            K           2606    27322    patients patients_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY "@base".patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY "@base".patients DROP CONSTRAINT patients_pkey;
       @base            postgres    false    211            M           2606    27324 .   treating_patient_adl treating_patient_adl_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY "@base".treating_patient_adl
    ADD CONSTRAINT treating_patient_adl_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY "@base".treating_patient_adl DROP CONSTRAINT treating_patient_adl_pkey;
       @base            postgres    false    213            O           2606    27326 :   treating_patient_basic_adl treating_patient_basic_adl_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY "@base".treating_patient_basic_adl
    ADD CONSTRAINT treating_patient_basic_adl_pkey PRIMARY KEY (id);
 e   ALTER TABLE ONLY "@base".treating_patient_basic_adl DROP CONSTRAINT treating_patient_basic_adl_pkey;
       @base            postgres    false    215            Q           2606    27328 >   treating_patient_blood_sugar treating_patient_blood_sugar_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY "@base".treating_patient_blood_sugar
    ADD CONSTRAINT treating_patient_blood_sugar_pkey PRIMARY KEY (id);
 i   ALTER TABLE ONLY "@base".treating_patient_blood_sugar DROP CONSTRAINT treating_patient_blood_sugar_pkey;
       @base            postgres    false    217            S           2606    27330 0   treating_patient_cga7 treating_patient_cga7_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY "@base".treating_patient_cga7
    ADD CONSTRAINT treating_patient_cga7_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY "@base".treating_patient_cga7 DROP CONSTRAINT treating_patient_cga7_pkey;
       @base            postgres    false    219            U           2606    27332 F   treating_patient_closure_sticker treating_patient_closure_sticker_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_closure_sticker
    ADD CONSTRAINT treating_patient_closure_sticker_pkey PRIMARY KEY (id);
 q   ALTER TABLE ONLY "@base".treating_patient_closure_sticker DROP CONSTRAINT treating_patient_closure_sticker_pkey;
       @base            postgres    false    221            W           2606    27334 B   treating_patient_comprehensive treating_patient_comprehensive_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_comprehensive
    ADD CONSTRAINT treating_patient_comprehensive_pkey PRIMARY KEY (id);
 m   ALTER TABLE ONLY "@base".treating_patient_comprehensive DROP CONSTRAINT treating_patient_comprehensive_pkey;
       @base            postgres    false    223            Y           2606    27336 .   treating_patient_dbd treating_patient_dbd_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY "@base".treating_patient_dbd
    ADD CONSTRAINT treating_patient_dbd_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY "@base".treating_patient_dbd DROP CONSTRAINT treating_patient_dbd_pkey;
       @base            postgres    false    225            ]           2606    27338 2   treating_patient_fra_a treating_patient_fra_a_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY "@base".treating_patient_fra_a
    ADD CONSTRAINT treating_patient_fra_a_pkey PRIMARY KEY (id);
 ]   ALTER TABLE ONLY "@base".treating_patient_fra_a DROP CONSTRAINT treating_patient_fra_a_pkey;
       @base            postgres    false    229            _           2606    27340 2   treating_patient_fra_b treating_patient_fra_b_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY "@base".treating_patient_fra_b
    ADD CONSTRAINT treating_patient_fra_b_pkey PRIMARY KEY (id);
 ]   ALTER TABLE ONLY "@base".treating_patient_fra_b DROP CONSTRAINT treating_patient_fra_b_pkey;
       @base            postgres    false    231            [           2606    27342 .   treating_patient_fra treating_patient_fra_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY "@base".treating_patient_fra
    ADD CONSTRAINT treating_patient_fra_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY "@base".treating_patient_fra DROP CONSTRAINT treating_patient_fra_pkey;
       @base            postgres    false    227            a           2606    27344 2   treating_patient_gds15 treating_patient_gds15_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY "@base".treating_patient_gds15
    ADD CONSTRAINT treating_patient_gds15_pkey PRIMARY KEY (id);
 ]   ALTER TABLE ONLY "@base".treating_patient_gds15 DROP CONSTRAINT treating_patient_gds15_pkey;
       @base            postgres    false    233            c           2606    27346 0   treating_patient_hdsr treating_patient_hdsr_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY "@base".treating_patient_hdsr
    ADD CONSTRAINT treating_patient_hdsr_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY "@base".treating_patient_hdsr DROP CONSTRAINT treating_patient_hdsr_pkey;
       @base            postgres    false    235            e           2606    27348 @   treating_patient_instrumental treating_patient_instrumental_pkey 
   CONSTRAINT        ALTER TABLE ONLY "@base".treating_patient_instrumental
    ADD CONSTRAINT treating_patient_instrumental_pkey PRIMARY KEY (id);
 k   ALTER TABLE ONLY "@base".treating_patient_instrumental DROP CONSTRAINT treating_patient_instrumental_pkey;
       @base            postgres    false    237            g           2606    27350 0   treating_patient_mmse treating_patient_mmse_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY "@base".treating_patient_mmse
    ADD CONSTRAINT treating_patient_mmse_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY "@base".treating_patient_mmse DROP CONSTRAINT treating_patient_mmse_pkey;
       @base            postgres    false    239            i           2606    27352 .   treating_patient_mna treating_patient_mna_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY "@base".treating_patient_mna
    ADD CONSTRAINT treating_patient_mna_pkey PRIMARY KEY (id);
 Y   ALTER TABLE ONLY "@base".treating_patient_mna DROP CONSTRAINT treating_patient_mna_pkey;
       @base            postgres    false    241            k           2606    27354 6   treating_patient_qol_pgc treating_patient_qol_pgc_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY "@base".treating_patient_qol_pgc
    ADD CONSTRAINT treating_patient_qol_pgc_pkey PRIMARY KEY (id);
 a   ALTER TABLE ONLY "@base".treating_patient_qol_pgc DROP CONSTRAINT treating_patient_qol_pgc_pkey;
       @base            postgres    false    243            m           2606    27356 6   treating_patient_qol_sf8 treating_patient_qol_sf8_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY "@base".treating_patient_qol_sf8
    ADD CONSTRAINT treating_patient_qol_sf8_pkey PRIMARY KEY (id);
 a   ALTER TABLE ONLY "@base".treating_patient_qol_sf8 DROP CONSTRAINT treating_patient_qol_sf8_pkey;
       @base            postgres    false    245            q           2606    27358 F   treating_patient_sarcopenia_loco treating_patient_sarcopenia_loco_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_sarcopenia_loco
    ADD CONSTRAINT treating_patient_sarcopenia_loco_pkey PRIMARY KEY (id);
 q   ALTER TABLE ONLY "@base".treating_patient_sarcopenia_loco DROP CONSTRAINT treating_patient_sarcopenia_loco_pkey;
       @base            postgres    false    249            o           2606    27360 <   treating_patient_sarcopenia treating_patient_sarcopenia_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY "@base".treating_patient_sarcopenia
    ADD CONSTRAINT treating_patient_sarcopenia_pkey PRIMARY KEY (id);
 g   ALTER TABLE ONLY "@base".treating_patient_sarcopenia DROP CONSTRAINT treating_patient_sarcopenia_pkey;
       @base            postgres    false    247            �           2606    72210 4   treating_patient_senior treating_patient_senior_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY "@base".treating_patient_senior
    ADD CONSTRAINT treating_patient_senior_pkey PRIMARY KEY (id);
 _   ALTER TABLE ONLY "@base".treating_patient_senior DROP CONSTRAINT treating_patient_senior_pkey;
       @base            postgres    false    525            s           2606    27362 8   treating_patient_vitality treating_patient_vitality_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY "@base".treating_patient_vitality
    ADD CONSTRAINT treating_patient_vitality_pkey PRIMARY KEY (id);
 c   ALTER TABLE ONLY "@base".treating_patient_vitality DROP CONSTRAINT treating_patient_vitality_pkey;
       @base            postgres    false    251            u           2606    27364 2   treating_patient_zarit treating_patient_zarit_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY "@base".treating_patient_zarit
    ADD CONSTRAINT treating_patient_zarit_pkey PRIMARY KEY (id);
 ]   ALTER TABLE ONLY "@base".treating_patient_zarit DROP CONSTRAINT treating_patient_zarit_pkey;
       @base            postgres    false    253            w           2606    27366 (   treating_patients treating_patients_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY "@base".treating_patients
    ADD CONSTRAINT treating_patients_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY "@base".treating_patients DROP CONSTRAINT treating_patients_pkey;
       @base            postgres    false    255            y           2606    27368    users users_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY "@base".users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY "@base".users DROP CONSTRAINT users_pkey;
       @base            postgres    false    257            {           2606    27370 #   users users_username_service_id_key 
   CONSTRAINT     o   ALTER TABLE ONLY "@base".users
    ADD CONSTRAINT users_username_service_id_key UNIQUE (username, service_id);
 N   ALTER TABLE ONLY "@base".users DROP CONSTRAINT users_username_service_id_key;
       @base            postgres    false    257    257            }           2606    27372    phinxlog phinxlog_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.phinxlog
    ADD CONSTRAINT phinxlog_pkey PRIMARY KEY (version);
 @   ALTER TABLE ONLY public.phinxlog DROP CONSTRAINT phinxlog_pkey;
       public            postgres    false    337                       2606    27374     service service_digest_login_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_digest_login_key UNIQUE (digest_login);
 J   ALTER TABLE ONLY public.service DROP CONSTRAINT service_digest_login_key;
       public            postgres    false    338            �           2606    27376    service service_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.service DROP CONSTRAINT service_pkey;
       public            postgres    false    338            �           2606    27378     service service_service_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_service_name_key UNIQUE (service_name);
 J   ALTER TABLE ONLY public.service DROP CONSTRAINT service_service_name_key;
       public            postgres    false    338            �           2606    27380    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    340            �           2606    27382    users users_user_login_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_login_key UNIQUE (user_login);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_user_login_key;
       public            postgres    false    340            �           2606    27383    areas areas_center_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY "@base".areas
    ADD CONSTRAINT areas_center_id_fkey FOREIGN KEY (center_id) REFERENCES "@base".centers(id);
 E   ALTER TABLE ONLY "@base".areas DROP CONSTRAINT areas_center_id_fkey;
       @base          postgres    false    209    5447    207            �           2606    27388    areas areas_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".areas
    ADD CONSTRAINT areas_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 F   ALTER TABLE ONLY "@base".areas DROP CONSTRAINT areas_service_id_fkey;
       @base          postgres    false    5505    207    338            �           2606    27393    centers centers_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".centers
    ADD CONSTRAINT centers_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 J   ALTER TABLE ONLY "@base".centers DROP CONSTRAINT centers_service_id_fkey;
       @base          postgres    false    209    5505    338            �           2606    27398    patients patients_area_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY "@base".patients
    ADD CONSTRAINT patients_area_id_fkey FOREIGN KEY (area_id) REFERENCES "@base".areas(id);
 I   ALTER TABLE ONLY "@base".patients DROP CONSTRAINT patients_area_id_fkey;
       @base          postgres    false    5443    207    211            �           2606    27403 !   patients patients_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".patients
    ADD CONSTRAINT patients_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 L   ALTER TABLE ONLY "@base".patients DROP CONSTRAINT patients_service_id_fkey;
       @base          postgres    false    211    338    5505            �           2606    27408 9   treating_patient_adl treating_patient_adl_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_adl
    ADD CONSTRAINT treating_patient_adl_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 d   ALTER TABLE ONLY "@base".treating_patient_adl DROP CONSTRAINT treating_patient_adl_service_id_fkey;
       @base          postgres    false    5505    213    338            �           2606    27413 B   treating_patient_adl treating_patient_adl_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_adl
    ADD CONSTRAINT treating_patient_adl_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 m   ALTER TABLE ONLY "@base".treating_patient_adl DROP CONSTRAINT treating_patient_adl_treating_patient_id_fkey;
       @base          postgres    false    5495    213    255            �           2606    27418 E   treating_patient_basic_adl treating_patient_basic_adl_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_basic_adl
    ADD CONSTRAINT treating_patient_basic_adl_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 p   ALTER TABLE ONLY "@base".treating_patient_basic_adl DROP CONSTRAINT treating_patient_basic_adl_service_id_fkey;
       @base          postgres    false    5505    215    338            �           2606    27423 N   treating_patient_basic_adl treating_patient_basic_adl_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_basic_adl
    ADD CONSTRAINT treating_patient_basic_adl_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 y   ALTER TABLE ONLY "@base".treating_patient_basic_adl DROP CONSTRAINT treating_patient_basic_adl_treating_patient_id_fkey;
       @base          postgres    false    5495    255    215            �           2606    27428 I   treating_patient_blood_sugar treating_patient_blood_sugar_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_blood_sugar
    ADD CONSTRAINT treating_patient_blood_sugar_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 t   ALTER TABLE ONLY "@base".treating_patient_blood_sugar DROP CONSTRAINT treating_patient_blood_sugar_service_id_fkey;
       @base          postgres    false    5505    217    338            �           2606    27433 R   treating_patient_blood_sugar treating_patient_blood_sugar_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_blood_sugar
    ADD CONSTRAINT treating_patient_blood_sugar_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 }   ALTER TABLE ONLY "@base".treating_patient_blood_sugar DROP CONSTRAINT treating_patient_blood_sugar_treating_patient_id_fkey;
       @base          postgres    false    255    5495    217            �           2606    27438 ;   treating_patient_cga7 treating_patient_cga7_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_cga7
    ADD CONSTRAINT treating_patient_cga7_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 f   ALTER TABLE ONLY "@base".treating_patient_cga7 DROP CONSTRAINT treating_patient_cga7_service_id_fkey;
       @base          postgres    false    338    5505    219            �           2606    27443 D   treating_patient_cga7 treating_patient_cga7_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_cga7
    ADD CONSTRAINT treating_patient_cga7_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 o   ALTER TABLE ONLY "@base".treating_patient_cga7 DROP CONSTRAINT treating_patient_cga7_treating_patient_id_fkey;
       @base          postgres    false    219    255    5495            �           2606    27448 Q   treating_patient_closure_sticker treating_patient_closure_sticker_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_closure_sticker
    ADD CONSTRAINT treating_patient_closure_sticker_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 |   ALTER TABLE ONLY "@base".treating_patient_closure_sticker DROP CONSTRAINT treating_patient_closure_sticker_service_id_fkey;
       @base          postgres    false    5505    338    221            �           2606    27453 Z   treating_patient_closure_sticker treating_patient_closure_sticker_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_closure_sticker
    ADD CONSTRAINT treating_patient_closure_sticker_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 �   ALTER TABLE ONLY "@base".treating_patient_closure_sticker DROP CONSTRAINT treating_patient_closure_sticker_treating_patient_id_fkey;
       @base          postgres    false    221    5495    255            �           2606    27458 M   treating_patient_comprehensive treating_patient_comprehensive_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_comprehensive
    ADD CONSTRAINT treating_patient_comprehensive_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 x   ALTER TABLE ONLY "@base".treating_patient_comprehensive DROP CONSTRAINT treating_patient_comprehensive_service_id_fkey;
       @base          postgres    false    223    5505    338            �           2606    27463 V   treating_patient_comprehensive treating_patient_comprehensive_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_comprehensive
    ADD CONSTRAINT treating_patient_comprehensive_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 �   ALTER TABLE ONLY "@base".treating_patient_comprehensive DROP CONSTRAINT treating_patient_comprehensive_treating_patient_id_fkey;
       @base          postgres    false    255    5495    223            �           2606    27468 9   treating_patient_dbd treating_patient_dbd_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_dbd
    ADD CONSTRAINT treating_patient_dbd_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 d   ALTER TABLE ONLY "@base".treating_patient_dbd DROP CONSTRAINT treating_patient_dbd_service_id_fkey;
       @base          postgres    false    5505    338    225            �           2606    27473 B   treating_patient_dbd treating_patient_dbd_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_dbd
    ADD CONSTRAINT treating_patient_dbd_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 m   ALTER TABLE ONLY "@base".treating_patient_dbd DROP CONSTRAINT treating_patient_dbd_treating_patient_id_fkey;
       @base          postgres    false    255    5495    225            �           2606    27478 =   treating_patient_fra_a treating_patient_fra_a_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_fra_a
    ADD CONSTRAINT treating_patient_fra_a_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 h   ALTER TABLE ONLY "@base".treating_patient_fra_a DROP CONSTRAINT treating_patient_fra_a_service_id_fkey;
       @base          postgres    false    5505    338    229            �           2606    27483 F   treating_patient_fra_a treating_patient_fra_a_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_fra_a
    ADD CONSTRAINT treating_patient_fra_a_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 q   ALTER TABLE ONLY "@base".treating_patient_fra_a DROP CONSTRAINT treating_patient_fra_a_treating_patient_id_fkey;
       @base          postgres    false    229    5495    255            �           2606    27488 =   treating_patient_fra_b treating_patient_fra_b_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_fra_b
    ADD CONSTRAINT treating_patient_fra_b_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 h   ALTER TABLE ONLY "@base".treating_patient_fra_b DROP CONSTRAINT treating_patient_fra_b_service_id_fkey;
       @base          postgres    false    5505    338    231            �           2606    27493 F   treating_patient_fra_b treating_patient_fra_b_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_fra_b
    ADD CONSTRAINT treating_patient_fra_b_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 q   ALTER TABLE ONLY "@base".treating_patient_fra_b DROP CONSTRAINT treating_patient_fra_b_treating_patient_id_fkey;
       @base          postgres    false    231    5495    255            �           2606    27498 9   treating_patient_fra treating_patient_fra_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_fra
    ADD CONSTRAINT treating_patient_fra_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 d   ALTER TABLE ONLY "@base".treating_patient_fra DROP CONSTRAINT treating_patient_fra_service_id_fkey;
       @base          postgres    false    227    5505    338            �           2606    27503 B   treating_patient_fra treating_patient_fra_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_fra
    ADD CONSTRAINT treating_patient_fra_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 m   ALTER TABLE ONLY "@base".treating_patient_fra DROP CONSTRAINT treating_patient_fra_treating_patient_id_fkey;
       @base          postgres    false    5495    227    255            �           2606    27508 =   treating_patient_gds15 treating_patient_gds15_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_gds15
    ADD CONSTRAINT treating_patient_gds15_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 h   ALTER TABLE ONLY "@base".treating_patient_gds15 DROP CONSTRAINT treating_patient_gds15_service_id_fkey;
       @base          postgres    false    5505    233    338            �           2606    27513 F   treating_patient_gds15 treating_patient_gds15_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_gds15
    ADD CONSTRAINT treating_patient_gds15_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 q   ALTER TABLE ONLY "@base".treating_patient_gds15 DROP CONSTRAINT treating_patient_gds15_treating_patient_id_fkey;
       @base          postgres    false    255    5495    233            �           2606    27518 ;   treating_patient_hdsr treating_patient_hdsr_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_hdsr
    ADD CONSTRAINT treating_patient_hdsr_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 f   ALTER TABLE ONLY "@base".treating_patient_hdsr DROP CONSTRAINT treating_patient_hdsr_service_id_fkey;
       @base          postgres    false    338    5505    235            �           2606    27523 D   treating_patient_hdsr treating_patient_hdsr_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_hdsr
    ADD CONSTRAINT treating_patient_hdsr_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 o   ALTER TABLE ONLY "@base".treating_patient_hdsr DROP CONSTRAINT treating_patient_hdsr_treating_patient_id_fkey;
       @base          postgres    false    5495    255    235            �           2606    27528 K   treating_patient_instrumental treating_patient_instrumental_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_instrumental
    ADD CONSTRAINT treating_patient_instrumental_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 v   ALTER TABLE ONLY "@base".treating_patient_instrumental DROP CONSTRAINT treating_patient_instrumental_service_id_fkey;
       @base          postgres    false    338    5505    237            �           2606    27533 T   treating_patient_instrumental treating_patient_instrumental_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_instrumental
    ADD CONSTRAINT treating_patient_instrumental_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
    ALTER TABLE ONLY "@base".treating_patient_instrumental DROP CONSTRAINT treating_patient_instrumental_treating_patient_id_fkey;
       @base          postgres    false    255    237    5495            �           2606    27538 ;   treating_patient_mmse treating_patient_mmse_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_mmse
    ADD CONSTRAINT treating_patient_mmse_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 f   ALTER TABLE ONLY "@base".treating_patient_mmse DROP CONSTRAINT treating_patient_mmse_service_id_fkey;
       @base          postgres    false    338    239    5505            �           2606    27543 D   treating_patient_mmse treating_patient_mmse_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_mmse
    ADD CONSTRAINT treating_patient_mmse_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 o   ALTER TABLE ONLY "@base".treating_patient_mmse DROP CONSTRAINT treating_patient_mmse_treating_patient_id_fkey;
       @base          postgres    false    255    239    5495            �           2606    27548 9   treating_patient_mna treating_patient_mna_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_mna
    ADD CONSTRAINT treating_patient_mna_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 d   ALTER TABLE ONLY "@base".treating_patient_mna DROP CONSTRAINT treating_patient_mna_service_id_fkey;
       @base          postgres    false    338    241    5505            �           2606    27553 B   treating_patient_mna treating_patient_mna_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_mna
    ADD CONSTRAINT treating_patient_mna_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 m   ALTER TABLE ONLY "@base".treating_patient_mna DROP CONSTRAINT treating_patient_mna_treating_patient_id_fkey;
       @base          postgres    false    255    5495    241            �           2606    27558 A   treating_patient_qol_pgc treating_patient_qol_pgc_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_qol_pgc
    ADD CONSTRAINT treating_patient_qol_pgc_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 l   ALTER TABLE ONLY "@base".treating_patient_qol_pgc DROP CONSTRAINT treating_patient_qol_pgc_service_id_fkey;
       @base          postgres    false    338    243    5505            �           2606    27563 J   treating_patient_qol_pgc treating_patient_qol_pgc_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_qol_pgc
    ADD CONSTRAINT treating_patient_qol_pgc_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 u   ALTER TABLE ONLY "@base".treating_patient_qol_pgc DROP CONSTRAINT treating_patient_qol_pgc_treating_patient_id_fkey;
       @base          postgres    false    5495    243    255            �           2606    27568 A   treating_patient_qol_sf8 treating_patient_qol_sf8_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_qol_sf8
    ADD CONSTRAINT treating_patient_qol_sf8_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 l   ALTER TABLE ONLY "@base".treating_patient_qol_sf8 DROP CONSTRAINT treating_patient_qol_sf8_service_id_fkey;
       @base          postgres    false    338    245    5505            �           2606    27573 J   treating_patient_qol_sf8 treating_patient_qol_sf8_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_qol_sf8
    ADD CONSTRAINT treating_patient_qol_sf8_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 u   ALTER TABLE ONLY "@base".treating_patient_qol_sf8 DROP CONSTRAINT treating_patient_qol_sf8_treating_patient_id_fkey;
       @base          postgres    false    5495    245    255            �           2606    27578 Q   treating_patient_sarcopenia_loco treating_patient_sarcopenia_loco_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_sarcopenia_loco
    ADD CONSTRAINT treating_patient_sarcopenia_loco_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 |   ALTER TABLE ONLY "@base".treating_patient_sarcopenia_loco DROP CONSTRAINT treating_patient_sarcopenia_loco_service_id_fkey;
       @base          postgres    false    5505    249    338            �           2606    27583 Z   treating_patient_sarcopenia_loco treating_patient_sarcopenia_loco_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_sarcopenia_loco
    ADD CONSTRAINT treating_patient_sarcopenia_loco_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 �   ALTER TABLE ONLY "@base".treating_patient_sarcopenia_loco DROP CONSTRAINT treating_patient_sarcopenia_loco_treating_patient_id_fkey;
       @base          postgres    false    249    5495    255            �           2606    27588 G   treating_patient_sarcopenia treating_patient_sarcopenia_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_sarcopenia
    ADD CONSTRAINT treating_patient_sarcopenia_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 r   ALTER TABLE ONLY "@base".treating_patient_sarcopenia DROP CONSTRAINT treating_patient_sarcopenia_service_id_fkey;
       @base          postgres    false    338    5505    247            �           2606    27593 P   treating_patient_sarcopenia treating_patient_sarcopenia_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_sarcopenia
    ADD CONSTRAINT treating_patient_sarcopenia_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 {   ALTER TABLE ONLY "@base".treating_patient_sarcopenia DROP CONSTRAINT treating_patient_sarcopenia_treating_patient_id_fkey;
       @base          postgres    false    255    247    5495            �           2606    72211 ?   treating_patient_senior treating_patient_senior_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_senior
    ADD CONSTRAINT treating_patient_senior_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 j   ALTER TABLE ONLY "@base".treating_patient_senior DROP CONSTRAINT treating_patient_senior_service_id_fkey;
       @base          postgres    false    525    5505    338            �           2606    72216 H   treating_patient_senior treating_patient_senior_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_senior
    ADD CONSTRAINT treating_patient_senior_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 s   ALTER TABLE ONLY "@base".treating_patient_senior DROP CONSTRAINT treating_patient_senior_treating_patient_id_fkey;
       @base          postgres    false    525    255    5495            �           2606    27598 C   treating_patient_vitality treating_patient_vitality_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_vitality
    ADD CONSTRAINT treating_patient_vitality_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 n   ALTER TABLE ONLY "@base".treating_patient_vitality DROP CONSTRAINT treating_patient_vitality_service_id_fkey;
       @base          postgres    false    338    251    5505            �           2606    27603 L   treating_patient_vitality treating_patient_vitality_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_vitality
    ADD CONSTRAINT treating_patient_vitality_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 w   ALTER TABLE ONLY "@base".treating_patient_vitality DROP CONSTRAINT treating_patient_vitality_treating_patient_id_fkey;
       @base          postgres    false    255    251    5495            �           2606    27608 =   treating_patient_zarit treating_patient_zarit_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_zarit
    ADD CONSTRAINT treating_patient_zarit_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 h   ALTER TABLE ONLY "@base".treating_patient_zarit DROP CONSTRAINT treating_patient_zarit_service_id_fkey;
       @base          postgres    false    338    253    5505            �           2606    27613 F   treating_patient_zarit treating_patient_zarit_treating_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patient_zarit
    ADD CONSTRAINT treating_patient_zarit_treating_patient_id_fkey FOREIGN KEY (treating_patient_id) REFERENCES "@base".treating_patients(id);
 q   ALTER TABLE ONLY "@base".treating_patient_zarit DROP CONSTRAINT treating_patient_zarit_treating_patient_id_fkey;
       @base          postgres    false    255    5495    253            �           2606    27618 0   treating_patients treating_patients_area_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patients
    ADD CONSTRAINT treating_patients_area_id_fkey FOREIGN KEY (area_id) REFERENCES "@base".areas(id);
 [   ALTER TABLE ONLY "@base".treating_patients DROP CONSTRAINT treating_patients_area_id_fkey;
       @base          postgres    false    255    207    5443            �           2606    27623 3   treating_patients treating_patients_patient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patients
    ADD CONSTRAINT treating_patients_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES "@base".patients(id);
 ^   ALTER TABLE ONLY "@base".treating_patients DROP CONSTRAINT treating_patients_patient_id_fkey;
       @base          postgres    false    211    5451    255            �           2606    27628 3   treating_patients treating_patients_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".treating_patients
    ADD CONSTRAINT treating_patients_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 ^   ALTER TABLE ONLY "@base".treating_patients DROP CONSTRAINT treating_patients_service_id_fkey;
       @base          postgres    false    255    5505    338            �           2606    27633    users users_center_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY "@base".users
    ADD CONSTRAINT users_center_id_fkey FOREIGN KEY (center_id) REFERENCES "@base".centers(id);
 E   ALTER TABLE ONLY "@base".users DROP CONSTRAINT users_center_id_fkey;
       @base          postgres    false    209    5447    257            �           2606    27638    users users_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "@base".users
    ADD CONSTRAINT users_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);
 F   ALTER TABLE ONLY "@base".users DROP CONSTRAINT users_service_id_fkey;
       @base          postgres    false    338    257    5505            :   �   x���=
�@��z�^@��59�'�2! &b�������b�ÌsG��b3�W<���ЁjW<��/���4c�2�LgF�h���4u����v|����3_{�F@���G�l+X�t`
kn[#Fl���V^��A�T0E� �kc�'�����>*�r��x#YS��ss����umXfT����N�gz�f
���QT��R�*z��      <   �  x���]N�@���)|G�Ll�8AO�K�*�VU+q��  ��B�(��"�%�s����-:^�Q-Էh�}ؕf�����k~=KnZ��R����M�?m �#<#|!l>�hh�]��%�T<��l��gy�M�Ĳ�����7`x�����<w�htȕۄ��'�]ۮ}�P�\[��U��R��,��u�֍�fZk�������?ǥ*Oo����PK�a4��	��F�|��ܫCx���#ꄇ<|�b�D��%�NE:�*RV:�X�󧃤�i��ϲ���M������`���#x�a�恡�J��=ex+�%y�c06,�ǽ[Ɯ^6W���@4jĽ���P��4y��pNyZ©�C¡Je�)�U�O�¼����)��,��G6�`��$��iR���$�����)��_&�T?���v�����ʋf��q!wd9/P_9�k��r�T�^мb      >   �  x���MnU���U�*z���^/�A��DHA�bɓ�H� 1��4�a��n��$)+X���n�>�v�wϩ�6Ѥ�W_?.�K��������S?�����z�≪�\t.K�.T�Ҏ�ɑ�H����}�}U�I�jH���S�沵�/���Jw��KP�6�2�:ɗS�>�;��5��Sr��dL����uC��ͩk�L�0a*/�����ح�w&N1����=�\����m�2�&̘
��X
,�6&ulƐ��6@�r`ٱ��3-)CV��H+�Ƕ�5�2d4��(En(m�h�m�+���E�(rE��S2�E�(
G�;J��c�!���K�������i?x������X��ٰk2�\�h)��vs�֍ܰ	C&�U���V�֮d�XzDh).�m,���ҝ�kƐ	-ńX
,9���yK2Z��Xv,w'sM2Z��Xq�t'KI2Z��Xu�u9�]Z��Xs���XRtAh)^�vq�:Ni)CFK1Z��R얲�V����c���h)FKqX��RV/iuo��2Z��R�b��RF\�_|Ţ�-%a)qK-tɫ	Cf��`���R�Y����1d��`���R�Y�i���s�C�h)�,%��ĳ�8�.�EK	f)�,%����^ΐ�R�YJ"K�g)���3d��`���R�Y����-%X�$
�x��Q�����l|�O���h|9C��`�h|⍏G������F�So|<_ΐ-�h)K�[JF�K2ZJ�R�R���Ɨ4d����4,�7���,h)EKiXJ5�e9Y�R��Ұ�Z��r�����F�R�R��O�R�YJ#K�g���'h)�,���ԳT��S��b���R�Y*s�)Z�0KYd)�,���-e��,�y��\|��2l|�ϼ�e.>EK6>��g��2����E�3o|��O�R��Ϣ�7��ŧh)CKYX��R��O�R�������2���-ea)sKe.>CKZ��R��\|��Z�RKXjqKe.>K-4���������|z����[�����\�\��ѧ3��.���
F��D���wJU�h�c�(��`�*��%@��>���P�?<��@���������p>����ӫ��?���|��ū�틛��wo��/���-G��tv^�Z����<����E�涶�D�m\?�짔'�����K0?�      @   -   x�3�4�4bLhd`h�k`�k`�`dledfeb�C4Ə+F��� �i      B   9   x�3�4�4�4� C02���60��50�50W02�22�2���"jl������� ��+      D      x������ � �      F      x������ � �      H   6   x�3�4�4�4�BC0Df����������������������?�=... ���      J      x������ � �      L   6   x�3�4�4C$h�@,,#CK]c]s##+cc+c�^l�1~\1z\\\ ()      N      x������ � �      P   �   x����� ��)X ���d�9�Q MZ�U� ���3�@��0i�P&\"��9Y����Y�09��i>�9������U��G�3���n���\��*[7�^�@u:��B����t� ���k�=�v�v�]S���~�)`�"Pk�UpP�Lѯ(��'?u{�.j�Ԏ�7 x  GX�      R   1   x�3�4�4�4�C#CK]c]s##+c3+#s�
Q�?�=... X�
�      T      x������ � �      V   :   x�3�4�4b(6� lCNS �420��50�50W02�20�21�4�*������ ��      X      x������ � �      Z   9   x�3�4�4b(F���d`�����R��X��\���������h�'p��qqq ��      \   F   x�3�4�4bc 	��@�!��e e�� X��9�-u�u�����,��@�����q��qqq ���      ^   7   x�3�4�4b8��P��F���ƺ�
FFVƦVƖ �XDc��b���� .G�      `      x������ � �      b   k   x�u���0C��, r�h�`��?)�+~VQ�R� ,]�X�u��X�mv��m��R�*�ws��o�����;mE2�x�(UW8�+?� �)����$      d      x������ � �      x      x������ � �      �      x������ � �      f   /   x�3�4�4b420��50�50W02�2��20�4�*������ Z 
�      h   9   x�3�4�4�4 �Ɯ&@ld��Z���+Y�X��䰈��q��qqq ��      j   !  x���[�� E�an�I=��E�
z��&����x�����p�/�Ԅ�%��Ya��"%��g��k�I�?�'Xi��?�6���	M��{��4��'$�O��Nd�����Fi�t�k��;C�u��A��17wQ�\�����t����p�s��Pl`7i�l�ʈ��s\wM�X��x�v�p�ic���<:n�u�ZT���?I�hޱ!C<���iK �N��8�#��{�+p�7._��O��lI}��WT�
�[�,2K�-Zm�&.�0��;���������G      l   (  x�mO�N�@]�~El����Lg	��	�W�Jش0E(�XZTV�pi�Ɲ�O�5��"Y�ܜܜ�s�9�x��?~������{�`�q�"eP�w5$59���dz�ϛ��WE&U�W>1q��&?��l�o�6\�ܣ@�b���ĸJ�P�n��:Q6!Z�)z@��@�K�M��nuc�e�T.��J�l�h>�vh�Q��ɲȣb���[�,�;�����Y����<>j�i�q.T�7��p����.�6 w��QFȿ(�ldZHM~
l���wl�Qg+�O[��eY_׊hU      d   4   x�34�4"Δ�0620��54�5�T0��20�25�44�*������ ���      c   :   x�34�44�4�L��B`d`h�kh�kd�`hie`deb�ih�U8Ə+F��� m��      t   N   x�%���0��] ����}F�R!��8ٌb����2�*�潱�5�K;�!�/��K!�d�<T���      s      x������ � �      r      x������ � �      u      x������ � �      q      x������ � �      p      x������ � �      o      x������ � �      n      x������ � �      m      x������ � �      l      x������ � �      k      x������ � �      b      x������ � �      a      x������ � �      `      x������ � �      \      x������ � �      ^      x������ � �      j      x������ � �      i      x������ � �      h      x������ � �      g      x������ � �      �      x������ � �      �      x������ � �      f      x������ � �      e      x������ � �      _   9   x�340�44 #ssN#CK]C]#K�?J"I)ZZ[�4�a������� ��      ]   �   x�m�K�@��3�ۑ{o�9�"�Rd-�>B+�H}����p����X�c:{����M�z��ku״̤�D0�w��5_�C��1�⾊�����٩�;��l����B�[�#��4ϑl�$0����������u#�� e�� =t����s�Ĕ3p      m   o   x�]�1�0���>E.��M��tbda�h�&*E�����B z�m"$�c�1��f�~V7���C�K{���T�<<�>=���/���ǿQq����v�N���+#1      n   �   x�u�A
1���)z�J~:�l]�t'ݺЂx{[H��GBQ2.���C�����2�}Tx�U�dI���JKv�x��[�K� �y�e�$9�������s}�]�1p�D�϶���<W��8�_i���9��:2�      o     x��V͎E>�>ż�8]�?s�6(B�s�ݱ9E {�-	D9$�\qAB�$��iFB�}�����鱔eܶ<�fꫮ����j��Å8�R�X��UU�J��FI�S*U��MU+��L�h'[g`>�A�ݵ���3�����5�`
%k�+��:mq-6h>��/h��J�Ë�)��R��FkP�)��A��I�^�����_���h��	�$��'_�?@oM�\mUmAT�h#!6�;�r�0N?�6$z�K�qr�����4N=\*F��P��7�v���T�E�?����P��Y5�'Hѱ������o~}����� �!mp
׈j�ٖĠ�[����M�'`o]J��a�o��j9acc�V��d�Q��f�kd��o���Q�):��g�/�]uW,g�������/��_.rDkݕa��:�#س�SV��b�-�n���b�n@���N@�Z�6�t����*F�TF �2�3��1r��41�G�\'�jւ�	P��D���Z��&�Ă0�shL��}
���F!�,(L��J�C#$e�X�}|����@ŚVq6�7D��R!�������v��}���?k�o�uwTE��i��k���w��v`���E^^^^]]��[���!�
T��ؼz?RtPTY��y�e����j��%u�S��9�c
D�aGqe�,fӕ��X����̆N5j�?U{�s �H./�{[P�p���G����+v�O�s�h�.�	�>���ؠ�>j�Q7��h������v�ݮ�0x��T��5I�md
����������S�2ò�6�cw�f���lw�IsṰ��g����~:hD):�cD��^���:�y	�,r�a;�洃�L'.�̩(����,r@����Y��H����*}<�,���u���ڪ�4���xM�}8"�16���vϊ4�95�� &�0��ijx��6�����H��s|x-�A�US.Z��l�"�����xNs���+~\7�ۣ�S4K9ﻊ�8�L'=`��I'td������?n���      p      x������ � �      q      x������ � �      r      x������ � �      s      x������ � �      t      x������ � �      u      x������ � �      v      x������ � �      w   h   x����� D��,�i
�!���簨�ӿw�{��П˖�&�(��jR|��=d���@�Q�J��&��2�Y�{�?`�I��U�p	f�CЗ���+�      x   �  x��V�m�0����� ���!:A��㒔eђ��A�6!�I獶 l��y���	0�r/�|��YU���Wv��=�}~nW����Ӫ
ïQ`�-6��p`*>0��*V2$(�O����B�3@�b�������"U����Bf�7O7̳�0/0�C�`��T��xXՙ����v��O�.+[�V����W��^Ȁ/�S���������O*aH�V](���5�� ���I��B���m�Q2sܨ��?b�^���B�vU��'�4������ ���z���vu��~��1gɢ����!sUsі���sHh����6����]3���>�&��9K��A3��\Ԏ��t1����N����J&���\���~�?&��"o4��); ;J��4�)�ğE[�	y��9]2��=/�aZ��6 �j~q�pk��s&os���r�d΃�%����2����u�L<Ji�2n�1euC.>�j�G\�E<J#���LA�6�b��e�$ެ�#�YG�B���r�G��d�]���4��W:r �$\�ё*�%g�)����&�٫y�H{i��<}p.BO�F�O�il���zt6Ε�5�W��k�L��j8�㌗0�8G9[C7�S���fթ�LT�فԞ zy2w�Fa ��f���X����$��h���
��E|�[w���κ�0��f���ay�&�B+Z��'G�f��7VMo�)��7���}��T>��      y      x������ � �      z   Z   x�}��	� C��)\�r��������
��P!$�015M���*ꅞ�Bk��n[��D�c�۠��+���H�,����|=~�~K?D�$�      {   �   x�mQ�� |C4@FXFJHԐG�D�	f�G�#��+r��"����K�`��E�eT�k{���\�é�Qڞ��8.��?jlJ@T�M�+H�8�L��t�&���+[��= +Kwr:�%���~�s��IaN�O��D�Q2>����g�$B�"i�sluY��"W�i��� X�      |      x������ � �      }   y   x�����0Dkj
-`��(J��� �t���,C�?A��z8^U��#�|y#�	ub�$����N*��!Y.;uW���N��y_@ A�����O�)Y�w�AŐ�[ׇ� ��2�6��;j      ~      x������ � �         5   x�3�4�47�4�BC8�.fd`h�k`�kd�`hfebnelԊM4Ə+F��� B��      �      x������ � �      �   �   x�mP��0|���� �3D'��s����b,�����D�°c�c@�g%��6n��Q��=�%�a��4#v��t��ݽ���R�IQ �2�������܆ߌD#!eϙB<G�3��
Kx�	�����q��A���Us�NaQ�Ǭ�aD�V�g�U֍����f�BN���������ĵ��ӕ��r���ǣ����R�      �      x������ � �      y      x������ � �      �   �   x����� ��]��gl<D'��s��BZ��x��t8 �w	0�6y�L�	H�����;VdYGt"9�`� ���b���Fd��6'j#r�(���9��ȽjRL�E\��[a�W���)QI�VP�Q�ȏ*�j�jܚ�4�,���x�e�&v�C����0��0�gdW�wY;�E�!��ݛ��a&U���g���wX�      �   h   x�u��	�@D�ki�0~vA�H��C���y�ӆTz*$�ꇬ4OxU�辨W��.
X�H�������'^�����w|e����R��ʹ��O"���       �      x������ � �      �   �  x���mr�0�{O�dG�o�'���Q������wۦ�	���^@�\��Y ��o�Hq�n��3��|���������b"����G�k��a���N�`�y	0�c\�O����2����/���u��L���S����3�����(NP�'��m����`��ʵo�LL�͵6�����3���D�K���3J�w�uf��V��qn$٨��t��X����O��*��������V��:Z����/�.�԰7S�*�`]K� HJK��LO�/ޑ������aaA����UC��5�U��x���Eي�d�L�Hq�,/�ѭ���.�o�]Xmp�ot� S4���0YmI����/,ٟ���0�X��W��g�O-.F����`�D��@�X�~��O�&��1�6n�u�"�}+�m�i�p����H�~��O����e���k�'@�b0�{U5P�R:����?R�zj%��=��fĕ�'�ܬ̴Y�o����m�g�����	{~�6��c� ��I�I�[N���Z�f��6��}AX�p��9ZyìfeA��om<A�F�f+��f�:m�gN|ٺ&�����j��ʩ��:Ρ��Zɩ�ek���ҏ�Y�ٳ5�`��%O��l���L**i��ݻ��m����T�h%f���Θ�Rն���}�����S+1�*��(�xn�h�C��p�zjw��}_i����>��}^IҨ�w�*{�ç�Wg�V{u�Q׀���aʩ�=k{���~�f�K�N��r�r5�r��:�\��>���J�ZiP?,� aj�ЎQ������J+���ûg\*�'�/��'Eˆ�q����A@U5��~H��?�a����eS.����� �3!�|#�<T���QPN"k����{.?��=G�}yޢ�;�u�E*� q��t����E폱
����ؔJr���fM�B�_�[�_�\��4T[�����@���*VI�&.�?�X\�E�I�d}��ij]J��(m�<b��� `��Q��(�V����G!523���C�Q����r����G+�S=���� 1�κ�P��uNo������h��}FO<�0�D�N-��<U�n����^/��nuew�n�U����
�6�s�4�ЭG�;�7WN,g�R|�u�_�m�+ʧ<G�Xe�-�
ށ��S+CC�1W�v�v�z嚇|�;���
��Lo�=����I�Sq>6l�
�epIw���<C�*оQ�U(�>�)���V���*�-�|��yw�"T[E���X��j�!� d�Ҩ�-<�	�u~Q��s~�U���pxNєf�X�f�N��ge��m�-�sU�Ռ/�%��Q6Z% ��!��h/A�A�p�g_�OO�}��d����@�E�z�}}����>�Ћ��@����*׈|xҜ���d`�L��k������4Q��Y��ۦ�����W�!2B�I)�ǩ�)΀�K㰯�|�7���:;�U�8S�Ff�x�0�	m�u��i$�x� $eN�����ʡG��^;�_�8H�(26$��ʦY/�
��� %�I�觘�6T�v�������#�7�>��6L�ei���N�a�v��m�I���߼��t�q ��H�n`~�ō��k��(D���5̰�ۣ�r?M��*����tE�C����bK�I�>�yݹk��D>��D��S�����qθ�V#iV+�洋{��'H��׏D��oE�Fn�Z��K;>��ގ�m����O��
H�ջ5��#٬�[��%I� ��*L+n�0��F�0���ʔ�-�[ŵuba{�N��`Yf{w[6���G'*�wIڃn��ʝ6Y���lŧ[����0���*L�ɞ��*OGݙ�Va��9|662�M�R^3�U�s&�Z#3I�	���*L����'&�4�OLV�;�sf��<�������6M�7\�|Iz'��Vb�}>��F`�      �   ;  x���[s�0 �g�>�LB��m� 
E�*��1((t�����b��vgg�̙�L�圀$�]!�	  
׀G�� ��qN_{L�$v��K�3����y���L�SdJt�gǷ�:�� �=�P(�.,"�	�AtA~�Oٵ�P�D�� ����u.���[�t���)�b]��q:!a��Xl�L��OY8Q�;6�T���� 5�f`݀��v��6��A�`y����Y��3���	G���}ɉ;,r�[��G~�`���~ۉ�4\n�=�v� ��-Q�@pw8T�E�d̀�w�%��Z�i�c��(ɞxVNFS�Lm�s��F���=��`��Y������,�rӉ�U����7!1d��W�cP���$J�y�)��(/2Z<g̬�?��)�T�57�u�]9�˱�R㹩,��ŲepR��F���c��$!�H��H��"���� �.g�����WT�H5�VM�� 2��~ Ӫ�_���:����������#s�ƶӥ����אN����=�+��Y�7a��0�6��E4!41 �����.b|�;�fy��R���a�	      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      z      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�3�4���LL��̃�
ىy�ffqIQbI~��Q�����eQ�[aF����{�o��[P~�gDji�ORR����{XXA�Q�I�^����ynRxQ��3�!���4� 420��50�5�T04�24�2;�0W� J�-�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      {      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�34�4���LL��̃�
ىy�ffqIQbI~��Q�����g���{�k����e@FN�QdU������E`�i^`P�O�kPTX�R��{a�[P�wb&�!���4� 420��54�5�T0��2��21Ib����� !-�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      |      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�34�4���LL��̃�
ىy�ffqIQbI~��Q����J�_R���f��[h����oTe���EPvU�QIA�E�[F�~Zx�oI�{�iZXh�y��!���4� 420��54�5�T0��2��25Ib����� ��.\      �      x������ � �      �      x������ � �            x������ � �            x������ � �      
      x������ � �            x������ � �      	      x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �            x������ � �            x������ � �             x������ � �      �      x������ � �      }      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�34�4���LL��̃�
ىy�ffqIQbI~��Q����Jzb�E��a�_E�S�K��Sb�q��SU���Obh�^T�A��k�_DX�Wj��ex���3�!���4� 420��54�5�T0��20�2� Ib����� K�-�            x������ � �            x������ � �      &      x������ � �      %      x������ � �      $      x������ � �      '      x������ � �      #      x������ � �      "      x������ � �      !      x������ � �             x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �      ~      x������ � �      �      x������ � �            x������ � �            x������ � �            x������ � �         �   x�34�4���LL��̃�
ىy�ffqIQbI~��Q�������q�Ky��OzHdIQ`U�^v�o��a���G�YVP^�Ay�y���YvUYq@xf�OI8�!���4� 420��54�5�T0��20�26Ib����� ��.�      0      x������ � �      /      x������ � �      @      x������ � �      ?      x������ � �      >      x������ � �      A      x������ � �      =      x������ � �      <      x������ � �      ;      x������ � �      :      x������ � �      9      x������ � �      8      x������ � �      7      x������ � �      .      x������ � �      -      x������ � �      ,      x������ � �      (      x������ � �      *      x������ � �      6      x������ � �      5      x������ � �      4      x������ � �      3      x������ � �            x������ � �      �      x������ � �      2      x������ � �      1      x������ � �      +      x������ � �      )   �   x�34�����LL��̃�
ىy�ffqIQbI~��Q����JFrJdD^~y��s�K��gV��gxiI�c^�w�iIEPhfiU�g�yF�cdfR��wDN.�!���4� 420��54�5�T0��20�2;�0W� ��/E      J   6   x�34��44�,+S(K��420��54�5�T0��20�21 �b������� ��h      I   9   x�34��4�,++���!020��54�5�T0��20�22�44�*������ ��P      Z   B   x�34���44�L�i��$�-ut�,-�̬LM9M�
�C'ggW� 9 l      Y      x������ � �      X      x������ � �      [      x������ � �      W      x������ � �      V      x������ � �      U      x������ � �      T      x������ � �      S      x������ � �      R      x������ � �      Q      x������ � �      H      x������ � �      G      x������ � �      F      x������ � �      B      x������ � �      D      x������ � �      P      x������ � �      O      x������ � �      N      x������ � �      M      x������ � �      �      x������ � �      �      x������ � �      L      x������ � �      K      x������ � �      E   <   x�34���44�44��420��54�5���CA�Hr
��VfV�����X�c��b���� z
      C   �   x�m��
�@E�o�[�'ƌ;A� ʐ
���L��I�|}�� \.�l.Š�ـ67���]u��j�C��{>|B�X�F��3�[���ޟ^�J+w��a9g����0�L�4�Vǒ��b`$�<R	c�r:�p�a�W#%ȓ�?�&B|eN2�      9      x������ � �      ;      x������ � �      =      x������ � �      ?      x������ � �      A      x������ � �      C      x������ � �      E      x������ � �      G      x������ � �      I      x������ � �      K      x������ � �      M      x������ � �      O      x������ � �      Q      x������ � �      S      x������ � �      U      x������ � �      W      x������ � �      Y      x������ � �      [      x������ � �      ]      x������ � �      _      x������ � �      a      x������ � �      c      x������ � �      w      x������ � �      e      x������ � �      g      x������ � �      i      x������ � �      k      x������ � �      �   I  x���_o�0 ���S�0�����d�&uS7�=L{q���t*���hI7\)�/���q>�� #dL�`��bc�n�mc썾+͂� x �
�1�cT��ݒ!5B��Ef<-	
�"����l���wBP'/�f?�A�)lT6�j�m<߬�8��rϑ����s$9J׺-��`�X�:���5�iss��}]D&]n���f�.�B7E6�fN{S�MgM��O���r=a{���\��wV�`�����_p/f�Ζ����0p���ƿ88����������f���
}Ug��'�3��;N���~���}�!+@���ע�e������w�r�Уj��"OY�J�;�Ҳ���k��t���.;:�+�5�P5��t�K_:?�o�����'~{��֗ӳC�b=�jE�{��<��"`|�<F31;��>���)�(s5��I���'}@�Z��!�e8�~�����AX!�ɡ��Tl�y�)�����L���`����`��.}u�/9��"�v!�[�� ��ђ�眳BJ�T��e��
�-i����-P�c�cP�������r���x5      �   �  x�}��n�0�竧��U齴~�9I�:I��E���ԑ*�"�N��w+�f�R�E���}�R����b����w/)���篇�_~/a��"L�!�:�t���+����l�$lv߱����Q{�����͑��|q�n{a�������Ҷ���Y���e�0}�m�͉�iպ�����$��A�	�A$�bh��`$��8���گ�'�Ӏ.�7�����������Fo$z��ه4�>��c�����-��b��S��U��J*@X5E�ˈ���ɧ$�����p��F��p�T*d�4*d��ش됦�FZ�JU@���3H��ܪ��,]����@��w"[�/]�t �*����N�QۥQt�*mt�>�{�b��Vm!�������Li�b�UǤ�3X-��noW��_?�����0��2�Sf��#�@�QM���&�VMo�ř�����+-��F���c�əv��i�_�u�5      �   �   x�}��
�@ �ϯ��Uy���M�-B���f�����W~@�a�!PT]}�n
g�V?�X�~�NA�7a�%K~h�a�l�+ɮ��NO��Y^�$��=���<�q)Z	\�R�<�U(R�Q��3���A�u�<���Ff�g���0��b�{�V#w�� J�4�     