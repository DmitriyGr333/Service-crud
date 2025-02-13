PGDMP      	            
    |         	   servicedb    16.3    16.3 f    .           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            /           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            0           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            1           1262    24867 	   servicedb    DATABASE     }   CREATE DATABASE servicedb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE servicedb;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            2           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    24868    attached_product    TABLE     s   CREATE TABLE public.attached_product (
    main_product integer NOT NULL,
    attached_product integer NOT NULL
);
 $   DROP TABLE public.attached_product;
       public         heap    postgres    false    4            �            1259    24871    client    TABLE     W  CREATE TABLE public.client (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    patronymic character varying(50),
    birthday date,
    registration_date timestamp without time zone,
    email character varying(255),
    phone character varying(20),
    photo bytea,
    gender integer
);
    DROP TABLE public.client;
       public         heap    postgres    false    4            �            1259    24876    client_id_seq    SEQUENCE     �   CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.client_id_seq;
       public          postgres    false    4    216            3           0    0    client_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;
          public          postgres    false    217            �            1259    24877    client_service    TABLE     �   CREATE TABLE public.client_service (
    id integer NOT NULL,
    start_date date,
    comment text,
    client integer,
    service integer
);
 "   DROP TABLE public.client_service;
       public         heap    postgres    false    4            �            1259    24882    client_service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.client_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.client_service_id_seq;
       public          postgres    false    4    218            4           0    0    client_service_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.client_service_id_seq OWNED BY public.client_service.id;
          public          postgres    false    219            �            1259    24883    document_by_service    TABLE     y   CREATE TABLE public.document_by_service (
    id integer NOT NULL,
    document_path text,
    client_service integer
);
 '   DROP TABLE public.document_by_service;
       public         heap    postgres    false    4            �            1259    24888    document_by_service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.document_by_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.document_by_service_id_seq;
       public          postgres    false    220    4            5           0    0    document_by_service_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.document_by_service_id_seq OWNED BY public.document_by_service.id;
          public          postgres    false    221            �            1259    24889    gender    TABLE     X   CREATE TABLE public.gender (
    id integer NOT NULL,
    name character varying(10)
);
    DROP TABLE public.gender;
       public         heap    postgres    false    4            �            1259    24892    gender_id_seq    SEQUENCE     �   CREATE SEQUENCE public.gender_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.gender_id_seq;
       public          postgres    false    222    4            6           0    0    gender_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.gender_id_seq OWNED BY public.gender.id;
          public          postgres    false    223            �            1259    24893    manufacturer    TABLE     s   CREATE TABLE public.manufacturer (
    id integer NOT NULL,
    name character varying(100),
    startdate date
);
     DROP TABLE public.manufacturer;
       public         heap    postgres    false    4            �            1259    24896    manufacturer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.manufacturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.manufacturer_id_seq;
       public          postgres    false    224    4            7           0    0    manufacturer_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.manufacturer_id_seq OWNED BY public.manufacturer.id;
          public          postgres    false    225            �            1259    24897    product    TABLE     �   CREATE TABLE public.product (
    id integer NOT NULL,
    title character varying(100),
    cost numeric(19,2),
    description text,
    main_image_path bytea,
    is_active boolean,
    manufacturer integer
);
    DROP TABLE public.product;
       public         heap    postgres    false    4            �            1259    24902    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    226    4            8           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    227            �            1259    24903    product_photo    TABLE     e   CREATE TABLE public.product_photo (
    id integer NOT NULL,
    photo bytea,
    product integer
);
 !   DROP TABLE public.product_photo;
       public         heap    postgres    false    4            �            1259    24908    product_photo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.product_photo_id_seq;
       public          postgres    false    4    228            9           0    0    product_photo_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.product_photo_id_seq OWNED BY public.product_photo.id;
          public          postgres    false    229            �            1259    24909    product_sale    TABLE     �   CREATE TABLE public.product_sale (
    id integer NOT NULL,
    sale_date timestamp without time zone,
    quantity integer,
    service integer,
    client_service integer,
    product integer
);
     DROP TABLE public.product_sale;
       public         heap    postgres    false    4            �            1259    24912    product_sale_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_sale_id_seq;
       public          postgres    false    230    4            :           0    0    product_sale_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_sale_id_seq OWNED BY public.product_sale.id;
          public          postgres    false    231            �            1259    24913    service    TABLE     �   CREATE TABLE public.service (
    id integer NOT NULL,
    title character varying(100),
    cost numeric(19,4),
    duration_in_second integer,
    description text,
    discount integer,
    image bytea
);
    DROP TABLE public.service;
       public         heap    postgres    false    4            �            1259    24918    service_id_seq    SEQUENCE     �   CREATE SEQUENCE public.service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.service_id_seq;
       public          postgres    false    4    232            ;           0    0    service_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.service_id_seq OWNED BY public.service.id;
          public          postgres    false    233            �            1259    24919    service_photo    TABLE     e   CREATE TABLE public.service_photo (
    id integer NOT NULL,
    photo bytea,
    service integer
);
 !   DROP TABLE public.service_photo;
       public         heap    postgres    false    4            �            1259    24924    service_photo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.service_photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.service_photo_id_seq;
       public          postgres    false    4    234            <           0    0    service_photo_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.service_photo_id_seq OWNED BY public.service_photo.id;
          public          postgres    false    235            �            1259    24925    tag    TABLE     v   CREATE TABLE public.tag (
    id integer NOT NULL,
    title character varying(30),
    color character varying(6)
);
    DROP TABLE public.tag;
       public         heap    postgres    false    4            �            1259    24928 
   tag_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.tag_id_seq;
       public          postgres    false    236    4            =           0    0 
   tag_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;
          public          postgres    false    237            �            1259    24929    tag_of_client    TABLE     K   CREATE TABLE public.tag_of_client (
    client integer,
    tag integer
);
 !   DROP TABLE public.tag_of_client;
       public         heap    postgres    false    4            T           2604    24932 	   client id    DEFAULT     f   ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);
 8   ALTER TABLE public.client ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216            U           2604    24933    client_service id    DEFAULT     v   ALTER TABLE ONLY public.client_service ALTER COLUMN id SET DEFAULT nextval('public.client_service_id_seq'::regclass);
 @   ALTER TABLE public.client_service ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            V           2604    24934    document_by_service id    DEFAULT     �   ALTER TABLE ONLY public.document_by_service ALTER COLUMN id SET DEFAULT nextval('public.document_by_service_id_seq'::regclass);
 E   ALTER TABLE public.document_by_service ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220            W           2604    24935 	   gender id    DEFAULT     f   ALTER TABLE ONLY public.gender ALTER COLUMN id SET DEFAULT nextval('public.gender_id_seq'::regclass);
 8   ALTER TABLE public.gender ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222            X           2604    24936    manufacturer id    DEFAULT     r   ALTER TABLE ONLY public.manufacturer ALTER COLUMN id SET DEFAULT nextval('public.manufacturer_id_seq'::regclass);
 >   ALTER TABLE public.manufacturer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            Y           2604    24937 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226            Z           2604    24938    product_photo id    DEFAULT     t   ALTER TABLE ONLY public.product_photo ALTER COLUMN id SET DEFAULT nextval('public.product_photo_id_seq'::regclass);
 ?   ALTER TABLE public.product_photo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228            [           2604    24939    product_sale id    DEFAULT     r   ALTER TABLE ONLY public.product_sale ALTER COLUMN id SET DEFAULT nextval('public.product_sale_id_seq'::regclass);
 >   ALTER TABLE public.product_sale ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230            \           2604    24940 
   service id    DEFAULT     h   ALTER TABLE ONLY public.service ALTER COLUMN id SET DEFAULT nextval('public.service_id_seq'::regclass);
 9   ALTER TABLE public.service ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232            ]           2604    24941    service_photo id    DEFAULT     t   ALTER TABLE ONLY public.service_photo ALTER COLUMN id SET DEFAULT nextval('public.service_photo_id_seq'::regclass);
 ?   ALTER TABLE public.service_photo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234            ^           2604    24942    tag id    DEFAULT     `   ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);
 5   ALTER TABLE public.tag ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236                      0    24868    attached_product 
   TABLE DATA           J   COPY public.attached_product (main_product, attached_product) FROM stdin;
    public          postgres    false    215   �t                 0    24871    client 
   TABLE DATA           �   COPY public.client (id, first_name, last_name, patronymic, birthday, registration_date, email, phone, photo, gender) FROM stdin;
    public          postgres    false    216   u                 0    24877    client_service 
   TABLE DATA           R   COPY public.client_service (id, start_date, comment, client, service) FROM stdin;
    public          postgres    false    218   "u                 0    24883    document_by_service 
   TABLE DATA           P   COPY public.document_by_service (id, document_path, client_service) FROM stdin;
    public          postgres    false    220   ?u                 0    24889    gender 
   TABLE DATA           *   COPY public.gender (id, name) FROM stdin;
    public          postgres    false    222   \u                 0    24893    manufacturer 
   TABLE DATA           ;   COPY public.manufacturer (id, name, startdate) FROM stdin;
    public          postgres    false    224   yu                 0    24897    product 
   TABLE DATA           i   COPY public.product (id, title, cost, description, main_image_path, is_active, manufacturer) FROM stdin;
    public          postgres    false    226   �w       !          0    24903    product_photo 
   TABLE DATA           ;   COPY public.product_photo (id, photo, product) FROM stdin;
    public          postgres    false    228   �       #          0    24909    product_sale 
   TABLE DATA           a   COPY public.product_sale (id, sale_date, quantity, service, client_service, product) FROM stdin;
    public          postgres    false    230   �       %          0    24913    service 
   TABLE DATA           d   COPY public.service (id, title, cost, duration_in_second, description, discount, image) FROM stdin;
    public          postgres    false    232   �       '          0    24919    service_photo 
   TABLE DATA           ;   COPY public.service_photo (id, photo, service) FROM stdin;
    public          postgres    false    234   �       )          0    24925    tag 
   TABLE DATA           /   COPY public.tag (id, title, color) FROM stdin;
    public          postgres    false    236   ,�       +          0    24929    tag_of_client 
   TABLE DATA           4   COPY public.tag_of_client (client, tag) FROM stdin;
    public          postgres    false    238   I�       >           0    0    client_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.client_id_seq', 1, false);
          public          postgres    false    217            ?           0    0    client_service_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.client_service_id_seq', 1, false);
          public          postgres    false    219            @           0    0    document_by_service_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.document_by_service_id_seq', 1, false);
          public          postgres    false    221            A           0    0    gender_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.gender_id_seq', 1, false);
          public          postgres    false    223            B           0    0    manufacturer_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.manufacturer_id_seq', 252, true);
          public          postgres    false    225            C           0    0    product_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.product_id_seq', 325, true);
          public          postgres    false    227            D           0    0    product_photo_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.product_photo_id_seq', 1, false);
          public          postgres    false    229            E           0    0    product_sale_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.product_sale_id_seq', 214, true);
          public          postgres    false    231            F           0    0    service_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.service_id_seq', 1, false);
          public          postgres    false    233            G           0    0    service_photo_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.service_photo_id_seq', 1, false);
          public          postgres    false    235            H           0    0 
   tag_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.tag_id_seq', 1, false);
          public          postgres    false    237            `           2606    24952 &   attached_product attached_product_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.attached_product
    ADD CONSTRAINT attached_product_pkey PRIMARY KEY (main_product, attached_product);
 P   ALTER TABLE ONLY public.attached_product DROP CONSTRAINT attached_product_pkey;
       public            postgres    false    215    215            b           2606    24954    client client_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    216            d           2606    24956 "   client_service client_service_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.client_service
    ADD CONSTRAINT client_service_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.client_service DROP CONSTRAINT client_service_pkey;
       public            postgres    false    218            f           2606    24958 ,   document_by_service document_by_service_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.document_by_service
    ADD CONSTRAINT document_by_service_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.document_by_service DROP CONSTRAINT document_by_service_pkey;
       public            postgres    false    220            h           2606    24960    gender gender_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.gender
    ADD CONSTRAINT gender_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.gender DROP CONSTRAINT gender_pkey;
       public            postgres    false    222            j           2606    24962    manufacturer manufacturer_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.manufacturer
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.manufacturer DROP CONSTRAINT manufacturer_pkey;
       public            postgres    false    224            n           2606    24964     product_photo product_photo_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.product_photo
    ADD CONSTRAINT product_photo_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.product_photo DROP CONSTRAINT product_photo_pkey;
       public            postgres    false    228            l           2606    24966    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    226            p           2606    24968    product_sale product_sale_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_sale
    ADD CONSTRAINT product_sale_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_sale DROP CONSTRAINT product_sale_pkey;
       public            postgres    false    230            t           2606    24970     service_photo service_photo_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.service_photo
    ADD CONSTRAINT service_photo_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.service_photo DROP CONSTRAINT service_photo_pkey;
       public            postgres    false    234            r           2606    24972    service service_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.service DROP CONSTRAINT service_pkey;
       public            postgres    false    232            v           2606    24974    tag tag_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_pkey;
       public            postgres    false    236            y           2606    24975    client client_gender_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_gender_fkey FOREIGN KEY (gender) REFERENCES public.gender(id);
 C   ALTER TABLE ONLY public.client DROP CONSTRAINT client_gender_fkey;
       public          postgres    false    216    222    4712            z           2606    24980 )   client_service client_service_client_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_service
    ADD CONSTRAINT client_service_client_fkey FOREIGN KEY (client) REFERENCES public.client(id);
 S   ALTER TABLE ONLY public.client_service DROP CONSTRAINT client_service_client_fkey;
       public          postgres    false    4706    216    218            {           2606    24985 *   client_service client_service_service_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.client_service
    ADD CONSTRAINT client_service_service_fkey FOREIGN KEY (service) REFERENCES public.service(id);
 T   ALTER TABLE ONLY public.client_service DROP CONSTRAINT client_service_service_fkey;
       public          postgres    false    4722    232    218            |           2606    24990 ;   document_by_service document_by_service_client_service_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.document_by_service
    ADD CONSTRAINT document_by_service_client_service_fkey FOREIGN KEY (client_service) REFERENCES public.client_service(id);
 e   ALTER TABLE ONLY public.document_by_service DROP CONSTRAINT document_by_service_client_service_fkey;
       public          postgres    false    4708    220    218            w           2606    24995 $   attached_product fk_attached_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.attached_product
    ADD CONSTRAINT fk_attached_product FOREIGN KEY (attached_product) REFERENCES public.product(id);
 N   ALTER TABLE ONLY public.attached_product DROP CONSTRAINT fk_attached_product;
       public          postgres    false    215    226    4716            x           2606    25000     attached_product fk_main_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.attached_product
    ADD CONSTRAINT fk_main_product FOREIGN KEY (main_product) REFERENCES public.product(id);
 J   ALTER TABLE ONLY public.attached_product DROP CONSTRAINT fk_main_product;
       public          postgres    false    226    4716    215            }           2606    25005 !   product product_manufacturer_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_manufacturer_fkey FOREIGN KEY (manufacturer) REFERENCES public.manufacturer(id);
 K   ALTER TABLE ONLY public.product DROP CONSTRAINT product_manufacturer_fkey;
       public          postgres    false    226    224    4714            ~           2606    25010 (   product_photo product_photo_product_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_photo
    ADD CONSTRAINT product_photo_product_fkey FOREIGN KEY (product) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_photo DROP CONSTRAINT product_photo_product_fkey;
       public          postgres    false    226    228    4716                       2606    25015 -   product_sale product_sale_client_service_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_sale
    ADD CONSTRAINT product_sale_client_service_fkey FOREIGN KEY (client_service) REFERENCES public.client_service(id);
 W   ALTER TABLE ONLY public.product_sale DROP CONSTRAINT product_sale_client_service_fkey;
       public          postgres    false    230    4708    218            �           2606    25020 &   product_sale product_sale_product_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_sale
    ADD CONSTRAINT product_sale_product_fkey FOREIGN KEY (product) REFERENCES public.product(id);
 P   ALTER TABLE ONLY public.product_sale DROP CONSTRAINT product_sale_product_fkey;
       public          postgres    false    226    230    4716            �           2606    25025 &   product_sale product_sale_service_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_sale
    ADD CONSTRAINT product_sale_service_fkey FOREIGN KEY (service) REFERENCES public.service(id);
 P   ALTER TABLE ONLY public.product_sale DROP CONSTRAINT product_sale_service_fkey;
       public          postgres    false    4722    230    232            �           2606    25030 (   service_photo service_photo_service_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_photo
    ADD CONSTRAINT service_photo_service_fkey FOREIGN KEY (service) REFERENCES public.service(id);
 R   ALTER TABLE ONLY public.service_photo DROP CONSTRAINT service_photo_service_fkey;
       public          postgres    false    4722    232    234            �           2606    25035 '   tag_of_client tag_of_client_client_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tag_of_client
    ADD CONSTRAINT tag_of_client_client_fkey FOREIGN KEY (client) REFERENCES public.client(id);
 Q   ALTER TABLE ONLY public.tag_of_client DROP CONSTRAINT tag_of_client_client_fkey;
       public          postgres    false    238    216    4706            �           2606    25040 $   tag_of_client tag_of_client_tag_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.tag_of_client
    ADD CONSTRAINT tag_of_client_tag_fkey FOREIGN KEY (tag) REFERENCES public.tag(id);
 N   ALTER TABLE ONLY public.tag_of_client DROP CONSTRAINT tag_of_client_tag_fkey;
       public          postgres    false    4726    236    238                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �         l  x�MSKn�0]�O���O��b8�a�1�@�n�v�bKI@���F=R�%uE��3�>CF8�>�w`��%aF�4��\�P�B<��n�҂Q@����<ʦՍEÀ�����P�����3�`��z���0H�p
O��J�I@�Q������Rd��}��L�`o� �;}�����H���N=��u���0`1^ث�-G�H���)S�F�^<`�(u�_V��,��1dgt�,�r����&֞jp��ì�
i~�J�����BumR��HT8��Bw}=J�=cp|CM�?A��ݣ^]��T�boz�L>{0���n�(s����Og�]î����[�c	&ѕ�ԏ�4�Bv�lw�g���'�-[{(tZ9��j.��4x�F�n�8�e٢��䛫᰹�����N�d/���_�?.�������::/"��#8v�n�Up�cx|^�����u���a��<�����Ͼ�tA����y�lA�u[�/E����\R�a�'5�G\����e[d�g��g
�]�^s�EO�=�j뛈`-i���i�[Gc��|ϊ�3'N�H �������H�/�����zX��y(V��;.7^v4�c��W=�$�����?>��         �  x����r����S���u�� 9�XA �Ky3#U ���-�,�ʮ$U�.;�첓3�%��0x������H%�F��_��"���̯������2��/X�>�|��˯X�u6^�Gل�(b�'=Ɲ���	�ϣ��E�=�	n�B��te11'�bO�F.kܚ»���Q��8n���:"�t�^�){���x��5���(�&�x�ͳ);�٣�|+���DTX]$�����v<�O�Lki8B,
J
J6��_��S&�6�pƵ�� `E!!,�_f������Y6MRi�}bu`�۸ i�B��`/}�͘`Nk�T�k\��.�$��~7a��Yk���d��Ú�j<���8�/q��%�#K	�	�9d�v;��h�cBD@$������t�:�Xz�J�����gL"�ZB`J��j��t6����,��ӓ���ʚ����a��磳��_N�Pr�f�e�L*�}�ݣ���8u���x�<e�����<J�"�p��8��ӓ5HOX��l��	��(�\��b<~�Xo2��N<8{a�*��K�
���M��!k-�tB��&�Yz>�X����2�w�B�*�큐*�E����<��bԀ� :����b@��y�n54~��2�%44*��Τ�7H�����2W�W,�e���-d����x�C~��[�;���ç]2��U���JХ�tmr!��%�H������ ��DD\�X�R:|����A�	�`�7��n���"�\UV&\�O'C�kjY��+��n1`���T��Y�[�n�w���"����+�,����_��{��->�"�o��S����S i&L��:�����%%!�Lؾ��wL	��E@�	�»�V�xp�KX���J��ʯ$��h]�j{������RQ� �	�Vr2����Z�s@V�^$V�U�k�0����QP*A��8�-QژP�q]���@ovB���� �+ �Si]� ��^��@5���/|�lb�κ�!-��V�P�q���Π�\/�89F�0���H��W�q�U�' �З�q��H+�s�"@�[V��z�����m���J��@���d���%{���vO���Նy��m[pˮo��5@k��~8r
��f��an���:T>C��D��m�߰a^�mK��M��8��t�?2�B`ìx0�0u۸��'�����@�1��\]w��F�*]�������%���g��v4͞���B�4�������hq�Z��!n��m����(�%��*�^��^�j��Ud���4=K�1���]-w9�Qx���P�<ht�MRS"O�V&y[k��)S�Q�Ь�Z��b���N;�ac�&���s.V���X���z��B["�0����}������ֺ�Q�#���ﴈI��M3�,��DF��r�qy�-���iw�b:�������=)8�Ԑ
c'�ܩ�G���S:�ƫ��Iz����6���)���aĮSJˣ/9[<�֦:��A���x4�3�Ɖ׺#��b�rw*`	���|QC���O��ZEO��_���M�Y���3?[3ř(2���&�����B=0_�)�b^��һ�+�n���J�b^j�Q�uHP�?tU��0)���r�x8��|�����-ʖF�}�P��v��wԺ��W�������c���;���/�D�uUe�f��o�l�Tz��\[1iIG'_�����n�MԢT.�>�Ub�gi��Ơ�*�$��G��X~�!���'W�S����B���_�_~g����'c�����{�h��4yѡ�������x���K9To���G��B��a��\Y���,����GKt�i�P�x��j�[�r�x�>���(��v3��K�r�NQ���̚DVHN⣧T���ħ�'ba�I��S�FP���W���g
2��Ѣ����z��H�      !      x������ � �      #     x�m�ݱ�0���V�l�_I��T���ȑ��Ɍ� �q@���8>$�7��t��ϟ��i/�vj�?Bo�����th���������hFj�<˼���·����w���b����Q�(C�W��Sl%gh��d3K���h��g>'��c�إ�����j��˹D�Fg��\��W>�P�wg�Y/��U8��|��8�����̫^vH���Rjtju7pVNoțP�z�������?3pV-u�C�j�Y-�����w��g�U���e-PS�<�p֞��uw+����L�j*���ۇ�{�!�����(}�z��������V����s[>�+�Φ��g>�98[�����wp6�9��~������gM��u&88[��Ȫ�Y��6��e�c�w�-��kF���Y�=�|αG_4p��sF�a�^���9�|�j��o�u���'�gO?ϻ��\sg��1��sj��[z���Z������U6p��uok֚6p��q��8˪�;87�>�~F�:;87.��/jvpn���g�����tׂx�M�|��Y��>5^����=�A�����Z�t̙��j��3g[�W��-�A9gB�����f�ޡ��w����y�õ��;g>�z�r��%k�����箻�y�:��y�s��sFE��=9���W���{�gZ��1�8�^�1����o��{y�8��Ӈ��΃r&�gջ8Ι��\��'�y�ܠ��ë�����h�E���r��-�:�G������#�Lg�9����<=F׽���<���_�Ѐ���x����9(}k��wP	����ZxՀsH�v+>T�H?�;�38��>=߯��)�sxٵ��q�9n��ɰ�|�9r�������1R�z��������z�����]/��KP�0Cs۟i확4u>˵f������8�e�|�١�]:w-�g5hZj��P�ӡ��^�ɇk>��J�����m������|���F�[T��9}����Ug��1�|w�,p��7d����Μsc�;�c����ϯ���]n�}      %      x������ � �      '      x������ � �      )      x������ � �      +      x������ � �     