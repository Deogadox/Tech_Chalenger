import kagglehub
import os
import shutil

# ============================================================
# CONFIGURAÇÕES
# ============================================================

DATASET = "olistbr/brazilian-ecommerce"

PASTA_DESTINO = r"C:\Users\felip\Downloads\archive"


# ============================================================
# DOWNLOAD
# ============================================================

print("Baixando dataset do Kaggle...")

caminho_download = kagglehub.dataset_download(DATASET)

print(f"\nDataset baixado em:")
print(caminho_download)


# ============================================================
# CRIA PASTA DE DESTINO
# ============================================================

os.makedirs(
    PASTA_DESTINO,
    exist_ok=True
)


# ============================================================
# COPIA OS ARQUIVOS PARA A PASTA DEFINIDA
# ============================================================

print("\nCopiando arquivos...")

for arquivo in os.listdir(caminho_download):

    origem = os.path.join(
        caminho_download,
        arquivo
    )

    destino = os.path.join(
        PASTA_DESTINO,
        arquivo
    )

    if os.path.isfile(origem):

        shutil.copy2(
            origem,
            destino
        )

        print(f"✓ {arquivo}")


print("\n" + "=" * 60)
print("DOWNLOAD CONCLUÍDO!")
print("=" * 60)

print(f"\nArquivos disponíveis em:")
print(PASTA_DESTINO)