const express=require('express')
const app=express()

app.get('/',(req,res)=> res.send('Hola desde Udemy'))
app.listen(3000, ()=> console.log('Servidor iniciado'))