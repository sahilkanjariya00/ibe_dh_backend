# Biometric Based Secure Key Establishment for Secure Key Exchange (Diffie Hellman)
This project enables two parties to establish a shared Diffie–Hellman key by leveraging
face-based IBE to protect each party’s half-key. Users first register by submitting a face
image and password, the system extracts a biometric embedding, deterministically
derives an IBE key pair from it, encrypts the private key under the user’s password, and
stores the embedding and public key in database. Each user’s face image is captured, re-
embedded and matched against the stored embedding; on successful verification, the stored public key is released. Each party then encrypts their Diffie–Hellman half-key
under the other’s IBE public key. When both encrypted halves are exchanged, each side
decrypts the received half with their IBE private key to compute the shared DH secret.

## Steps to run project.
pip install -r requirements.txt

source venv/bin/activate

uvicorn app.main:app --reload --host 0.0.0.0 --port 8000