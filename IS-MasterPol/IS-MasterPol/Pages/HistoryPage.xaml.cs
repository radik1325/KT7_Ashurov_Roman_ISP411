using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace IS_MasterPol.Pages
{
    /// <summary>
    /// Логика взаимодействия для HistoryPage.xaml
    /// </summary>
    public partial class HistoryPage : Page
    {
        public int Id;
        public HistoryPage( Data.Partners idPartner)
        {
            InitializeComponent();
            string df = idPartner.PartnerId.ToString();
            Id = Convert.ToInt32(df);
            Init();
        }
        private void Init()
        {
            GridHistory.ItemsSource = Data.MasterPolDataEntities.GetContext().PartnerProduct.Where(d => d.PartnerProductPartnerId == Id).ToList();
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ViewPartnerPage());
        }
    }
}
