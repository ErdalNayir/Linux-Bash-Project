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
* <b>Program çalışmaya başladığında kullanıcıyı aşağıdaki gibi bir giriş ekranı karşılar</b>
 <img src="https://github.com/ErdalNayir/Linux-Bash-Project/blob/main/assets/Screenshot%20from%202023-01-02%2020-35-14.png" alt="starting screen" width="1100" height="600"/><br /><br />
* <b>Burada "Ok" basıldıktan sonra kullanıcıdan sudo şifresi istenir</b>
<img src="https://github.com/ErdalNayir/Linux-Bash-Project/blob/main/assets/Screenshot%20from%202023-01-02%2020-35-52.png" alt="get sudo password" width="1100" height="600"/><br /><br />
* <b>Daha önceden kasa oluşturulmadıysa ve sudo yanlış girildiyse program çalışmayı durdurur</b>
<img src="https://github.com/ErdalNayir/Linux-Bash-Project/blob/main/assets/Screenshot%20from%202023-01-02%2020-36-03.png" alt="stop operating" width="1100" height="600"/><br /><br />
* <b>Scriptin ulunduğu dizinde daha önce kasa oluşturulmadıysa bir seferliğe mahsus yeni kasa oluşturulur</b>
<img src="https://github.com/ErdalNayir/Linux-Bash-Project/blob/main/assets/Screenshot%20from%202023-01-02%2020-36-15.png" alt="create safe one time only" width="1100" height="600"/><br /><br />
* <b>Kasa başarılı bir şekilde oluşursa ya da kasa daha önceden oluşmuş ve şifre doğru girilmişse Menu ekranda belirir</b>
<img src="https://github.com/ErdalNayir/Linux-Bash-Project/blob/main/assets/Screenshot%20from%202023-01-02%2020-36-19.png" alt="open menu" width="1100" height="600"/><br /><br />
* <b>Menuden dosya şifrele işlemi seçildiğinde kullanıcıdan input alınır ve script ile aynı dizinde bulunan ve şifrelenmek istenen dosyanın ismi bu alana girilir</b>
<img src="https://github.com/ErdalNayir/Linux-Bash-Project/blob/main/assets/Screenshot%20from%202023-01-02%2020-36-21.png" alt="open menu" width="1100" height="600"/><br /><br />
* <b>Dosya ismi doğru girilmiş ise gpg paketi kullanıcıdan dosyayı şifrelemek için passphrase ister (Passphrase unutulursa dosyanız hiçbir şekilde kurtarılamaz)</b>
<img src="https://github.com/ErdalNayir/Linux-Bash-Project/blob/main/assets/Screenshot%20from%202023-01-02%2020-36-27.png" alt="open menu" width="1100" height="600"/><br /><br />
* <b>Dosya şifresi kaldırmak için ise Kasa içinde bulunan şifresi kaldırılacak dosyanın ismi yazılır</b>
<img src="https://github.com/ErdalNayir/Linux-Bash-Project/blob/main/assets/Screenshot%20from%202023-01-02%2020-36-50.png" alt="open menu" width="1100" height="600"/><br /><br />
* <b>Eğer dosya bulunursa tekrardan passphrase istenir ve istenilen şifre doğru girilirse şifre kaldırılır ve dosya scriptin bulunduğu dizine taşınır</b>
<img src="https://github.com/ErdalNayir/Linux-Bash-Project/blob/main/assets/Screenshot%20from%202023-01-02%2020-36-56.png" alt="open menu" width="1100" height="600"/><br /><br />
* <b>Eğer menüdeyken Cancel ya da çıkış seçeneğine tıklanırsa uygulama sonlanır ve kasanın yetkisi 000 ile değiştirilir</b>
<img src="https://github.com/ErdalNayir/Linux-Bash-Project/blob/main/assets/Screenshot%20from%202023-01-02%2020-37-04.png" alt="open menu" width="1100" height="600"/><br /><br />

## Notlar
Bu kod yazılırken bazı çözümü olmayan durumlarla karşılaştım<br />
* sudo bir kez doğru çalışınca, scripteyken sudo şifresini yanlış yazsanız bile program çalışacaktır. Bu büyük ihtimalle sudo şifresi bir kez doğru yazılınca terminal bu şifreyi saklıyor olabilir.
* Aynı durum passphrase işlemi içinde geçerlidir. pashphrase doğru girilince aynı dosya üzerinde yine işlem yaparken şifre istemeden dosya kiliti açılabilmektedir.
* Passphrase kısmını whiptail ile çalışma şekli olmadığından kendi arayüzünü kullandım

#### [Video Url'si](https://youtu.be/ghL5_3M7f8Y)

