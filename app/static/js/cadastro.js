const cep = document.querySelector('#cep');
const uf = document.querySelector('#uf');
const cidade = document.querySelector('#cidade');
const bairro = document.querySelector('#bairro');
const endereco = document.querySelector('#endereco');
const message = document.querySelector('#message');

cep.addEventListener('focusout', async () => {
    

    try {
        const onlyNumbers = /^[0-9]+$/;
        const cepValid = /^[0-9]{8}$/;
    
        if(!onlyNumbers.test(cep.value) || !cepValid.test(cep.value)) {
            throw {cep_error: 'CEP INVALIDO' };
        }

        const response = await fetch(`https://viacep.com.br/ws/${cep.value}/json/`)

        if (!response.ok) {
            throw await response.json();
        }

        const responseCep = await response.json();
        
            uf.value = responseCep.uf;
            cidade.value = responseCep.localidade;
            bairro.value = responseCep.bairro;
            endereco.value = responseCep.logradouro;

    }   catch (error) {
        if (error?.cep_error) {
            message.textContent = error.cep_error;
            setTimeout(() => {
                message.textContent = '';
            },  5000);

        }
        console.log(error);
    }
})
