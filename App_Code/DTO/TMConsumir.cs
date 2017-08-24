using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;

using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;


public class TMConsumir
{

    #region Atributos
    private string mensaje, llaveidentificacion, llaveencriptacion, tipoSolicitarPago;
        
    #endregion

    #region Propiedades
    public string Pmensaje { get { return mensaje;} set { mensaje = value; } }
    public string PllaveIdentificacion {get {return llaveidentificacion;} set { llaveidentificacion = value;} }
    public string PllaveEncriptacion { get { return llaveencriptacion ;} set { llaveencriptacion = value; } }
    public string PtipoSolicitarpago { get { return tipoSolicitarPago;} set { tipoSolicitarPago = value; } }
    #endregion

    public TMConsumir()
    {
        Pmensaje = "pv_nroDocumento=SCIS;pv_linea=SnlineaS;pv_monto=SmontoS;pv_orderId=SnorderidS;pv_nombre=SnombreS;pv_confirmacion=SncomercioS;pv_notificacion= Codigo: ScodnotiS;pv_urlCorrecto=SurlcorrectoS;pv_urlError=SurlerrorS;pv_items=SitemsfacturaS;pv_razonSocial=SrazonsocialfacturaS;pv_nit=SnitfacturaS";
        //PllaveIdentificacion = "f7d422ce2505df508978c51efac395c850b63e81d17f7941db788887b33160d7aa6b974b1254b7b33237a0057b12a5dd47d4ce0fe3cd102a655c204100c881fd";
        // PllaveEncriptacion = "FQKQJZ6EGKQ63VWP0LH2EE1T";

        PllaveIdentificacion = "f401408244902997aa56fb8c6e44a47f4d028a48f8524c938434c70addb6728dc1d7375575390ae2321b549cfc46cbc2e538dda4cdc15453df1b639b1dc577c5";
        PllaveEncriptacion = "9J1OJXI6QRM39WXA8GQQOQH2";
    }

    public string realizarPago(

        string pv_orderId, //(String[20], Requerido)

        string pv_monto, //(Double, Requerido)  - los decimales se manejan con "." usamos la "," como separador en la cadena
            
        string pv_linea, //(Integer[8], Requerido)

        byte metodoPago = 0,

        string pv_urlCorrecto = "https://www.google.com", //(String[100], Requerido)
            
        string pv_urlError = "https://www.youtube.com", //(String[200], Requerido)

        //Con Facturacion

        string pv_nit = "", //(String[20], Opcional valor por defecto = “”)
            
        string pv_razonSocial = "",//(String[40], Opcional, Valor por defecto=””)
            
        string pv_items = "",//(Opcional, Valor por defecto=””)
            
        string pv_notificacion = "",//(String[20], Opcional, Valor por defecto=””)
            
        string pv_confirmacion = "",//(String[20], Opcional, Valor por defecto = ””)
            
        string pv_nombre = "",//(String[100], Opcional, Valor por defecto = “”)
            
        string pv_mensaje = "",//(String[100], Opcional, Valor por defecto = “” )
            
        string pv_nroDocumento = ""//(String[10], Opcional, Valor por defecto = ””)
            
        )
    {

        CustomerServicesReference.CustomerServicesClient  objProxy = new CustomerServicesReference.CustomerServicesClient();
        ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(ValidateServerCertificate);

        //pv_nroDocumento = "SCIS";
        //pv_linea = "SnlineaS";
        //pv_monto = "SmontoS";
        //pv_orderId = "SnorderidS";
        //pv_nombre = "SnombreS";
        //pv_confirmacion = "SncomercioS";
        //pv_notificacion = "Codigo: ScodnotiS";
        //pv_urlCorrecto = "SurlcorrectoS";
        //pv_urlError="SurlerrorS";
        //pv_items="SitemsfacturaS";
        //pv_razonSocial = "SrazonsocialfacturaS";
        //pv_nit = "SnitfacturaS";

        // Sin Facturacion por Terceros

        this.mensaje = this.mensaje.Replace("SnorderidS",pv_orderId);
        this.mensaje = this.mensaje.Replace("SmontoS",pv_monto);
        this.mensaje = this.mensaje.Replace("SnlineaS", pv_linea);
        this.mensaje = this.mensaje.Replace("SurlcorrectoS",pv_urlCorrecto);
        this.mensaje = this.mensaje.Replace("SurlerrorS", pv_urlError);
            
        // Con Facturacion por Terceros

        this.mensaje = this.mensaje.Replace("SnitfacturaS",pv_nit);
        this.mensaje = this.mensaje.Replace("SrazonsocialfacturaS", pv_razonSocial);
        this.mensaje = this.mensaje.Replace("SitemsfacturaS",pv_items);
        this.mensaje = this.mensaje.Replace("ScodnotiS",pv_notificacion);
        this.mensaje = this.mensaje.Replace("SncomercioS", pv_confirmacion);
        this.mensaje = this.mensaje.Replace("SCIS", pv_nroDocumento);
        this.mensaje = this.mensaje.Replace("SnombreS", pv_nombre);
            
        this.mensaje = Encryption.Encrypt(this.mensaje,this.llaveencriptacion);

        string respuesta = "";

        if (metodoPago == 0)
        {
            respuesta = objProxy.solicitarPago(this.llaveidentificacion, this.mensaje);
        }
        else
        {
            respuesta = objProxy.solicitarPagoAsincrono(this.llaveidentificacion,this.mensaje);
        }

        respuesta = Encryption.Decrypt(respuesta,this.llaveencriptacion);

        return respuesta;
    }

    public string consultarEstado(string nrOrden)
    {
        CustomerServicesReference.CustomerServicesClient objProxy = new CustomerServicesReference.CustomerServicesClient();
        ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(ValidateServerCertificate);
        string respuesta = objProxy.consultarEstado(this.llaveidentificacion, Encryption.Encrypt(nrOrden, this.llaveencriptacion));
        respuesta = Encryption.Decrypt(respuesta,this.llaveencriptacion);
        return respuesta;
    }

    public static bool ValidateServerCertificate(Object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
    {
        return true;
    }
}

public class TMRespuesta
{
    public string codRes { get; set; }
    public string mensaje { get; set; }
    public string orderId { get; set; }
    public string motivo { get; set; }

    public string msjLargoMotivo { get; set; }
    public string msjCortoMotivo { get; set; }

    public string transaccion { get; set; }
    public string nroFactura { get; set; }
    public string nroAutorizacion { get; set; }
    public string codigoControl { get; set; }

    public bool exito { get; set; }
    public string resultado { get; set; }


    public TMRespuesta(string strRespuesta)
    {
        strRespuesta = strRespuesta.Replace("\0", string.Empty);
        this.resultado = strRespuesta;
        string[] segmentos = strRespuesta.Split('&');
        if (strRespuesta.Contains(";"))
        {// para consulta de estados
            string[] segmentosOtros = strRespuesta.Split(';');
            this.codRes = segmentosOtros[0];
            if (segmentosOtros.Length > 2 && segmentosOtros.Last().Contains("&"))
            {
                segmentos = segmentosOtros.Last().Split('&');
            }
            else
            {
                segmentos = segmentosOtros;
            }
        }
        else
        {
            this.codRes = GetAtributo(segmentos, "codRes");
        }

        this.mensaje = GetAtributo(segmentos, "mensaje");
        this.orderId = GetAtributo(segmentos, "orderId");
        this.motivo = GetAtributo(segmentos, "motivo");
        this.transaccion = GetAtributo(segmentos, "transaccion");
        this.nroFactura = GetAtributo(segmentos, "nroFactura");
        this.nroAutorizacion = GetAtributo(segmentos, "nroAutorizacion");
        this.codigoControl = GetAtributo(segmentos, "codigoControl");


        SetMotivoDescripcion();

        this.exito = this.codRes == "0";
    }


    private static string GetAtributo(string[] segmentos, string key)
    {
        var value = (from x in segmentos
                     where x.Contains(key)
                     select x).FirstOrDefault();
        if (value != null)
        {
            string[] values = value.Split('=');
            if (values.Length == 2 )
            {
                return values[1];
            }
        }
        return "";
    }
    
    private void SetMotivoDescripcion()
    {
        switch (this.motivo)
        {
            case "4":
                {
                    this.msjCortoMotivo = "AGENT_NOT_REGISTERED";
                    this.msjLargoMotivo = "Comercio no Habilitado para el pago con Tigo Money.";
                }
                break;
            case "7":
                {
                    this.msjCortoMotivo = "ACCESS_DENIED";
                    this.msjLargoMotivo = "Acceso denegado por favor intenta nuevamente verificando los datos ingresados.";
                }
                break;
            case "8":
                {
                    this.msjCortoMotivo = "BAD_PASSWORD";
                    this.msjLargoMotivo = "El PIN ingresado es inválido, si olvidaste tu pin, llama al *555 o contáctate con soporte directamente desde la App Tigo Money, si tu saldo es mayor a Bs 313, debes pasar por una oficina Tigo con tu carnet.";
                }
                break;
            case "11":
                {
                    this.msjCortoMotivo = "PASSWORD_RETRY_EXCEED";
                    this.msjLargoMotivo = "Tiempo agotado, por favor inicia nuevamente la transaccion.";
                }
                break;
            case "14":
                {
                    this.msjCortoMotivo = "TARGET_NOT_REGISTERED";
                    this.msjLargoMotivo = "Cuenta no habilitada con Tigo Money, regístrate marcando *555# o descarga la App Tigo Money a tu celular. Mas info llama al *555, o contáctate con soporte directamente desde la App Tigo Money.";
                }
                break;
            case "17":
                {
                    this.msjCortoMotivo = "INVALID_AMOUNT";
                    this.msjLargoMotivo = "El monto solicitado no es válido. Verifica los datos ingresados.";
                }
                break;
            case "19":
                {
                    this.msjCortoMotivo = "AGENT_BLACKLISTED";
                    this.msjLargoMotivo = "Comercio no Habilitado para el pago con Tigo Money.";
                }
                break;
            case "16":
                {
                    this.msjCortoMotivo = "TARGET_SUSPENDED";
                    this.msjLargoMotivo = "Cuenta Tigo Money suspendida, por favor comunícate al *555, o contáctate con soporte directamente desde la App Tigo Money.";
                }
                break;
            case "23":
                {
                    this.msjCortoMotivo = "AMOUNT_TOO_SMALL";
                    this.msjLargoMotivo = "El monto solicitado es inferior al requerido, por favor verifica los datos ingresados.";
                }
                break;
            case "24":
                {
                    this.msjCortoMotivo = "AMOUNT_TOO_BIG";
                    this.msjLargoMotivo = "El monto solicitado es superior al requerido, por favor verifica los datos ingresados.";
                }
                break;
            case "1001":
                {
                    this.msjCortoMotivo = "Insufficientfunds";
                    this.msjLargoMotivo = "Tu saldo es insuficiente para completar la transaccion, carga tu cuenta desde la web de tu banco, desde un cajero Tigo Money ó desde un Punto más cercano a ti, marcando *555# o ingresando a la App Tigo Money.";
                }
                break;
            case "1002":
                {
                    this.msjCortoMotivo = "TransactionRecovered";
                    this.msjLargoMotivo = "Ingresa a Completa tu transaccion desde la App Tigo Money o marcando *555#, Si olvidaste tu PIN, llama al *555, o contáctate con soporte directamente desde la App Tigo Money. Si tu saldo es mayor a Bs 313, debes pasar por un of. Tigo con tu carnet.";
                }
                break;
            case "1004":
                {
                    this.msjCortoMotivo = "WalletCapExceeded";
                    this.msjLargoMotivo = "Estimado cliente, llegaste al límite maximo para realizar transacciones, para consultas por favor llama al *555, o contáctate con soporte directamente desde la App Tigo Money. También puedes pasar por una Of. Tigo con tu Carnet.";
                }
                break;
            case "1012":
                {
                    this.msjCortoMotivo = "Passworderrorretryexceeded";
                    this.msjLargoMotivo = "Estimado Cliente excediste el límite de intentos para introducir tu PIN, por favor comunícate con el *555 para solicitar nuevo PIN, o contáctate con soporte directamente desde la App Tigo Money, si tu saldo es mayor a Bs 313, debes pasar por una of. Tigo con tu Carnet.";
                }
                break;
            case "560":
                {
                    this.msjCortoMotivo = "Mismo Monto, Origen y Destino dentro de 1 min";
                    this.msjLargoMotivo = "Mismo Monto, Origen y Destino dentro de 1 min";
                }
                break;
            case "9999":
                {
                    this.msjCortoMotivo = "no puede llegar a utiba";
                    this.msjLargoMotivo = "no puede llegar a utiba";
                }
                break;
            case "39":
                {
                    this.msjCortoMotivo = "TargetStoped";
                    this.msjLargoMotivo = "TargetStoped";
                }
                break;
            default:
                this.msjCortoMotivo = "";
                this.msjLargoMotivo = "";
                break;
        }
    }

}
