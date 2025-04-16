import gradio as gr
import requests
import json

# FastAPI endpoint URL
API_URL = "http://localhost:8000/chat"

def query_model(question, context):
    """Function to query the FastAPI backend"""
    try:
        # Prepare the request payload
        payload = {
            "question": question,
            "context": context
        }
        
        # Make the POST request to the FastAPI endpoint
        response = requests.post(API_URL, json=payload)
        
        # Check if the request was successful
        if response.status_code == 200:
            result = response.json()
            return result["answer"]
        else:
            return f"Error: {response.status_code} - {response.text}"
    
    except Exception as e:
        return f"Error connecting to API: {str(e)}"

# Create Gradio interface
with gr.Blocks(title="Question Answering System") as demo:
    gr.Markdown("# Question Answering System")
    gr.Markdown("Enter a question and context to get an answer using the DistilBERT model.")
    
    with gr.Row():
        with gr.Column():
            # Input components
            question_input = gr.Textbox(label="Question", placeholder="Enter your question here...")
            context_input = gr.Textbox(
                label="Context", 
                placeholder="Enter the context/passage here...",
                lines=10
            )
            submit_button = gr.Button("Get Answer")
        
        with gr.Column():
            # Output component
            answer_output = gr.Textbox(label="Answer", lines=5)
            
    # Set up the submit action
    submit_button.click(
        fn=query_model,
        inputs=[question_input, context_input],
        outputs=answer_output
    )
    
    # Examples for users to try
    gr.Examples(
        examples=[
            [
                "Who was the first president of the United States?",
                "George Washington was the first president of the United States. He served from 1789 to 1797."
            ],
            [
                "What is the capital of France?",
                "Paris is the capital and most populous city of France. It is located on the Seine River."
            ],
            [
                "What are neural networks?",
                "Neural networks are a set of algorithms, modeled loosely after the human brain, that are designed to recognize patterns. They interpret sensory data through a kind of machine perception, labeling or clustering raw input. The patterns they recognize are numerical, contained in vectors, into which all real-world data, be it images, sound, text or time series, must be translated."
            ]
        ],
        inputs=[question_input, context_input]
    )

# Launch the Gradio interface
if __name__ == "__main__":
    demo.launch(server_name="0.0.0.0", server_port=7860)
    # demo.launch(share=True)