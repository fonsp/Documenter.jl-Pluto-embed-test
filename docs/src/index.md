# Coool

*Documentation goes here.*

```@docs
Coool.Coool
```

I can embed a Pluto notebook inside a Documenter md document:


```@raw html

    <script data-pluto-file="launch-parameters">
        window.pluto_notebookfile = "https://bucket1.pluto.land/n/01JVKXFS45K76H3Y8HY3J158JA.jl";
        window.pluto_disable_ui = true;
        window.pluto_binder_url = "https://mybinder.org/v2/gh/fonsp/pluto-on-binder/v0.20.8";
        window.pluto_statefile = "https://bucket1.pluto.land/n/01JVKXFS45K76H3Y8HY3J158JA.plutostate";
        window.pluto_recording_url = undefined;
        window.pluto_recording_audio_url = undefined;
    </script>
    
    
    
    
        <div style="display:flex; overflow-y: hidden;"> <pluto-editor class="loading"> <progress style="filter:grayscale()" class="delete-me-when-live statefile-fetch-progress" max="100"></progress> </pluto-editor> </div>
        
```


And here is some more Documenter content at the bottom.

```@repl
a = 1
b = 2
a + b
```

