# Linux-Bash-Project

## Tanıtım
Bu kodun amacı bilgisayarda görünmez bir klasör yani kasa oluşturmak ve linux'da zaten var olan <b>gpg</b> ile <b>whiptail</b>'in sağladığı arayüz bileşenleri aracılığı yardımıyla şifrelemek ve şifrelenen dosyaları bu görünmez klasöre taşımak aynı zamanda şifrelenen dosyanın ismini girerek şifreli dosyanın şifresini kaldırıp görünmez (gizli) klasörden çıkarmaktır. Bir nevi kendi kişisel güvenli kasanızı oluşturmak.

## Nasıl Çalışıyor
Bu kod parçası gerekli kasayı kendi çalışma dizininde oluşturmaktadır aynı zamanda şifreleyeceğiniz dosyalarda kasanın ve kodun bulunduğu dizinde olmalıdır. <b>Sudo</b> şifresi sayesinde <b>chmod</b> ile kullanıcının klasör üstündeki yetkisi program sonlandırılmadan önce <b>000</b> ile tamamen kaldırılıyor script çalıştırıldığı zaman ve sudo şifresi doğru girildiği zaman <b>700</b> kodu ile kullanıcıya bütün yetkiler geri veriliyor. Bu şekilde yaparak klasörün script dışında erişilmesini engelliyorum. 
<br />
<br />
Eğer dosya ismi doğru girilmişse gpg paketi ile dosya simetrik olarak şifreleniyor ve aynı zamanda koyulan şifre kaldırılabiliniyor. Dosya şifrelenince şifrelenen dosya kasaya taşınmaktadır ve orjinal hali silinmektedir. Şifre kaldırılırken de bu işlemin tam tersi yapılmaktadır. 
<br />
<br />

## Kurulum&Çalıştırma
<b>Dosyayı çalıştırmak için yapılması gerekenler</b>
* ```git clone https://github.com/ErdalNayir/Linux-Bash-Project.git ``` ile bu repo local makineye kopyala
* Terminal üzerinden scriptin bulunduğu dizine cd komutu ile git 
* Aşağıdaki kodu yazarak programı çalıştır
```bash
bash SuperSafeErdalNayir.sh
````
<br />
Böylece program çalışmaya başlayacaktır.

## Gerekli Paketler ve Kodlar

Kodun nasıl çalıştığını açıklamadan önce gerekli pakatlerden bahsetmek lazım. Bu projede şifreleme için linuxta zaten var olan <b>gpg</b> paketeni kullandım. Görsel arayüz için ise <b>whiptail</b> paketini kullandım. 

* ### Whiptail Nedir?
  Whiptail, çeşitli sorular sunmanıza veya mesajları görüntülemenize izin veren daha kullanıcı dostu bir arayüz tasarlamayı sağlayan bir programdır.<br />
  Whiptail'in sahip olduğu bileşenler şunlardır:
  <br />
  <br />
  * message box
  * yes/no box
  * info box
  * input box
  * password box
  * text box
  * menu box
  * checklist box
  * radiolist box
  * gauge box

  <b> Aşağıdaki komut ile gerekli paket indirilebilir</b>
  ```bash
  sudo apt-get install whiptail
  ```

* ### GPG Nedir?
  GPG <b>(GnuPG / GNU Privacy Guard) GPG (GnuPG / GNU Privacy Guard), GPL</b> lisansına sahip, açık kaynak kodlu bir hibrit-şifreleme yazılımıdır. Hibrit-şifreleme simetrik ve asimetrik şifreleme sistem algoritmalarının iyi yönlerinin bir birleşimi sağlayan bir yapıdır. Bu yapı sayesinde dosyalar, zipler güvenli bir şekilde şifrelenmektedir.<br /><br />
  <b> Aşağıdaki komut ile gerekli paket indirilebilir</b>
  ```bash
  sudo apt-get install gpg
  ```
  
## Detaylar
 <img src="https://github.com/ErdalNayir/Linux-Bash-Project/blob/main/assets/Screenshot%20from%202023-01-02%2020-35-14.png" alt="starting screen" width="1100" height="600"/>


  
