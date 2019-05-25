<?php
                      
// Fungsi header dengan mengirimkan raw data excel
header("Content-type: application/vnd-ms-excel");
 
// Mendefinisikan nama file ekspor "hasil-export.xls"
header("Content-Disposition: attachment; filename=anggota.xls");
 
// memanggil query dari database

                            include('../config/koneksi.php');
                            include('../config/tgl_indonesia.php');

                            // jalankan query
                            $result = mysqli_query($connect, "SELECT tb_pengembalian.*,tb_buku.*,tb_anggota.*
                              FROM tb_pengembalian,tb_buku,tb_anggota
							  WHERE tb_pengembalian.kd_buku=tb_buku.kd_buku
							  AND tb_pengembalian.id_anggota=tb_anggota.id_anggota
							  ORDER BY kd_pinjam DESC");
        
            ?>
      
 
    <h3>Data Pengembalian</h3>   
         
        <table bordered="1">  
            <thead bgcolor="green" align="center">
            <tr>
                        <th>Kode Pengembalian</th>
                        <th>Nama Anggota</th>
                        <th>Judul Buku</th>
                        <th>Tanggal Pinjam</th>
						<th>Tanggal Kembali</th>
						<th>Lama Pinjam</th>
						<th>Denda</th>
                      </tr>
            </thead>
            <tbody>
         
                    
        </tbody>

        </div>
    </div>
</div>
   <?php

                            
                            $no=1; 
                            // tampilkan query
                            while ($row=mysqli_fetch_array($result,MYSQLI_ASSOC))
                            { ?>
                      <tr>
					    <td><?php echo $row['kd_pinjam'];?></td>
						<td><?php echo $row['nm_anggota'];?></td>
                        <td><?php echo $row['judul_buku'];?></td>                        
                        <td><?php echo tgl_indo($row['tgl_pinjam']);?></td>
                        <td><?php echo tgl_indo($row['tgl_kembali']);?></td>
						<td><?php echo $row['lama_pinjam'];?></td>
                        <td><?php echo $row['denda'];?></td>
                      </tr>
                      <?php } ?>                            
                        </table>       
