import turicreate as tc

url = "dataset/"

data = tc.image_analysis.load_images(url)

data["animalType"] = data["path"].apply(lambda path: "Dog" if "dog" in path else "Cat")

data.save("dog_or_cat.sframe")

data.explore()

dataBuffer = tc.SFrame("dog_or_cat.sframe")

trainingBuffers, testingBuffers = dataBuffer.random_split(0.9)

model = tc.image_classifier.create(trainingBuffers, target="animalType", model="squeezenet_v1.1")

evaluations = model.evaluate(testingBuffers)
print(evaluations["accuracy"])

model.save("dog_or_cat.model")
model.export_coreml("DogCatClassifier.mlmodel")
