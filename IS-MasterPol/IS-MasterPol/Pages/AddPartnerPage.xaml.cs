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
            StringBuilder errors = new StringBuilder();
            errors.AppendLine("При добавлении/редактировании партнера,просьба вводить: ");
            errors.AppendLine(" 1)Фамилию Имя Отчество директора через пробел.");
            errors.AppendLine(" 2)Введите адрес с разделителем запятая,пример: \r\n123456,Московская область,город Люберцы,улица вертолетная,18");
            MessageBox.Show(errors.ToString(),"Важная информация",MessageBoxButton.OK,MessageBoxImage.Information);
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
            
           //Проверка рейтинга

            string[] adres = AdressPartnerBox.Text.Trim(' ').Split(',');

            if (adres.Length < 5)
            {
                errors.AppendLine("Введите адрес правильно,пример: \r\n123456,Московская область,город Люберцы,улица вертолетная,18");
            }
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString(), "Errors", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
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
                    NewDirector.DirectorPartnersId = Data.MasterPolDataEntities.GetContext().DirectorPartners.Max(d => d.DirectorPartnersId + 1);
                    NewDirector.DirectorPartnersName = DirectorPartnerbox.Text;
                    Data.MasterPolDataEntities.GetContext().DirectorPartners.Add(NewDirector);
                    Data.MasterPolDataEntities.GetContext().SaveChanges();
                    
                }

                string a0 = adres[0];
                string a = adres[1];
                string a1 = adres[2];
                string a2 = adres[3];
                string a3 = adres[4];

                if (Data.MasterPolDataEntities.GetContext().AdressPartners.Any(d => d.AdressPartnerIndex == a0
                && d.Area.AreaName == a && d.City.CityName == a1 && d.Street.StreetName == a2 && d.AdressPartnerIdHouse ==a3))
                {
                    var searchadress = Data.MasterPolDataEntities.GetContext().AdressPartners.Where(d => d.AdressPartnerIndex == a0
                    && d.Area.AreaName == a && d.City.CityName == a1 && d.Street.StreetName == a2 && d.AdressPartnerIdHouse == a3).FirstOrDefault();
                    _CurrrentPartner.PartnerAdressId = searchadress.AdressPartnerId;
                }

                else
                {
                    Data.AdressPartners _NewAdress = new Data.AdressPartners();


                    if (Data.MasterPolDataEntities.GetContext().Area.Any(d => d.AreaName == a))
                    {
                        var searchArea = Data.MasterPolDataEntities.GetContext().Area.Where(d => d.AreaName == a).FirstOrDefault();
                        _NewAdress.AdressPartnerIdArea = searchArea.AreaId;
                    }
                    else
                    {
                        _NewAdress.AdressPartnerIdArea = Data.MasterPolDataEntities.GetContext().Area.Max(d => d.AreaId + 1);
                        Data.Area NewArea = new Data.Area();
                        NewArea.AreaName = a;
                        Data.MasterPolDataEntities.GetContext().Area.Add(NewArea);
                        Data.MasterPolDataEntities.GetContext().SaveChanges();

                    }


                    if (Data.MasterPolDataEntities.GetContext().City.Any(d => d.CityName == a1))
                    {
                        var searchCity = Data.MasterPolDataEntities.GetContext().City.Where(d => d.CityName == a1).FirstOrDefault();
                        _NewAdress.AdressPartnerIdCity = searchCity.CityId;
                    }
                    else
                    {
                        _NewAdress.AdressPartnerIdCity = Data.MasterPolDataEntities.GetContext().City.Max(d => d.CityId + 1);
                        Data.City NewCity = new Data.City();
                        NewCity.CityName = a1;
                        Data.MasterPolDataEntities.GetContext().City.Add(NewCity);
                        Data.MasterPolDataEntities.GetContext().SaveChanges();

                    }


                    if (Data.MasterPolDataEntities.GetContext().Street.Any(d => d.StreetName == a2))
                    {
                        var searchStreet = Data.MasterPolDataEntities.GetContext().Street.Where(d => d.StreetName == a2).FirstOrDefault();
                        _NewAdress.AdressPartnerIdStreet = searchStreet.StreetId;
                    }
                    else
                    {
                        _NewAdress.AdressPartnerIdStreet = Data.MasterPolDataEntities.GetContext().Street.Max(d => d.StreetId + 1);
                        Data.Street NewStreet = new Data.Street();
                        NewStreet.StreetName = a2;
                        Data.MasterPolDataEntities.GetContext().Street.Add(NewStreet);
                        Data.MasterPolDataEntities.GetContext().SaveChanges();

                    }
                    _NewAdress.AdressPartnerIndex = a0;
                    _NewAdress.AdressPartnerIdHouse = a3;
                    Data.MasterPolDataEntities.GetContext().AdressPartners.Add(_NewAdress);
                    Data.MasterPolDataEntities.GetContext().SaveChanges();
                    _CurrrentPartner.PartnerAdressId = Data.MasterPolDataEntities.GetContext().AdressPartners.Max(d=>d.AdressPartnerId);
                }

                
                Data.MasterPolDataEntities.GetContext().Partners.Add(_CurrrentPartner);
                Data.MasterPolDataEntities.GetContext().SaveChanges();
                MessageBox.Show("Успешно сохранено", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            }

            if (FlagAddorEdit == "Edit")
            {
                _CurrrentPartner.PartnerName = NamePartnerbox.Text;
                _CurrrentPartner.PartnerPhone = PhonePartnerbox.Text;
                _CurrrentPartner.PartnerEmail = emailPartnerbox.Text;
                _CurrrentPartner.PartnerTypeId = (TypePartnerBox.SelectedIndex + 1);
                _CurrrentPartner.PartnerRating = RatingPartnerbox.Text;

                if (Data.MasterPolDataEntities.GetContext().DirectorPartners.Any(d => d.DirectorPartnersName == DirectorPartnerbox.Text))
                {
                    var searchDirector = Data.MasterPolDataEntities.GetContext().DirectorPartners.Where(d => d.DirectorPartnersName == DirectorPartnerbox.Text).FirstOrDefault();
                    _CurrrentPartner.PartnerDirectorId = searchDirector.DirectorPartnersId;
                }
                else
                {
                    _CurrrentPartner.PartnerDirectorId = Data.MasterPolDataEntities.GetContext().DirectorPartners.Max(d => d.DirectorPartnersId + 1);
                    Data.DirectorPartners NewDirector = new Data.DirectorPartners();
                    NewDirector.DirectorPartnersId = Data.MasterPolDataEntities.GetContext().DirectorPartners.Max(d => d.DirectorPartnersId + 1);
                    NewDirector.DirectorPartnersName = DirectorPartnerbox.Text;
                    Data.MasterPolDataEntities.GetContext().DirectorPartners.Add(NewDirector);
                    Data.MasterPolDataEntities.GetContext().SaveChanges();

                }

                string a0 = adres[0];
                string a = adres[1];
                string a1 = adres[2];
                string a2 = adres[3];
                string a3 = adres[4];

                if (Data.MasterPolDataEntities.GetContext().AdressPartners.Any(d => d.AdressPartnerIndex == a0
                && d.Area.AreaName == a && d.City.CityName == a1 && d.Street.StreetName == a2 && d.AdressPartnerIdHouse == a3))
                {
                    var searchadress = Data.MasterPolDataEntities.GetContext().AdressPartners.Where(d => d.AdressPartnerIndex == a0
                    && d.Area.AreaName == a && d.City.CityName == a1 && d.Street.StreetName == a2 && d.AdressPartnerIdHouse == a3).FirstOrDefault();
                    _CurrrentPartner.PartnerAdressId = searchadress.AdressPartnerId;
                }

                else
                {
                    Data.AdressPartners _NewAdress = new Data.AdressPartners();


                    if (Data.MasterPolDataEntities.GetContext().Area.Any(d => d.AreaName == a))
                    {
                        var searchArea = Data.MasterPolDataEntities.GetContext().Area.Where(d => d.AreaName == a).FirstOrDefault();
                        _NewAdress.AdressPartnerIdArea = searchArea.AreaId;
                    }
                    else
                    {
                        _NewAdress.AdressPartnerIdArea = Data.MasterPolDataEntities.GetContext().Area.Max(d => d.AreaId + 1);
                        Data.Area NewArea = new Data.Area();
                        NewArea.AreaName = a;
                        Data.MasterPolDataEntities.GetContext().Area.Add(NewArea);
                        Data.MasterPolDataEntities.GetContext().SaveChanges();

                    }


                    if (Data.MasterPolDataEntities.GetContext().City.Any(d => d.CityName == a1))
                    {
                        var searchCity = Data.MasterPolDataEntities.GetContext().City.Where(d => d.CityName == a1).FirstOrDefault();
                        _NewAdress.AdressPartnerIdCity = searchCity.CityId;
                    }
                    else
                    {
                        _NewAdress.AdressPartnerIdCity = Data.MasterPolDataEntities.GetContext().City.Max(d => d.CityId + 1);
                        Data.City NewCity = new Data.City();
                        NewCity.CityName = a1;
                        Data.MasterPolDataEntities.GetContext().City.Add(NewCity);
                        Data.MasterPolDataEntities.GetContext().SaveChanges();

                    }


                    if (Data.MasterPolDataEntities.GetContext().Street.Any(d => d.StreetName == a2))
                    {
                        var searchStreet = Data.MasterPolDataEntities.GetContext().Street.Where(d => d.StreetName == a2).FirstOrDefault();
                        _NewAdress.AdressPartnerIdStreet = searchStreet.StreetId;
                    }
                    else
                    {
                        _NewAdress.AdressPartnerIdStreet = Data.MasterPolDataEntities.GetContext().Street.Max(d => d.StreetId + 1);
                        Data.Street NewStreet = new Data.Street();
                        NewStreet.StreetName = a2;
                        Data.MasterPolDataEntities.GetContext().Street.Add(NewStreet);
                        Data.MasterPolDataEntities.GetContext().SaveChanges();

                    }
                    _NewAdress.AdressPartnerIndex = a0;
                    _NewAdress.AdressPartnerIdHouse = a3;
                    Data.MasterPolDataEntities.GetContext().AdressPartners.Add(_NewAdress);
                    Data.MasterPolDataEntities.GetContext().SaveChanges();
                    _CurrrentPartner.PartnerAdressId = Data.MasterPolDataEntities.GetContext().AdressPartners.Max(d => d.AdressPartnerId);
                }
                Data.MasterPolDataEntities.GetContext().SaveChanges();
                MessageBox.Show("Успешно изменено","Успех",MessageBoxButton.OK,MessageBoxImage.Information);
            }

           }

        private void BAckButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ViewPartnerPage());
        }
    }
}
