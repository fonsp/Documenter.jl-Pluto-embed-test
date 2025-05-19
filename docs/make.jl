# see documentation at https://juliadocs.github.io/Documenter.jl/stable/
import Pkg
Pkg.resolve()
Pkg.instantiate()

using Documenter, Coool



import Pluto



const pluto_head = let
    default = Pluto.generate_html(;
    pluto_cdn_root=Pluto.PLUTO_VERSION < v"0.20.10" ? "https://cdn.jsdelivr.net/gh/fonsp/Pluto.jl@2064146d/frontend/" : nothing
    )
    m = match(r"<head.*?>(.*)</head>"s, default)
    reduce([
        # r"<script[^\n]data-pluto-file=[\"']?launch-parameters.*?/script>"s
        r"<title.*?/title>"
        r"<meta name=[\"']?description.*?>"
        r"<link rel=[\"']?icon.*?>"
    ]; init=m[1]) do s,r
        replace(s, r => "")
    end
end


# Override some Documenter styles that interfere with Pluto. Not crucial but it does make Pluto look weird.
extras = """
<style>
.content :where(pluto-editor) {
    pre {
        border: none;
        background: none;
        
        code {
            padding: 0;
        }
        code:is(:first-of-type, :last-of-type) {
            padding: unset !important;
        }
    }
}
</style>
"""




assets = [
    Documenter.HTMLWriter.RawHTMLHeadContent(pluto_head * extras)
]



makedocs(
    modules = [Coool],
    format = Documenter.HTML(; 
        prettyurls = get(ENV, "CI", nothing) == "true", 
        assets = assets,
    ),
    authors = "{USERNAME}",
    sitename = "Coool.jl",
    pages = Any["index.md"],
    remotes = nothing,
    # strict = true,
    # clean = true,
    # checkdocs = :exports,
)

# # Some setup is needed for documentation deployment, see “Hosting Documentation” and
# # deploydocs() in the Documenter manual for more information.
# deploydocs(
#     repo = "github.com/{GHUSER}/Coool.jl.git",
#     push_preview = true
# )
