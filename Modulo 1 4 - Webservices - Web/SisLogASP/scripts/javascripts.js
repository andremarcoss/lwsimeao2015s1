<script language="JavaScript">
	 function mascara(t, mask){
		 var i = t.value.length;
		 var saida = mask.substring(1,0);
		 var texto = mask.substring(i)
		 if (texto.substring(0,1) != saida){
		 t.value += texto.substring(0,1);
		 }
	}
 </script>
 
 /*
 <body>
 <form name="cadatro">
 <table width="500px" align="center">
 <tr>
 <td width="100px">
 <b>CEP.:</b>
 </td>
 <td>
 <input type="text" name="cep" onkeypress="mascara(this, '#####-###')" maxlength="9">
 </td>
 </tr>
 <tr>
 <td>
 <b>Tel Resid.:</b>
 </td>
 <td>
 <input type="text" name="telefone" onkeypress="mascara(this, '## ####-####')" maxlength="12">
 </td>
 </tr>
 <tr>
 <td>
 <b>Tel Celular.:</b>
 </td>
 <td>
 <input type="text" name="celular" onkeypress="mascara(this, '## #####-####')" maxlength="13">
 </td>
 </tr>
 <tr>
 <td colspan="2">
 <input type="submit" value="Enviar">
 <input type="reset" value="Limpar">
 </td>
 </tr>
 </table>
 </form>
 </body>

 
 */