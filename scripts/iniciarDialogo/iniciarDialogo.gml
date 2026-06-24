function iniciarDialogo(){ 
    var emDialogo = global.emDialogo;
    
    if (!emDialogo && permiteIniciarDialogo) {
        //var dialogo = instance_create_layer(x, y, "Main", objDialogo);
        instance_create_depth(x, y,  -99999, objDialogo, {nomeNPC: nome, texto: texto});
        
        global.emDialogo = true
    }
}