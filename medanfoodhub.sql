PGDMP  8                    |            MedanFoodHub    16.4    16.4                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24814    MedanFoodHub    DATABASE     �   CREATE DATABASE "MedanFoodHub" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "MedanFoodHub";
                postgres    false            �            1259    24815    businessowner    TABLE     �  CREATE TABLE public.businessowner (
    id character varying(255) NOT NULL,
    identity_card character varying(255),
    taxpayer_number character varying(255),
    proof_ownership character varying(255),
    status character varying(20) DEFAULT 'in request'::character varying NOT NULL,
    CONSTRAINT businessowner_status_check CHECK (((status)::text = ANY (ARRAY[('approved'::character varying)::text, ('in request'::character varying)::text, ('rejected'::character varying)::text])))
);
 !   DROP TABLE public.businessowner;
       public         heap    postgres    false            �            1259    24822    restaurants    TABLE       CREATE TABLE public.restaurants (
    id character varying(255) NOT NULL,
    owner_id character varying(255),
    pictures character varying(255)[],
    restaurant_name character varying(255),
    descriptions text,
    categories character varying(255)
);
    DROP TABLE public.restaurants;
       public         heap    postgres    false            �            1259    24827    reviews    TABLE       CREATE TABLE public.reviews (
    id character varying(255) NOT NULL,
    restaurant_id character varying(255) NOT NULL,
    rating integer,
    review text,
    review_id integer NOT NULL,
    CONSTRAINT reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);
    DROP TABLE public.reviews;
       public         heap    postgres    false            �            1259    24833    reviews_review_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.reviews_review_id_seq;
       public          postgres    false    217                       0    0    reviews_review_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews.review_id;
          public          postgres    false    218            �            1259    24834    users    TABLE     _  CREATE TABLE public.users (
    uid character varying(255) NOT NULL,
    profile_pic character varying(255),
    email character varying(255) NOT NULL,
    full_name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    bio text,
    phone character varying(15),
    is_owner boolean DEFAULT false,
    bookmarks jsonb
);
    DROP TABLE public.users;
       public         heap    postgres    false            ]           2604    24859    reviews review_id    DEFAULT     v   ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);
 @   ALTER TABLE public.reviews ALTER COLUMN review_id DROP DEFAULT;
       public          postgres    false    218    217            �          0    24815    businessowner 
   TABLE DATA           d   COPY public.businessowner (id, identity_card, taxpayer_number, proof_ownership, status) FROM stdin;
    public          postgres    false    215          �          0    24822    restaurants 
   TABLE DATA           h   COPY public.restaurants (id, owner_id, pictures, restaurant_name, descriptions, categories) FROM stdin;
    public          postgres    false    216   �       �          0    24827    reviews 
   TABLE DATA           O   COPY public.reviews (id, restaurant_id, rating, review, review_id) FROM stdin;
    public          postgres    false    217   �       �          0    24834    users 
   TABLE DATA           n   COPY public.users (uid, profile_pic, email, full_name, password, bio, phone, is_owner, bookmarks) FROM stdin;
    public          postgres    false    219   [                   0    0    reviews_review_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.reviews_review_id_seq', 21, true);
          public          postgres    false    218            d           2606    24863    reviews pk_review_id 
   CONSTRAINT     Y   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT pk_review_id PRIMARY KEY (review_id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT pk_review_id;
       public            postgres    false    217            f           2606    24844    users pk_uid 
   CONSTRAINT     K   ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_uid PRIMARY KEY (uid);
 6   ALTER TABLE ONLY public.users DROP CONSTRAINT pk_uid;
       public            postgres    false    219            b           2606    24846    restaurants restaurants_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.restaurants DROP CONSTRAINT restaurants_pkey;
       public            postgres    false    216            g           2606    24869    businessowner fk_id    FK CONSTRAINT     n   ALTER TABLE ONLY public.businessowner
    ADD CONSTRAINT fk_id FOREIGN KEY (id) REFERENCES public.users(uid);
 =   ALTER TABLE ONLY public.businessowner DROP CONSTRAINT fk_id;
       public          postgres    false    219    215    4710            h           2606    24864    restaurants fk_owner_id    FK CONSTRAINT     x   ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT fk_owner_id FOREIGN KEY (owner_id) REFERENCES public.users(uid);
 A   ALTER TABLE ONLY public.restaurants DROP CONSTRAINT fk_owner_id;
       public          postgres    false    216    4710    219            i           2606    24849    reviews fk_user_id    FK CONSTRAINT     m   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_user_id FOREIGN KEY (id) REFERENCES public.users(uid);
 <   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_user_id;
       public          postgres    false    4710    217    219            �   �   x��α
�0���>����m�6�QD�� ��&7�IM�o/��C�~��'LU&˪�B ��J�r�Uy�b>��}�W �|,Z�6�X�;��ܰz�w����(�rƒ��Ñ$���rX�y�Ȓ�eȁ���wp���~wR��V�C�_�O#�E29��U����Mw_�6sG�@���qEo]]�k      �   �  x���͎[7��㧘'(�?QZ�]t�覛l(�B���"��_z�wƆ��`�>�ϔy.u����j�Ȍ�B�u��9z�b2�zD]Ą]M+?|���x���~{:>�ϟ��}>>n��g|}:H�!��>���h1��Uz��;P|�~�_��zZ��k�lMH�a��%`}����E���S<�逵�b���Q!��7w����]��D�	s M�B5�l&[&* ������UG�RHj#V9؃M,����Z\�:I��{���k�@آو���߫��.�]o�Æ��j��Z�@�ԆTH�O����@
H�7�[���y�ui2t�����Fo�(�����ef�n��ȝ�������r��`݁�TMC�c��!y�>�d~�ܮ��1�o���~�vȹ����0;JҎҼi�P�\v��mN7z���d��ө��h��~��~ &7z��Y"͓����T�Gʕ��=����9Þ��������T�����ٸ��(_��OdO����v	F�������W�a /���T��9���v	�9ffa�%<�x�2�d���=&���ݵKp��\D>C�����f��뾊?��}���9�dta��:���˓�
��R�Z�)m*סmDH19���Y]h�K�kq�T[��ew5����)�K6�^�\�3�/iR�W��Si5��j��,�T3Z�(��Y�X=�mPy����|k�<k`���3�=�i�c��m����f_:px��kC�j��=��@߁{�k��m�J�5�՗�`�u�)��v������Θ�u�2���"a�+�X8����6��FoWV�k^֠�"\�2kf�����ms��o10�k�i�w�̟�"r>�&|���Crw�j61��#��74dG�#;<g� �4]�s�}��p8����      �   �   x���;n�0�Z>L ~��K�I!H�{�ػH�΍
�!�0�&h��QP2"��4U�����,�I�K��V�$<<�a$�?o��
���|��Óܻ��Ndm�1��/����e��^}��*�d�����lZ�e������+<���O�ޣC�d	c�3��0q���S��m�\��|���.����8��-�/      �   �  x���A�1���_1x��$UI%�܃��.�W�C%��=�C�����M{�6 �
�W�U�ˉM��G�.3D_�Fb�Q��^ϗ�}����y-�����S?���ݮ�p���y������:g�C�U
O��\>��^�:�����!_�E�|~�%�֋,�'ƍ��qv����I��S2Q;+��&�3k���y�e~����q|8����t�U��}�h�]Ʒi%`�R"%Sa�v�O����qA;aW�#D���h�8��*2>J�	�+;rƔM�v���'I5��&*�u���RȱR��h�&$Ǟ�T���5\�H�1�bY����A'�a��#Wl�#��,�Y6�}i���?S�`=�{�ރ��Qq9�?�>lo�~�n��v�BDn����RW��Խ���Qs��     