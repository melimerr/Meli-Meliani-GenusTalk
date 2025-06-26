<?php
session_start();
include 'koneksi.php';

if (!isset($_SESSION['id']) || !isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

$id = $_SESSION['id'];

// Ambil data user termasuk nama file foto
$query = "SELECT foto_profil FROM users WHERE id = $id";
$result = mysqli_query($conn, $query);
$user = mysqli_fetch_assoc($result);

// Jika tidak ada foto, pakai default
$foto = !empty($user['foto_profil']) ? 'uploads/' . $user['foto_profil'] : 'assets/img/default-avatar.jpg';
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Buat Pertanyaan - GenusTalks</title>

<style>
  * {
    box-sizing: border-box;
  }

  body, html {
    margin: 0;
    padding: 0;
    font-family: Poppins;
    background-color: #f9f9f9;
  }

  main.main {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    padding: 24px 16px;
  }

  .create-form {
    width: 100%;
    max-width: 600px;
    background: #fff;
    padding: 24px;
    border-radius: 8px;
    box-shadow: 0 0 8px rgba(0,0,0,0.1);
  }

  .create-form form {
    display: flex;
    flex-direction: column;
    gap: 12px;
  }

  .create-form h2 {
    margin-bottom: 20px;
    font-size: 24px;
    text-align: center;
    color: #7a0029;
  }

  .create-form label {
    font-weight: bold;
    margin-bottom: 4px;
  }

  .create-form input,
  .create-form textarea {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 6px;
  }

  .create-form .tags-note {
    font-size: 12px;
    color: #777;
  }

  .create-form .create-btn {
    padding: 12px;
    font-size: 16px;
    background-color: #7a0029;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background 0.3s ease;
  }

  .create-form .create-btn:hover {
    background-color: #5c0020;
  }

  @media (max-width: 768px) {
    .create-form {
      padding: 16px;
    }

    .create-form h2 {
      font-size: 20px;
    }
  }
</style>

</head>
<body>

<main class="main">
  <div class="create-form">
    <h2>Buat Pertanyaan</h2>
    <form action="save_question.php" method="post" enctype="multipart/form-data">
      <label for="title">Judul Pertanyaan</label>
      <input type="text" id="title" name="title" placeholder="Contoh: Bagaimana cara belajar JavaScript dengan efektif?" required />

      <label for="description">Deskripsi</label>
      <textarea id="description" name="description" rows="4" placeholder="Tuliskan detail pertanyaan kamu di sini..." required></textarea>

      <label for="tags">Tag</label>
      <input type="text" id="tags" name="tags" placeholder="Contoh: #javascript #belajar" />
      <div class="tags-note">Gunakan tanda koma atau spasi untuk memisahkan tag.</div>

      <label for="gambar">Upload Gambar:</label>
      <input type="file" name="gambar" id="gambar" accept="image/*">

      <button type="submit" class="create-btn">Kirim Pertanyaan</button>
    </form>
  </div>
</main>

</body>
</html>
