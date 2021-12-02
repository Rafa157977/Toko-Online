<?php 
    include "header.php";
?>
<h2>Histori Pembelian Senjata</h2>
<table class="table table-hover table-striped">
    <thead>
        <th>NO</th><th>Tanggal Beli</th><th>Nama Senjata</th><th>Status</th>
    </thead>
    <tbody>
        <?php 
        include "koneksi.php";
        $qry_histori=mysqli_query($conn,"select * from pembelian_senjata order by id_pembelian_senjata desc");
        $no=0;
        while($dt_histori=mysqli_fetch_array($qry_histori)){
            $no++;
            $senjata_dibeli="<ol>";
            $qry_senjata=mysqli_query($conn,"select * from  detail_pembelian_senjata join senjata on senjata.id_senjata=detail_pembelian_senjata.id_senjata where id_pembelian_senjata = '".$dt_histori['id_pembelian_senjata']."'");
            while($dt_senjata=mysqli_fetch_array($qry_senjata)){
                $senjata_dibeli.="<li>".$dt_senjata['nama_senjata']."</li>";
            }
            $senjata_dibeli.="</ol>";
            $qry_cek_kembali=mysqli_query($conn,"select * from * id_pembelian_senjata");
        ?>
            <tr>
            <td><?=$no?></td><td><?=$dt_histori['tanggal_pinjam']?></td><td><?=$dt_histori['tanggal_kembali']?></td><td><?=$senjata_dibeli?></td><td><?=$status_kembali?></td><td><?=$button_kembali?></td>
            </tr>
        <?php
        }
        ?>
    </tbody>
</table>
<?php 
    include "footer.php";
?>