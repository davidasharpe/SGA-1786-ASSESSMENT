using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace PopeyeMarinaWebApp
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ConvertButton_Click(object sender, EventArgs e)
        {
            localhost.LocalWeather wsConvert = new localhost.LocalWeather();
            double temperature =
                System.Convert.ToDouble(TemperatureTextbox.Text);
            FahrenheitLabel.Text = wsConvert.FahrenheitToCelsius(temperature).ToString();
            CelsiusLabel.Text =  wsConvert.CelsiusToFahrenheit(temperature).ToString();
        }
    }
}




