import random

def generate_phone_number():
    # Gere um número de telefone de 10 dígitos
    phone_number = ''.join(str(random.randint(0, 9)) for _ in range(11))
    return phone_number