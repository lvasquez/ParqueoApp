using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.Management;
using System.Web.Mvc;
using WebApp.Domain;

namespace WebApp.Web.Controllers
{
    public class VehiculoController : Controller
    {
        // Url Servicio Rest
        Uri baseAddress = new Uri("http://localhost:52397/api");
        private readonly HttpClient _httpClient;

        public VehiculoController()
        {
            _httpClient = new HttpClient();
            _httpClient.BaseAddress = baseAddress;
        }

        // GET: Vehiculo
        public ActionResult Index()
        {
            IList<VEHICULO> list = new List<VEHICULO>();
            HttpResponseMessage response = _httpClient.GetAsync(_httpClient.BaseAddress + "/Vehiculo").Result;

            if (response.IsSuccessStatusCode)
            { 
                string data = response.Content.ReadAsStringAsync().Result;
                list = JsonConvert.DeserializeObject<List<VEHICULO>>(data);
            }

            return View(list);
        }

        // GET: Vehiculo/Create
        public ActionResult Ingreso()
        {
            return View();
        }

        // POST: Vehiculo/Create
        [HttpPost]
        public ActionResult Ingreso(FormCollection form)
        {
            try
            {
                var vehiculo = new VEHICULO();
                vehiculo.placa = form["placa"];
                vehiculo.oficial = Convert.ToBoolean(form["oficial"]);
                string data = JsonConvert.SerializeObject(vehiculo);
                StringContent content = new StringContent(data, Encoding.UTF8, "application/json");
                HttpResponseMessage response = _httpClient.PostAsync(_httpClient.BaseAddress + "/Vehiculo", content).Result;

                if (response.IsSuccessStatusCode)
                {
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                TempData["errorMessage"] = ex.Message;
                return View();
            }
            return View();
        }

        public JsonResult GetVehiculoInfo(string placa)
        {
            if (string.IsNullOrWhiteSpace(placa))
            {
                var data = new { tarifa = "0" };
                return Json(data, JsonRequestBehavior.AllowGet);
            }
            else
            {
                var datos = new VEHICULO();
                HttpResponseMessage response = _httpClient.GetAsync(_httpClient.BaseAddress + "/Vehiculo/" + placa).Result;
                if (response.IsSuccessStatusCode)
                {

                    string data = response.Content.ReadAsStringAsync().Result;
                    datos = JsonConvert.DeserializeObject<VEHICULO>(data);
                    return Json(datos, JsonRequestBehavior.AllowGet);
                }

                return Json(response.Content, JsonRequestBehavior.AllowGet);

            }
           
        }


        public ActionResult Salida()
        {
            return View();
        }

        // POST: Vehiculo/Edit/5
        [HttpPost]
        public ActionResult Salida(FormCollection form)
        {
            try
            {
                var vehiculo = new VEHICULO();
                vehiculo.placa = form["placa"];
                vehiculo.tarifa = Convert.ToDouble(form["tarifa"]);
                string data = JsonConvert.SerializeObject(vehiculo);
                StringContent content = new StringContent(data, Encoding.UTF8, "application/json");
                HttpResponseMessage response = _httpClient.PutAsync(_httpClient.BaseAddress + "/Vehiculo", content).Result;

                if (response.IsSuccessStatusCode)
                {
                    TempData["sucessMessage"] = "Salida Actualizada";
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                TempData["errorMessage"] = ex.Message;
                return View();
            }
            return View();
        }

      
    }
}
