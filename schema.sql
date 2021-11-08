
    create table Asociaciones (
        id bigint generated by default as identity (start with 1),
        nombre varchar(255),
        direccion varchar(255),
        latitud double not null,
        longitud double not null,
        primary key (id)
    )

    create table CaracteristicasDefinidas (
        tipo varchar(31) not null,
        id bigint generated by default as identity (start with 1),
        nombre varchar(255),
        valor varchar(255),
        publicacionMascotaEnAdopcionId bigint,
        publicacionIntencionDeAdopcionComodidad_Id bigint,
        publicacionIntencionDeAdopcionCaracteristica_Id bigint,
        mascota_id bigint,
        primary key (id)
    )

    create table CaracteristicasIdeales (
        id bigint not null,
        esObligatoria boolean,
        nombre varchar(255),
        tipoCaracteristica_id bigint,
        primary key (id)
    )

    create table ComodidadesIdeales (
        id bigint not null,
        esObligatoria boolean,
        nombre varchar(255),
        tipoCaracteristica_id bigint,
        preguntaAdoptante varchar(255),
        preguntaDuenio varchar(255),
        AsociacionId bigint,
        primary key (id)
    )

    create table EnumeradaIdeal_opciones (
        EnumeradaIdeal_id bigint not null,
        opciones varchar(255)
    )

    create table HogaresDeTransito (
        id bigint generated by default as identity (start with 1),
        Capacidad integer not null,
        lugaresDisponibles integer not null,
        nombre varchar(255),
        telefono varchar(255),
        tienePatio boolean,
        direccion varchar(255),
        latitud double not null,
        longitud double not null,
        primary key (id)
    )

    create table HogaresDeTransito_animalesAdmitidos (
        HogarDeTransito_id bigint not null,
        animalesAdmitidos integer
    )

    create table HogaresDeTransito_conductasAdmitidas (
        HogarDeTransito_id bigint not null,
        conductasAdmitidas varchar(255)
    )

    create table Mascotas (
        id bigint generated by default as identity (start with 1),
        apodo varchar(255),
        descripcionFisica varchar(255),
        edad integer not null,
        id_mascota varchar(255),
        nombre varchar(255),
        sexo integer,
        tamanio integer,
        tipoAnimal integer,
        DuenioId bigint,
        primary key (id)
    )

    create table Mascotas_fotos (
        Mascota_id bigint not null,
        fotos varchar(255)
    )

    create table PublicacionesIntencionDeAdopcion (
        id bigint generated by default as identity (start with 1),
        linkDeBaja varchar(255),
        sexoMascota integer,
        tamanioMascota integer,
        tipoAnimal integer,
        DuenioId bigint,
        AsociacionId bigint,
        primary key (id)
    )

    create table PublicacionesMascotaEnAdopcion (
        id bigint generated by default as identity (start with 1),
        numeroPublicacion varchar(255),
        mascotaId bigint,
        AsociacionId bigint,
        primary key (id)
    )

    create table RescateDeMascotaSinRegistrar (
        id bigint not null,
        descripcion varchar(255),
        fecha varbinary(255),
        direccion varchar(255),
        latitud double not null,
        longitud double not null,
        rescatista_id bigint,
        estadoDeAprobacion boolean not null,
        numeroIdentificatorio integer,
        tamanio integer,
        tipoAnimal integer,
        duenio_id bigint,
        caracteristicaDefinida_id bigint,
        AsociacionId bigint,
        primary key (id)
    )

    create table RescateDeMascota_fotos (
        RescateDeMascota_id bigint not null,
        fotos varchar(255)
    )

    create table RescatesDeMascotaRegistrada (
        id bigint not null,
        descripcion varchar(255),
        fecha varbinary(255),
        direccion varchar(255),
        latitud double not null,
        longitud double not null,
        rescatista_id bigint,
        mascota_id bigint,
        AsociacionId bigint,
        primary key (id)
    )

    create table Rescatista (
        id bigint generated by default as identity (start with 1),
        apellido varchar(255),
        direccion varchar(255),
        fecha_nacimiento varbinary(255),
        nombre varchar(255),
        tipo_documento integer,
        contactoPrincipal_id bigint,
        primary key (id)
    )

    create table TiposCaraacteritica (
        tipo varchar(31) not null,
        id bigint generated by default as identity (start with 1),
        primary key (id)
    )

    create table Usuario (
        id bigint generated by default as identity (start with 1),
        hash blob(255),
        salt blob(255),
        nombreUsuario varchar(255),
        primary key (id)
    )

    create table Validaciones (
        tipo varchar(31) not null,
        id bigint generated by default as identity (start with 1),
        nombre_archivo varchar(255),
        primary key (id)
    )

    create table Voluntarios (
        id bigint generated by default as identity (start with 1),
        Asociacion_id bigint,
        Usuario_Id bigint,
        primary key (id)
    )

    create table contacto (
        id bigint generated by default as identity (start with 1),
        apellido varchar(255),
        email varchar(255),
        nombre varchar(255),
        telefono integer,
        duenioId bigint,
        rescatistaId bigint,
        primary key (id)
    )

    create table duenio (
        id bigint generated by default as identity (start with 1),
        apellido varchar(255),
        documento double,
        fecha_nacimiento varbinary(255),
        nombre varchar(255),
        tipo_documento integer,
        direccion varchar(255),
        latitud double not null,
        longitud double not null,
        contactoPrincipal_id bigint,
        usuarioId bigint,
        primary key (id)
    )

    alter table CaracteristicasDefinidas 
        add constraint FK_1xsvk8u5jqidf420rjty5l7vr 
        foreign key (publicacionMascotaEnAdopcionId) 
        references PublicacionesMascotaEnAdopcion

    alter table CaracteristicasDefinidas 
        add constraint FK_6pjrlgn5diu5j5d5696s5yx6m 
        foreign key (publicacionIntencionDeAdopcionComodidad_Id) 
        references PublicacionesIntencionDeAdopcion

    alter table CaracteristicasDefinidas 
        add constraint FK_655dt7c2b3bbnwmgycyrxq7bd 
        foreign key (publicacionIntencionDeAdopcionCaracteristica_Id) 
        references PublicacionesIntencionDeAdopcion

    alter table CaracteristicasDefinidas 
        add constraint FK_i4a34pmjdqj9umueq4c01pqss 
        foreign key (mascota_id) 
        references Mascotas

    alter table CaracteristicasIdeales 
        add constraint FK_kpob7ncs99qf6a0h3ocvmt4vm 
        foreign key (tipoCaracteristica_id) 
        references TiposCaraacteritica

    alter table ComodidadesIdeales 
        add constraint FK_5ilbk04pw4r2punvxen39bue8 
        foreign key (AsociacionId) 
        references Asociaciones

    alter table ComodidadesIdeales 
        add constraint FK_1p19o4rxrdbupbw0ye9r61pi2 
        foreign key (tipoCaracteristica_id) 
        references TiposCaraacteritica

    alter table EnumeradaIdeal_opciones 
        add constraint FK_7lycml39jvd1ru1hw61ajfk8k 
        foreign key (EnumeradaIdeal_id) 
        references TiposCaraacteritica

    alter table HogaresDeTransito_animalesAdmitidos 
        add constraint FK_jxh9x7e5mcm2j7bst6wer5ws0 
        foreign key (HogarDeTransito_id) 
        references HogaresDeTransito

    alter table HogaresDeTransito_conductasAdmitidas 
        add constraint FK_1tq0d86lqykflvpxvyatlfngd 
        foreign key (HogarDeTransito_id) 
        references HogaresDeTransito

    alter table Mascotas 
        add constraint FK_o82kvl6jgqgtecellcn51q1o 
        foreign key (DuenioId) 
        references duenio

    alter table Mascotas_fotos 
        add constraint FK_paae1tce8bxio4mvvirdgt7is 
        foreign key (Mascota_id) 
        references Mascotas

    alter table PublicacionesIntencionDeAdopcion 
        add constraint FK_sci0pax9207k1el8n4spf0xqy 
        foreign key (DuenioId) 
        references duenio

    alter table PublicacionesIntencionDeAdopcion 
        add constraint FK_9yxapmu4bdawn0tbwrm0elbg5 
        foreign key (AsociacionId) 
        references Asociaciones

    alter table PublicacionesMascotaEnAdopcion 
        add constraint FK_evusamvb7c9a69avbxvp9bodi 
        foreign key (mascotaId) 
        references Mascotas

    alter table PublicacionesMascotaEnAdopcion 
        add constraint FK_p0nf8j3ctfl3wdcb53l4sbe24 
        foreign key (AsociacionId) 
        references Asociaciones

    alter table RescateDeMascotaSinRegistrar 
        add constraint FK_3lps7l5xii2b29lh4xama3vjj 
        foreign key (duenio_id) 
        references duenio

    alter table RescateDeMascotaSinRegistrar 
        add constraint FK_s2x0k5na98251otytiiaxgyww 
        foreign key (caracteristicaDefinida_id) 
        references CaracteristicasDefinidas

    alter table RescateDeMascotaSinRegistrar 
        add constraint FK_3qfg7cyb3m8f9qyrxax0vkyjy 
        foreign key (AsociacionId) 
        references Asociaciones

    alter table RescateDeMascotaSinRegistrar 
        add constraint FK_lsnkbds3ugmd62k7mmvhdncf1 
        foreign key (rescatista_id) 
        references Rescatista

    alter table RescatesDeMascotaRegistrada 
        add constraint FK_a0u454iidd1wx7dxqi7ow5y76 
        foreign key (mascota_id) 
        references Mascotas

    alter table RescatesDeMascotaRegistrada 
        add constraint FK_ics2267cqwillkl66o7q7rfef 
        foreign key (AsociacionId) 
        references Asociaciones

    alter table RescatesDeMascotaRegistrada 
        add constraint FK_4utgekqx7mxudud81i2tofu5w 
        foreign key (rescatista_id) 
        references Rescatista

    alter table Rescatista 
        add constraint FK_a9ogt0ux9emt1fia6y6l4icfx 
        foreign key (contactoPrincipal_id) 
        references contacto

    alter table Voluntarios 
        add constraint FK_3ggopwnal369hchxrn5bfbbwm 
        foreign key (Asociacion_id) 
        references Asociaciones

    alter table Voluntarios 
        add constraint FK_e399do1igdkfmo8aqjdph5th2 
        foreign key (Usuario_Id) 
        references Usuario

    alter table contacto 
        add constraint FK_ruava120cqs11gxul97an2g5c 
        foreign key (duenioId) 
        references duenio

    alter table contacto 
        add constraint FK_odj5b4yqkjek8cuk0pbcs3hhv 
        foreign key (rescatistaId) 
        references Rescatista

    alter table duenio 
        add constraint FK_eulo1elbe5cvp5dvf9pk6vhkf 
        foreign key (contactoPrincipal_id) 
        references contacto

    alter table duenio 
        add constraint FK_owu8gniehh19poog05lte4l6y 
        foreign key (usuarioId) 
        references Usuario

    create table hibernate_sequences (
         sequence_name varchar(255),
         sequence_next_hi_value integer 
    )
