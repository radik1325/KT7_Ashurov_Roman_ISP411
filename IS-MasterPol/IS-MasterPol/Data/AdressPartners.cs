//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IS_MasterPol.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class AdressPartners
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public AdressPartners()
        {
            this.Partners = new HashSet<Partners>();
        }
    
        public int AdressPartnerId { get; set; }
        public string AdressPartnerIndex { get; set; }
        public int AdressPartnerIdArea { get; set; }
        public int AdressPartnerIdCity { get; set; }
        public int AdressPartnerIdStreet { get; set; }
        public string AdressPartnerIdHouse { get; set; }
    
        public virtual Area Area { get; set; }
        public virtual City City { get; set; }
        public virtual Street Street { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Partners> Partners { get; set; }
    }
}
