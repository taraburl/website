use sea

create table [dbo].[tbl_tipoPago](
idTipoPago int primary key  not null,
nombre varchar(50)
)

create table [dbo].[tbl_estadoCompra](
	idEstadoCompra int primary key identity(1,1) not null,
	nombre varchar(30)
)

create table [dbo].[tbl_ordenCompra](
	idOrdenCompra int primary key identity(1,1) not null,
	idEstadoCompra int not null,
	idTipoPago int not null,
	idUsuario int not null,
	
	foreign key (idEstadoCompra) references [dbo].[tbl_estadoCompra] (idEstadoCompra),
	foreign key (idTipoPago) references [dbo].[tbl_tipoPago](idTipoPago),
	foreign key (idUsuario) references tbl_usuarios(id)
)




create table [dbo].[tbl_estadoCarrito](
	idEstadoCarrito int primary key identity(1,1) not null,
	nombre varchar(30)
	

)

create table [dbo].[tbl_carrito](
	idCarrito int primary key identity(1,1) not null,
	idEstadoCarrito int not null,
	idOrdenCompra int not null,

	foreign key (idOrdenCompra) references [dbo].[tbl_ordenCompra](idOrdenCompra),
	foreign key (idEstadoCarrito) REFERENCES [dbo].[tbl_estadoCarrito] (idEstadoCarrito)

)

alter table [dbo].[tbl_carrito] 
add idProducto int not null

alter table [dbo].[tbl_carrito] 
add foreign key (idProducto) references tbl_producto(id)

alter table [dbo].[tbl_carrito]
add cantidadProducto int

