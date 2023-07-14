PGDMP     ;    3                {            SITE    15.3    15.3 F    Q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            R           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            S           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            T           1262    16398    SITE    DATABASE     }   CREATE DATABASE "SITE" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "SITE";
                postgres    false            U           1247    16455    mood    TYPE     ;   CREATE TYPE public.mood AS ENUM (
    'Sim',
    'Não'
);
    DROP TYPE public.mood;
       public          postgres    false            m           1247    16791    moood    TYPE     C   CREATE TYPE public.moood AS ENUM (
    'on',
    'off',
    '1'
);
    DROP TYPE public.moood;
       public          postgres    false            �            1259    16709    anuncio    TABLE        CREATE TABLE public.anuncio (
    id integer NOT NULL,
    tipoanuncio character varying(100),
    descricao character(100)
);
    DROP TABLE public.anuncio;
       public         heap    postgres    false            �            1259    16708    anuncio_idanuncio_seq    SEQUENCE     �   CREATE SEQUENCE public.anuncio_idanuncio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.anuncio_idanuncio_seq;
       public          postgres    false    225            U           0    0    anuncio_idanuncio_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.anuncio_idanuncio_seq OWNED BY public.anuncio.id;
          public          postgres    false    224            �            1259    16642    bairro    TABLE     [   CREATE TABLE public.bairro (
    id integer NOT NULL,
    bairro character varying(100)
);
    DROP TABLE public.bairro;
       public         heap    postgres    false            �            1259    16641    bairro_idbairro_seq    SEQUENCE     �   CREATE SEQUENCE public.bairro_idbairro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.bairro_idbairro_seq;
       public          postgres    false    217            V           0    0    bairro_idbairro_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.bairro_idbairro_seq OWNED BY public.bairro.id;
          public          postgres    false    216            �            1259    16635    cidade    TABLE     [   CREATE TABLE public.cidade (
    id integer NOT NULL,
    cidade character varying(100)
);
    DROP TABLE public.cidade;
       public         heap    postgres    false            �            1259    16634    cidade_idcidade_seq    SEQUENCE     �   CREATE SEQUENCE public.cidade_idcidade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.cidade_idcidade_seq;
       public          postgres    false    215            W           0    0    cidade_idcidade_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.cidade_idcidade_seq OWNED BY public.cidade.id;
          public          postgres    false    214            �            1259    16656    endereco    TABLE     �   CREATE TABLE public.endereco (
    id integer NOT NULL,
    logradouro character varying(45),
    numero integer,
    cep character varying(9),
    cidade_id integer,
    bairro_id integer,
    estado_id integer,
    complemento text
);
    DROP TABLE public.endereco;
       public         heap    postgres    false            �            1259    16655    endereco_idendereco_seq    SEQUENCE     �   CREATE SEQUENCE public.endereco_idendereco_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.endereco_idendereco_seq;
       public          postgres    false    221            X           0    0    endereco_idendereco_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.endereco_idendereco_seq OWNED BY public.endereco.id;
          public          postgres    false    220            �            1259    16732    enderecoimoveis    TABLE     "  CREATE TABLE public.enderecoimoveis (
    id integer NOT NULL,
    logradouro character varying(45),
    numero integer,
    cep character varying(9),
    uf character varying(2),
    cidade character varying(45),
    bairro character varying(45),
    complemento character varying(100)
);
 #   DROP TABLE public.enderecoimoveis;
       public         heap    postgres    false            �            1259    16731    enderecoimoveis_id_seq    SEQUENCE     �   CREATE SEQUENCE public.enderecoimoveis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.enderecoimoveis_id_seq;
       public          postgres    false    227            Y           0    0    enderecoimoveis_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.enderecoimoveis_id_seq OWNED BY public.enderecoimoveis.id;
          public          postgres    false    226            �            1259    16649    estado    TABLE     [   CREATE TABLE public.estado (
    id integer NOT NULL,
    estado character varying(100)
);
    DROP TABLE public.estado;
       public         heap    postgres    false            �            1259    16648    estado_idestado_seq    SEQUENCE     �   CREATE SEQUENCE public.estado_idestado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.estado_idestado_seq;
       public          postgres    false    219            Z           0    0    estado_idestado_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.estado_idestado_seq OWNED BY public.estado.id;
          public          postgres    false    218            �            1259    24685    imagens    TABLE     h   CREATE TABLE public.imagens (
    id integer NOT NULL,
    imgimovel character varying(150) NOT NULL
);
    DROP TABLE public.imagens;
       public         heap    postgres    false            �            1259    16928    imovel    TABLE     I  CREATE TABLE public.imovel (
    id integer NOT NULL,
    tipoimovel character varying(45),
    valorimovel money,
    quantquarto character varying(45),
    quantgaragem character varying(45),
    garagemcoberta character varying(45),
    quantisuite character varying(45),
    quantobanheiro character varying(45),
    areaservico character varying(45),
    piscina character varying(45),
    internet character varying(45),
    mobiliado character varying(45),
    pet character varying(45),
    descricao character varying(45),
    usuario_id integer,
    enderecoim_id integer
);
    DROP TABLE public.imovel;
       public         heap    postgres    false            �            1259    16927    imovel_id_seq    SEQUENCE     �   CREATE SEQUENCE public.imovel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.imovel_id_seq;
       public          postgres    false    229            [           0    0    imovel_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.imovel_id_seq OWNED BY public.imovel.id;
          public          postgres    false    228            �            1259    16678    usuario    TABLE     �   CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(45),
    cpf character(11),
    tel character(11),
    email character varying(45),
    senha text,
    endereco_id integer
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    16677    usuario_idusuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.usuario_idusuario_seq;
       public          postgres    false    223            \           0    0    usuario_idusuario_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.usuario_idusuario_seq OWNED BY public.usuario.id;
          public          postgres    false    222            �           2604    16712 
   anuncio id    DEFAULT     o   ALTER TABLE ONLY public.anuncio ALTER COLUMN id SET DEFAULT nextval('public.anuncio_idanuncio_seq'::regclass);
 9   ALTER TABLE public.anuncio ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    16645 	   bairro id    DEFAULT     l   ALTER TABLE ONLY public.bairro ALTER COLUMN id SET DEFAULT nextval('public.bairro_idbairro_seq'::regclass);
 8   ALTER TABLE public.bairro ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    16638 	   cidade id    DEFAULT     l   ALTER TABLE ONLY public.cidade ALTER COLUMN id SET DEFAULT nextval('public.cidade_idcidade_seq'::regclass);
 8   ALTER TABLE public.cidade ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    16659    endereco id    DEFAULT     r   ALTER TABLE ONLY public.endereco ALTER COLUMN id SET DEFAULT nextval('public.endereco_idendereco_seq'::regclass);
 :   ALTER TABLE public.endereco ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    16735    enderecoimoveis id    DEFAULT     x   ALTER TABLE ONLY public.enderecoimoveis ALTER COLUMN id SET DEFAULT nextval('public.enderecoimoveis_id_seq'::regclass);
 A   ALTER TABLE public.enderecoimoveis ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            �           2604    16652 	   estado id    DEFAULT     l   ALTER TABLE ONLY public.estado ALTER COLUMN id SET DEFAULT nextval('public.estado_idestado_seq'::regclass);
 8   ALTER TABLE public.estado ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    16931 	   imovel id    DEFAULT     f   ALTER TABLE ONLY public.imovel ALTER COLUMN id SET DEFAULT nextval('public.imovel_id_seq'::regclass);
 8   ALTER TABLE public.imovel ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    16681 
   usuario id    DEFAULT     o   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_idusuario_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            I          0    16709    anuncio 
   TABLE DATA           =   COPY public.anuncio (id, tipoanuncio, descricao) FROM stdin;
    public          postgres    false    225   �N       A          0    16642    bairro 
   TABLE DATA           ,   COPY public.bairro (id, bairro) FROM stdin;
    public          postgres    false    217   �N       ?          0    16635    cidade 
   TABLE DATA           ,   COPY public.cidade (id, cidade) FROM stdin;
    public          postgres    false    215   �N       E          0    16656    endereco 
   TABLE DATA           m   COPY public.endereco (id, logradouro, numero, cep, cidade_id, bairro_id, estado_id, complemento) FROM stdin;
    public          postgres    false    221   4O       K          0    16732    enderecoimoveis 
   TABLE DATA           g   COPY public.enderecoimoveis (id, logradouro, numero, cep, uf, cidade, bairro, complemento) FROM stdin;
    public          postgres    false    227   P       C          0    16649    estado 
   TABLE DATA           ,   COPY public.estado (id, estado) FROM stdin;
    public          postgres    false    219   �P       N          0    24685    imagens 
   TABLE DATA           0   COPY public.imagens (id, imgimovel) FROM stdin;
    public          postgres    false    230   �P       M          0    16928    imovel 
   TABLE DATA           �   COPY public.imovel (id, tipoimovel, valorimovel, quantquarto, quantgaragem, garagemcoberta, quantisuite, quantobanheiro, areaservico, piscina, internet, mobiliado, pet, descricao, usuario_id, enderecoim_id) FROM stdin;
    public          postgres    false    229   �P       G          0    16678    usuario 
   TABLE DATA           P   COPY public.usuario (id, nome, cpf, tel, email, senha, endereco_id) FROM stdin;
    public          postgres    false    223   ,Q       ]           0    0    anuncio_idanuncio_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.anuncio_idanuncio_seq', 1, false);
          public          postgres    false    224            ^           0    0    bairro_idbairro_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.bairro_idbairro_seq', 9, true);
          public          postgres    false    216            _           0    0    cidade_idcidade_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.cidade_idcidade_seq', 9, true);
          public          postgres    false    214            `           0    0    endereco_idendereco_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.endereco_idendereco_seq', 9, true);
          public          postgres    false    220            a           0    0    enderecoimoveis_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.enderecoimoveis_id_seq', 28, true);
          public          postgres    false    226            b           0    0    estado_idestado_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.estado_idestado_seq', 7, true);
          public          postgres    false    218            c           0    0    imovel_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.imovel_id_seq', 7, true);
          public          postgres    false    228            d           0    0    usuario_idusuario_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.usuario_idusuario_seq', 24, true);
          public          postgres    false    222            �           2606    16714    anuncio anuncio_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.anuncio
    ADD CONSTRAINT anuncio_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.anuncio DROP CONSTRAINT anuncio_pkey;
       public            postgres    false    225            �           2606    16647    bairro bairro_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.bairro
    ADD CONSTRAINT bairro_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.bairro DROP CONSTRAINT bairro_pkey;
       public            postgres    false    217            �           2606    16640    cidade cidade_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.cidade DROP CONSTRAINT cidade_pkey;
       public            postgres    false    215            �           2606    16661    endereco endereco_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.endereco DROP CONSTRAINT endereco_pkey;
       public            postgres    false    221            �           2606    16737 $   enderecoimoveis enderecoimoveis_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.enderecoimoveis
    ADD CONSTRAINT enderecoimoveis_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.enderecoimoveis DROP CONSTRAINT enderecoimoveis_pkey;
       public            postgres    false    227            �           2606    16654    estado estado_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.estado DROP CONSTRAINT estado_pkey;
       public            postgres    false    219            �           2606    16935    imovel imovel_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.imovel
    ADD CONSTRAINT imovel_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.imovel DROP CONSTRAINT imovel_pkey;
       public            postgres    false    229            �           2606    16683    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    223            �           2606    16667     endereco endereco_bairro_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_bairro_id_fkey FOREIGN KEY (bairro_id) REFERENCES public.bairro(id);
 J   ALTER TABLE ONLY public.endereco DROP CONSTRAINT endereco_bairro_id_fkey;
       public          postgres    false    221    3229    217            �           2606    16662     endereco endereco_cidade_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_cidade_id_fkey FOREIGN KEY (cidade_id) REFERENCES public.cidade(id);
 J   ALTER TABLE ONLY public.endereco DROP CONSTRAINT endereco_cidade_id_fkey;
       public          postgres    false    221    3227    215            �           2606    16672     endereco endereco_estado_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES public.estado(id);
 J   ALTER TABLE ONLY public.endereco DROP CONSTRAINT endereco_estado_id_fkey;
       public          postgres    false    219    3231    221            �           2606    16941     imovel imovel_enderecoim_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.imovel
    ADD CONSTRAINT imovel_enderecoim_id_fkey FOREIGN KEY (enderecoim_id) REFERENCES public.enderecoimoveis(id);
 J   ALTER TABLE ONLY public.imovel DROP CONSTRAINT imovel_enderecoim_id_fkey;
       public          postgres    false    3239    229    227            �           2606    16936    imovel imovel_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.imovel
    ADD CONSTRAINT imovel_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);
 G   ALTER TABLE ONLY public.imovel DROP CONSTRAINT imovel_usuario_id_fkey;
       public          postgres    false    3235    229    223            �           2606    16684     usuario usuario_endereco_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_endereco_id_fkey FOREIGN KEY (endereco_id) REFERENCES public.endereco(id);
 J   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_endereco_id_fkey;
       public          postgres    false    221    3233    223            I      x������ � �      A   /   x�3���/K�I,�2����,s8˂381�$Q������.���� �@K      ?   %   x�3�����H,J-�2E0�Ls���D0c���� #��      E   �   x�]�=�@F��S�4��
���((�0!1Q�>�&����!��{��ĳRu�4Ŷ+�F05t�a�Y�hW��z���x�#A,H:�~ۿ��M_ �����et�	��,����_�16��ڕ�ēd7j�� Ù⚱�*���wc�{IL��F�k�ԫTUb��q��/�͵���'���}4`���EzC�-!�qQ�      K   i   x�34�*MT�*M-J�K�44�4��40346�t�����H,J-���/K�I,�tN,NTp�,�L)��2��@�%�z�)�kD�^
��R�׌�į����� ���      C      x�3�t�2& �D��s���� n0�      N      x������ � �      M   F   x�3�LN,N�RQ�40�300�10�4���\N#(���� ~qj�BJjq2g�q�Q�s*����� ��5Y      G   �   x�m��n�0���S�	�Ɖ��\���v�Pǂ�Z��s�I�4|��������b�O�W��C|Dm:�hl�w�F�jh��ꋟ}�]y�$�T7���P`���nY+�?�c�W��|"5�܎O�.8_����E��>@8Y�(%�#�ڒx%A�q`�>]�c����x7��e��po�4����jK�K�&y��y���OeQ��cH     