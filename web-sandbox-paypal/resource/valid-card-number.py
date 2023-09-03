from faker import Faker
import random

def generate_valid_credit_card_number():
    # Inicialize o Faker
    fake = Faker()
    
    # Gere um número de cartão de crédito fictício
    card_number = fake.credit_card_number(card_type="mastercard")  # Você pode escolher a bandeira desejada
    
    # Verifique a validade usando o algoritmo de Luhn
    if is_valid_credit_card_number(card_number):
        return card_number
    else:
        # Se não for válido, gere outro número recursivamente
        return generate_valid_credit_card_number()

def is_valid_credit_card_number(card_number):
    # Remove espaços em branco e caracteres não numéricos
    card_number = ''.join(filter(str.isdigit, card_number))
    
    # Aplica o algoritmo de Luhn para verificar a validade
    checksum = 0
    length = len(card_number)
    for i in range(length - 2, -1, -2):
        digit = int(card_number[i])
        digit *= 2
        if digit > 9:
            digit -= 9
        checksum += digit
    for i in range(length - 1, -1, -2):
        checksum += int(card_number[i])
    return checksum % 10 == 0