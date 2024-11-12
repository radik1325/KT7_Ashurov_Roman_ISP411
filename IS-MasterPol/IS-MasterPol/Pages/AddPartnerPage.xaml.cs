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
    /// Логика взаимодействия для AddPartnerPage.xaml
    /// </summary>
    public partial class AddPartnerPage : Page
    {
        public static Data.Partners _CurrrentPartner = new Data.Partners();
        public string FlagAddorEdit;
        public AddPartnerPage(Data.Partners _EditPartner)
        {
            if(_EditPartner == null)
            {
                FlagAddorEdit = "Add";
            }
            else
            {
                FlagAddorEdit = "Edit";
                _CurrrentPartner = _EditPartner;
            }
            DataContext = _CurrrentPartner;
            InitializeComponent();
            Init();
            
        }
        private void Init()
        {
            TypePartnerBox.ItemsSource = Data.MasterPolDataEntities.GetContext().TypePartners.ToList();
            if(FlagAddorEdit == "Add")
            {
                NamePartnerbox.Text = "";
                TypePartnerBox.SelectedIndex = -1;
                RatingPartnerbox.Text = "";
                DirectorPartnerbox.Text = "";
                PhonePartnerbox.Text = "";
                emailPartnerbox.Text = "";
                AdressPartnerBox.Text = "";
            }
            if (FlagAddorEdit == "Edit")
            {
                NamePartnerbox.Text = _CurrrentPartner.PartnerName;
                TypePartnerBox.SelectedIndex = (_CurrrentPartner.PartnerTypeId-1);
                RatingPartnerbox.Text = _CurrrentPartner.PartnerRating;
                DirectorPartnerbox.Text = _CurrrentPartner.DirectorPartners.DirectorPartnersName;
                PhonePartnerbox.Text = _CurrrentPartner.PartnerPhone;
                emailPartnerbox.Text = _CurrrentPartner.PartnerEmail;
                string[] AdresConcat = new string[5];
                AdresConcat[0] = _CurrrentPartner.AdressPartners.AdressPartnerIndex;
                AdresConcat[1] = _CurrrentPartner.AdressPartners.Area.AreaName;
                AdresConcat[2] = _CurrrentPartner.AdressPartners.City.CityName;
                AdresConcat[3] = _CurrrentPartner.AdressPartners.Street.StreetName;
                AdresConcat[4] = _CurrrentPartner.AdressPartners.AdressPartnerIdHouse;
                var adress = String.Join(",", AdresConcat);
                AdressPartnerBox.Text = adress.ToString();
            }
        }

        private void SavePartner_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if(NamePartnerbox.Text == "")
            {
                errors.AppendLine("Введите наименование партнера");
            }
            if (TypePartnerBox.SelectedIndex == -1)
            {
                errors.AppendLine("Выберите тип партнера");
            }
            if (RatingPartnerbox.Text == "")
            {
                errors.AppendLine("Введите рейтинг");
            }
            if (DirectorPartnerbox.Text == "")
            {
                errors.AppendLine("Введите директора");
            }
            if (PhonePartnerbox.Text == "")
            {
                errors.AppendLine("Введите телефон");
            }
            if (emailPartnerbox.Text == "")
            {
                errors.AppendLine("Введите почту");
            }


            string[] adres = AdressPartnerBox.Text.Split(',');

            if (adres.Length < 5)
            {
                errors.AppendLine("Введите адрес правильно,пример: \r\n123456,Московская область,город Люберцы,улица вертолетная,18");
            }
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString(), "Errors", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            if(FlagAddorEdit == "Add")
            {
                _CurrrentPartner.PartnerName = NamePartnerbox.Text;
                _CurrrentPartner.PartnerPhone = PhonePartnerbox.Text;
                _CurrrentPartner.PartnerEmail = emailPartnerbox.Text;
                _CurrrentPartner.PartnerTypeId = (TypePartnerBox.SelectedIndex+1);
                _CurrrentPartner.PartnerRating = RatingPartnerbox.Text;
                if (Data.MasterPolDataEntities.GetContext().DirectorPartners.Any(d=> d.DirectorPartnersName == DirectorPartnerbox.Text))
                {
                    var searchDirector = Data.MasterPolDataEntities.GetContext().DirectorPartners.Where(d => d.DirectorPartnersName == DirectorPartnerbox.Text).FirstOrDefault();
                    _CurrrentPartner.PartnerDirectorId = searchDirector.DirectorPartnersId;
                }
                else
                {
                    _CurrrentPartner.PartnerDirectorId = Data.MasterPolDataEntities.GetContext().DirectorPartners.Max(d=> d.DirectorPartnersId+1);
                    Data.DirectorPartners NewDirector = new Data.DirectorPartners();
                    NewDirector.DirectorPartnersName = DirectorPartnerbox.Text;
                    Data.MasterPolDataEntities.GetContext().DirectorPartners.Add(NewDirector);
                    Data.MasterPolDataEntities.GetContext().SaveChanges();
                    
                }
                _CurrrentPartner.PartnerAdressId = 1;
                Data.MasterPolDataEntities.GetContext().Partners.Add(_CurrrentPartner);
                Data.MasterPolDataEntities.GetContext().SaveChanges();
            }
           
        }

        private void BAckButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ViewPartnerPage());
        }
    }
}
