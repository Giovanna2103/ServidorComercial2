select u.* from tbusuario u 
inner join tbcliente cl 
on u.idusuario = cl.idusuario 
inner join tbcontato co 
on cl.idcontato = co.idcontato 
where 
(u.nomeusuario="" or cl.cpf="" or co.email="") and u.senha="";