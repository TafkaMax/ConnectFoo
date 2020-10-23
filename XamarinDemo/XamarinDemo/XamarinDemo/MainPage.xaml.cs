using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace XamarinDemo
{
    public partial class MainPage : ContentPage
    {
        private int _counter = 0;

        public int Counter
        {
            get { return _counter; }
            set
            {
                // value is default value for righthand side of exp
                // Counter = 55 is actually Counter.set(value:55)
                _counter = value;
                //notify binding system, that we have a new value
                OnPropertyChanged(nameof(Counter));
            }
        }


        public MainPage()
        {
            InitializeComponent();
        }

        void AddButtonClicked(System.Object sender, System.EventArgs e)
        {
            _counter++;
        }
    }
}
