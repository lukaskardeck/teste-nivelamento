<template>
    <div>
        <input
            v-model="nome"
            @input="checarNome"
            placeholder="Digite a razão social ou nome fantasia"
        />
        <button @click="emitBuscar">Buscar</button>
    </div>
</template>

<script>
export default {
    data() {
        return {
            nome: "",
        };
    },

    methods: {
        checarNome() {
            if (!this.nome.trim()) {
                this.emitBuscar();
            }
        },
        emitBuscar() {
            this.$emit("buscar", this.nome);
        },
    },
};
</script>

<style scoped>
input {
    min-height: 50px;
    width: 350px;
    padding: 0 1rem;
    font-size: 15px;
    border: none;
    border-radius: 6px 0 0 6px;
}

button {
    min-height: 50px;
    padding: 0.5em 1em;
    border: none;
    border-radius: 0 6px 6px 0;
    background-color: #272643;
    color: #fff;
    font-size: 15px;
    cursor: pointer;
}

button:hover {
    background-color: #36355f;
}

input:focus, input:focus-visible {
  outline: none;
}

</style>
