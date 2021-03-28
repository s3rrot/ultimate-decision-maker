<template>
  <div id="app">
    <section
      class="hero is-fullheight"
      :class="{
        'is-info': yourAnswer,
        'is-primary': !yourAnswer
      }"
    >
      <div class="hero-body">
        <div class="container answer" v-if="yourAnswer">
          <div class="columns is-centered">
            <div class="column is-full has-text-centered">
              <figure class="image is-square">
                <img
                  v-if="yourAnswer && !isLoading"
                  :src="yourAnswer.image"
                  :alt="yourAnswer.answer"
                />
              </figure>
            </div>
          </div>
          <div class="columns is-centered">
            <div class="column is-full has-text-centered">
              <a class="button is-rounded" @click="fetchData()">Ask another question</a>
            </div>          
          </div>
        </div>

        <div class="container question" v-else>
          <p class="title">Ask your question and click the button</p>
          <p class="subtitle">Remember to ask a simple question which could be answered by YES/NO.</p>
          <div class="columns">
            <div class="column is-two-fifths">
              <p class="is-size-7 ">For example, you could ask "Should I eat healthier?" But before you
              start let me recommend that yes, you should, no matter the response
              you get from the app. ;)</p>
            </div>
          </div>

          <p><a class="button is-rounded" @click="fetchData()">Get the Answer</a></p>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      yourAnswer: null,
      isLoading: false
    }
  },
  methods: {
    fetchData() {
      this.getResponse()
    },
    async getResponse() {
      this.switchLoading()
      await fetch("https://yesno.wtf/api")
        .then((response) => response.json())
        .then((data) => {
          this.yourAnswer = data
          this.switchLoading()
        })
    },
    clearData() {
      this.yourAnswer = null
    },
    switchLoading() {
      this.isLoading = !this.isLoading
    }
  }
}
</script>
